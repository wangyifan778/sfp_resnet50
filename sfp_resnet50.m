%%%%%%%%%%%%%%%%%%%%%%%input(224*224*3)%%%%%%%%%%%%%%%%%%%%%%%
clear;
original_pic = imread('test101.jpg');
original_pic = single(original_pic); %kenengmeiyouwenti
modelfile = 'resnet_50.h5';
lgraph = importKerasLayers(modelfile,'ImportWeights',true);
eps = 1e-5;
%original image:float32_to_sfp

%conv1_zeropadding(230*230*3),(3,3,3,3)
image_r = original_pic(:,:,1);
image_g = original_pic(:,:,2);
image_b = original_pic(:,:,3);

image_r = padarray(image_r, [3 3]);
image_g = padarray(image_g, [3 3]);
image_b = padarray(image_b, [3 3]);

% image_r = padarray(image_r, [1 1]);%padding[0,0,0,0]
% image_g = padarray(image_g, [1 1]);
% image_b = padarray(image_b, [1 1]); %[232*232]
% r=image_r([3:9],[3:9]);
% g=image_g([3:9],[3:9]);
% b=image_b([3:9],[3:9]);

%merge 
weights = lgraph.Layers(3,1).Weights; %7*7*3*64
bias1 = lgraph.Layers(3,1).Bias; %1*1*64
size_weight = size(weights); %[7 7 3 64]
image_channels = size_weight(3);
filters = size_weight(4); %64
kernels = size_weight(1); %7

trained_mean = lgraph.Layers(4,1).TrainedMean;
trained_variance = lgraph.Layers(4,1).TrainedVariance;
beta = lgraph.Layers(4,1).Offset;
gamma = lgraph.Layers(4,1).Scale; %[1*1*64]

for weight_filters = 1:filters
  for weight_channels = 1:image_channels
    for weight_row = 1:kernels
      for weight_line = 1:kernels
        weights(weight_row,weight_line,weight_channels,weight_filters) = weights(weight_row,weight_line,weight_channels,weight_filters) * gamma(:,:,weight_filters) / (sqrt(trained_variance(:,:,weight_filters) + eps));
      end
    end
  end
  bias1(:,:,weight_filters) = gamma(:,:,weight_filters) * (bias1(:,:,weight_filters) - trained_mean(:,:,weight_filters)) / (sqrt(trained_variance(:,:,weight_filters) + eps)) + beta(:,:,weight_filters);
end
% 
% weights(:,:,1,1);
% ba=bias1(:,:,1);
% r=r.*weights(:,:,1,1);
% g=g.*weights(:,:,2,1);
% b=b.*weights(:,:,3,1);
% sum(sum(r));
% sum(sum(g));
% sum(sum(b));
% s=sum(sum(r))+sum(sum(b))+sum(sum(g))+ba;



%conv1_conv
image_r = padarray(image_r, [1 1]);%padding[0,0,0,0]
image_g = padarray(image_g, [1 1]);
image_b = padarray(image_b, [1 1]); %[232*232]
pic(:,:,1) = image_r;
pic(:,:,2) = image_g;
pic(:,:,3) = image_b;

image_size = size(image_r);
image_size = image_size(1); 

strides = 2;
image_conv_row = (image_size - kernels + 1) / strides;
image_conv_line = ceil(image_conv_row);
image_conv_row = image_conv_line;

for filter_conv = 1:filters
  for image_conv_channels = 1:image_channels
    for image_conv_r = 1:image_conv_row
      for image_conv_l = 1:image_conv_line
        conv_mul = [];
        count = 1;
        pic_r = 1 + strides * (image_conv_r - 1) ;
        for conv_r = 1:kernels
          pic_l = 1 + strides * (image_conv_l - 1);
          for conv_l = 1:kernels
            conv_mul(count) = pic(pic_r,pic_l,image_conv_channels) * weights(conv_r,conv_l,image_conv_channels,filter_conv);
            if pic_l < image_size
              pic_l = pic_l + 1;
              count = count + 1;
            end
          end
          pic_r = pic_r + 1;
        end
        image_conv(image_conv_r,image_conv_l,image_conv_channels,filter_conv) = sum(conv_mul);
      end 
    end
  end
end

% image_conv([1:4],[1:4],1,1);
% image_conv(:,:,2,1);
% image_conv(:,:,3,1);

image_conv_out = zeros(image_conv_row,image_conv_line,filters);
for filter_conv = 1:filters
  for image_conv_r = 1:image_conv_row
    for image_conv_l = 1:image_conv_line
      for image_conv_channels = 1:image_channels
        image_conv_out(image_conv_r,image_conv_l,filter_conv) = image_conv(image_conv_r,image_conv_l,image_conv_channels,filter_conv) + image_conv_out(image_conv_r,image_conv_l,filter_conv);
      end
      image_conv_out(image_conv_r,image_conv_l,filter_conv) =  image_conv_out(image_conv_r,image_conv_l,filter_conv) + bias1(:,:,filter_conv);
    end
  end
end
image_conv_out(:,:,1);

%conv1_relu
for filter_bn = 1:filters
  for image_bn_r = 1:image_conv_row
    for image_bn_l = 1:image_conv_line
      if image_conv_out(image_bn_r,image_bn_l,filter_bn) < 0
        image_conv_out(image_bn_r,image_bn_l,filter_bn) = 0;
      end
    end
  end
end    
image_conv_out(:,:,1);

%ZeroPadding(1,1,1,1)
for filter_padding = 1:filters
  image_padding = image_conv_out(:,:,filter_padding);
  image_padding = padarray(image_padding, [1 1]);
  image_padding_out(:,:,filter_padding) = image_padding;
end

%MaxPooling(3*3,strides=2)
strides = 2;
pool_size = 3;

for filter_pool = 1:filters
  image_pool = image_padding_out(:,:,filter_pool);
  image_pool = padarray(image_pool, [1 1]);
  image_pool_out(:,:,filter_pool) = image_pool; %padding(0,0,0,0)
end
image_pool_out(:,:,1);
image_size = size(image_pool_out);
image_size = image_size(1);
image_pool_row = (image_size - pool_size + 1) / 2;
image_pool_line = ceil(image_pool_row);
image_pool_row = image_pool_line;
image_pool = zeros(image_pool_row,image_pool_line,filters);


for filter_pool = 1:filters
  for image_pool_r = 1:image_pool_row
    for image_pool_l = 1:image_pool_line
      image_r = 1 + strides * (image_pool_r - 1);
      for pool_r = 1:pool_size
        image_l = 1 + strides * (image_pool_l - 1);
        for pool_l = 1:pool_size
          if image_pool(image_pool_r,image_pool_l,filter_pool) < image_pool_out(image_r,image_l,filter_pool)
            image_pool(image_pool_r,image_pool_l,filter_pool) = image_pool_out(image_r,image_l,filter_pool);
          end
          if image_r < image_size
            image_l = image_l + 1;
          end
        end
        if image_l <image_size
          image_r = image_r + 1;
        end
      end
    end 
  end
end
image_pool([1:3],[1:3],1)


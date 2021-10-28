%%%%%%%%%%%%%%%%%%%%%%%input(224*224*3)%%%%%%%%%%%%%%%%%%%%%%%
clear;
image = imread('ILSVRC2012_val_00000018.JPEG');
image = single(image); 
modelfile = 'resnet_50.h5';
lgraph = importKerasLayers(modelfile,'ImportWeights',true);
eps = 1.0010e-5;
%original image:float32_to_sfp

%conv1_zeropadding(230*230*3),(3,3,3,3)
image = zero_padding(image,3);

%conv1_bn merge
weights = lgraph.Layers(3,1).Weights; %7*7*3*64
bias = lgraph.Layers(3,1).Bias; %1*1*64
trained_mean = lgraph.Layers(4,1).TrainedMean;
trained_variance = lgraph.Layers(4,1).TrainedVariance;
beta = lgraph.Layers(4,1).Offset;
gamma = lgraph.Layers(4,1).Scale;
[weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);

%conv1_conv
image  = conv(weights,bias,2,image,0);

%conv1_relu
image = relu(image);

%pool1_pad
image = zero_padding(image,1);

%pool1_pool
image = maxpooling(image,2,3,0);

%conv2_block1
image = block1(image,14,16,1,0,8,9,1,0,11,12,1,15,17,1,0);

%conv2_block2
image = block(image,20,21,1,0,23,24,1,26,27,1,0);

%conv2_block3
image = block(image,30,31,1,0,33,34,1,36,37,1,0);

%conv3_block1
image = block1(image,46,48,2,0,40,41,2,0,43,44,1,47,49,1,0);

%conv3_block2
image = block(image,52,53,1,0,55,56,1,58,59,1,0);

%conv3_block3
image = block(image,62,63,1,0,65,66,1,68,69,1,0);

%conv3_block4
image = block(image,72,73,1,0,75,76,1,78,79,1,0);

%conv4_block1
image = block1(image,88,90,2,0,82,83,2,0,85,86,1,89,91,1,0);

%conv4_block2
image = block(image,94,95,1,0,97,98,1,100,101,1,0);

%conv4_block3
image = block(image,104,105,1,0,107,108,1,110,111,1,0);

%conv4_block4
image = block(image,114,115,1,0,117,118,1,120,121,1,0);

%conv4_block5
image = block(image,124,125,1,0,127,128,1,130,131,1,0);

%conv4_block6
image = block(image,134,135,1,0,137,138,1,140,141,1,0);

%conv5_block1
image = block1(image,150,152,2,0,144,145,2,0,147,148,1,151,153,1,0);

%conv5_block2
image = block(image,156,157,1,0,159,160,1,162,163,1,0);

%conv5_block3
image = block(image,166,167,1,0,169,170,1,172,173,1,0);

%avg_pool
image = global_average_pool(image); %[2048]

%full_connect
weights = lgraph.Layers(177,1).Weights; 
bias = lgraph.Layers(177,1).Bias; 
image = full_connect(weights,bias,image);

%softmax
predict = softmax_out(image)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%function%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%block
function [image] = block1(image,w0,tr0,strides0,padding0,w1,tr1,strides1,padding1,w2,tr2,strides2,w3,tr3,strides3,padding3)
  %conv_block1_0_bn merge
  modelfile = 'resnet_50.h5';
  lgraph = importKerasLayers(modelfile,'ImportWeights',true);
  image_sc = image;
  weights = lgraph.Layers(w0,1).Weights; 
  bias = lgraph.Layers(w0,1).Bias; 
  trained_mean = lgraph.Layers(tr0,1).TrainedMean;
  trained_variance = lgraph.Layers(tr0,1).TrainedVariance;
  beta = lgraph.Layers(tr0,1).Offset;
  gamma = lgraph.Layers(tr0,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);

  %conv_block1_0_conv
  image_sc = conv(weights,bias,strides0,image_sc,padding0);

  %conv_block1_1_bn merge
  weights = lgraph.Layers(w1,1).Weights; 
  bias = lgraph.Layers(w1,1).Bias; 
  trained_mean = lgraph.Layers(tr1,1).TrainedMean;
  trained_variance = lgraph.Layers(tr1,1).TrainedVariance;
  beta = lgraph.Layers(tr1,1).Offset;
  gamma = lgraph.Layers(tr1,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);

  %conv_block1_1_conv
  image  = conv(weights,bias,strides1,image,padding1);

  %conv_block1_1_relu
  image = relu(image);

  %conv_block1_2_bn merge
  weights = lgraph.Layers(w2,1).Weights; 
  bias = lgraph.Layers(w2,1).Bias; 
  trained_mean = lgraph.Layers(tr2,1).TrainedMean;
  trained_variance = lgraph.Layers(tr2,1).TrainedVariance;
  beta = lgraph.Layers(tr2,1).Offset;
  gamma = lgraph.Layers(tr2,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);

  %conv_block1_2_conv
  image  = conv_padding_same(weights,bias,strides2,image);

  %conv_block1_2_relu
  image = relu(image);

  %conv_block1_3_bn merge
  weights = lgraph.Layers(w3,1).Weights; 
  bias = lgraph.Layers(w3,1).Bias; 
  trained_mean = lgraph.Layers(tr3,1).TrainedMean;
  trained_variance = lgraph.Layers(tr3,1).TrainedVariance;
  beta = lgraph.Layers(tr3,1).Offset;
  gamma = lgraph.Layers(tr3,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);

  %conv_block1_3_conv
  image  = conv(weights,bias,strides3,image,padding3);

  %conv_block1_add
  image = image + image_sc;

  %conv_block1_relu_out
  image = relu(image);
end

%block
function [image] = block(image,w1,tr1,strides1,padding1,w2,tr2,strides2,w3,tr3,strides3,padding3)
  %conv_block1_1_bn merge
  modelfile = 'resnet_50.h5';
  lgraph = importKerasLayers(modelfile,'ImportWeights',true);
  image_sc = image;
  weights = lgraph.Layers(w1,1).Weights; 
  bias = lgraph.Layers(w1,1).Bias; 
  trained_mean = lgraph.Layers(tr1,1).TrainedMean;
  trained_variance = lgraph.Layers(tr1,1).TrainedVariance;
  beta = lgraph.Layers(tr1,1).Offset;
  gamma = lgraph.Layers(tr1,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);

  %conv_block1_1_conv
  image  = conv(weights,bias,strides1,image,padding1);

  %conv_block1_1_relu
  image = relu(image);

  %conv_block1_2_bn merge
  weights = lgraph.Layers(w2,1).Weights; 
  bias = lgraph.Layers(w2,1).Bias; 
  trained_mean = lgraph.Layers(tr2,1).TrainedMean;
  trained_variance = lgraph.Layers(tr2,1).TrainedVariance;
  beta = lgraph.Layers(tr2,1).Offset;
  gamma = lgraph.Layers(tr2,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);

  %conv_block1_2_conv
  image  = conv_padding_same(weights,bias,strides2,image);

  %conv_block1_2_relu
  image = relu(image);

  %conv_block1_3_bn merge
  weights = lgraph.Layers(w3,1).Weights; 
  bias = lgraph.Layers(w3,1).Bias; 
  trained_mean = lgraph.Layers(tr3,1).TrainedMean;
  trained_variance = lgraph.Layers(tr3,1).TrainedVariance;
  beta = lgraph.Layers(tr3,1).Offset;
  gamma = lgraph.Layers(tr3,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);

  %conv_block1_3_conv
  image  = conv(weights,bias,strides3,image,padding3);

  %conv_block1_add
  image = image + image_sc;

  %conv_block1_relu_out
  image = relu(image);
end

%merge 
function [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma)
  size_weight = size(weights); %[7 7 3 64]
  image_channels = size_weight(3);
  filters = size_weight(4); %64
  kernels = size_weight(1); %7

  parfor weight_filters = 1:filters
    for weight_channels = 1:image_channels
      for weight_row = 1:kernels
        for weight_line = 1:kernels
          weights(weight_row,weight_line,weight_channels,weight_filters) = weights(weight_row,weight_line,weight_channels,weight_filters) * gamma(:,:,weight_filters) / (sqrt(trained_variance(:,:,weight_filters) + eps));
        end
      end
    end
    bias(:,:,weight_filters) = gamma(:,:,weight_filters) * (bias(:,:,weight_filters) - trained_mean(:,:,weight_filters)) / (sqrt(trained_variance(:,:,weight_filters) + eps)) + beta(:,:,weight_filters);
  end
end

%conv
function [image_conv_out] = conv(weights,bias,strides,image,padding_size)
  size_weight = size(weights); %[7 7 3 64]
  image_channels = size_weight(3);
  filters = size_weight(4); %64
  kernels = size_weight(1); %7

  image = zero_padding(image,padding_size);

  image_size = size(image);
  image_size = image_size(1); 

  image_conv_row = (image_size - kernels + 1) / strides;
  image_conv_line = ceil(image_conv_row);
  image_conv_row = image_conv_line;

  parfor filter_conv = 1:filters
    for image_conv_channels = 1:image_channels
      for image_conv_r = 1:image_conv_row
        for image_conv_l = 1:image_conv_line
          conv_mul = [];
          count = 1;
          pic_r = 1 + strides * (image_conv_r - 1) ;
          for conv_r = 1:kernels
            pic_l = 1 + strides * (image_conv_l - 1);
            for conv_l = 1:kernels
              conv_mul(count) = image(pic_r,pic_l,image_conv_channels) * weights(conv_r,conv_l,image_conv_channels,filter_conv);
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

  image_conv_out = zeros(image_conv_row,image_conv_line,filters);
  parfor filter_conv = 1:filters
    for image_conv_r = 1:image_conv_row
      for image_conv_l = 1:image_conv_line
        for image_conv_channels = 1:image_channels
          image_conv_out(image_conv_r,image_conv_l,filter_conv) = image_conv(image_conv_r,image_conv_l,image_conv_channels,filter_conv) + image_conv_out(image_conv_r,image_conv_l,filter_conv);
        end
        image_conv_out(image_conv_r,image_conv_l,filter_conv) =  image_conv_out(image_conv_r,image_conv_l,filter_conv) + bias(:,:,filter_conv);
      end
    end
  end
end

%conv_padding_same
function [image_conv_out] = conv_padding_same(weights,bias,strides,image)
  size_weight = size(weights); %[7 7 3 64]
  image_channels = size_weight(3);
  filters = size_weight(4); %64
  kernels = size_weight(1); %7

  image = zero_padding_same(image,strides,kernels);

  image_size = size(image);
  image_size = image_size(1); 

  image_conv_row = (image_size - kernels + 1) / strides;
  image_conv_line = ceil(image_conv_row);
  image_conv_row = image_conv_line;

  parfor filter_conv = 1:filters
    for image_conv_channels = 1:image_channels
      for image_conv_r = 1:image_conv_row
        for image_conv_l = 1:image_conv_line
          conv_mul = [];
          count = 1;
          pic_r = 1 + strides * (image_conv_r - 1) ;
          for conv_r = 1:kernels
            pic_l = 1 + strides * (image_conv_l - 1);
            for conv_l = 1:kernels
              conv_mul(count) = image(pic_r,pic_l,image_conv_channels) * weights(conv_r,conv_l,image_conv_channels,filter_conv);
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

  image_conv_out = zeros(image_conv_row,image_conv_line,filters);
  parfor filter_conv = 1:filters
    for image_conv_r = 1:image_conv_row
      for image_conv_l = 1:image_conv_line
        for image_conv_channels = 1:image_channels
          image_conv_out(image_conv_r,image_conv_l,filter_conv) = image_conv(image_conv_r,image_conv_l,image_conv_channels,filter_conv) + image_conv_out(image_conv_r,image_conv_l,filter_conv);
        end
        image_conv_out(image_conv_r,image_conv_l,filter_conv) =  image_conv_out(image_conv_r,image_conv_l,filter_conv) + bias(:,:,filter_conv);
      end
    end
  end
end

%full_connected_layer
function [image] = full_connect(weights,bias,image)
  size_weight = size(weights); %[1000*2048]
  filters = size_weight(2); %2048
  kernels = size_weight(1); %1000

  image_size = size(image);
  image_size = image_size(2);%2048
  full_out = zeros(1,kernels);

  for full_size = 1:kernels
    for filter_full = 1:filters
      full_out(1,full_size) = full_out(1,full_size) + image(1,filter_full) * weights(full_size,filter_full);
    end
    full_out(1,full_size) = full_out(1,full_size) + bias(full_size,1);
  end
end

%ZeroPadding
function [image_padding_out] = zero_padding(image,padding_size)
  image_filter = size(image);
  filters = image_filter(3);

  parfor filter_padding = 1:filters
    image_padding = image(:,:,filter_padding);
    image_padding = padarray(image_padding, [padding_size padding_size]);
    image_padding_out(:,:,filter_padding) = image_padding;
  end
end

%zeropadding_same
function [image_padding_out] = zero_padding_same(image,strides,kernels)
  image_size = size(image);
  filters = image_size(3); 
  image_size = image_size(1);

  padding_height = (floor(image_size / strides) - 1) * strides + kernels - image_size;
  padding_top = ceil(padding_height / 2);
  padding_down = padding_height - padding_top;
  padding_width = (floor(image_size / strides) - 1) * strides + kernels - image_size;
  padding_left = ceil(padding_width / 2);
  padding_right = padding_width - padding_left;
  
  parfor filter_padding = 1:filters
    image_padding = image(:,:,filter_padding);
    image_padding = padarray(image_padding, [padding_top padding_left],'pre');
    image_padding = padarray(image_padding, [padding_down padding_right],'post');
    image_padding_out(:,:,filter_padding) = image_padding;
  end
end

%relu
function [image_relu] = relu(image)
  image_size = size(image);
  filters = image_size(3);
  image_row = image_size(1);
  image_line = image_size(2);
  image_relu = image;
  parfor filter_relu = 1:filters
    for image_relu_r = 1:image_row
      for image_relu_l = 1:image_line
        if image_relu(image_relu_r,image_relu_l,filter_relu) < 0
          image_relu(image_relu_r,image_relu_l,filter_relu) = 0;
        end
      end
    end
  end 
end

%MaxPooling
function [image_pool] = maxpooling(image,strides,pool_size,padding_size)

  image = zero_padding(image,padding_size);

  image_s = size(image);
  filters = image_s(3);
  image_size = image_s(1);
  image_pool_row = (image_size - pool_size + 1) / strides;
  image_pool_line = ceil(image_pool_row);
  image_pool_row = image_pool_line;
  image_pool = zeros(image_pool_row,image_pool_line,filters);

  parfor filter_pool = 1:filters
    for image_pool_r = 1:image_pool_row
      for image_pool_l = 1:image_pool_line
        image_r = 1 + strides * (image_pool_r - 1);
        for pool_r = 1:pool_size
          image_l = 1 + strides * (image_pool_l - 1);
          for pool_l = 1:pool_size
            if image_pool(image_pool_r,image_pool_l,filter_pool) < image(image_r,image_l,filter_pool)
              image_pool(image_pool_r,image_pool_l,filter_pool) = image(image_r,image_l,filter_pool);
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
end

%global_average_pool
function [image_average_pool] = global_average_pool(image)
  image_s = size(image);
  filters = image_s(3);
  image_size = image_s(1);
  
  for filter_ave_pool = 1:filters
    image_average_pool(1,filter_ave_pool) = mean(image(:,:,filter_ave_pool),'all');
  end
end

%softmax
function [predict] = softmax_out(image)
  image_size = size(image);
  image_size = image_size(2); %1000
  sum_exp = sum(exp(image));
  
  for predict_n = 1:image_size
    predict(1,predict_n) = exp(image(1,predict_n)) / sum_exp;
  end
end


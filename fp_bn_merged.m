%%%%%%%%%%%%%%%%%%%%%%%input(224*224*3)%%%%%%%%%%%%%%%%%%%%%%%
clear;
image_file = fopen('val.txt');
image_name = strings;
image_label = zeros(1,50000);
i = 1;
tline = fgetl(image_file);
while ischar(tline)
  image_name(i) = tline(1:28);
  image_label(i) = str2double(tline(30:end));
  tline = fgetl(image_file);
  i = i + 1;
end
fclose(image_file);

result_top1 = zeros(1,50000);
result_top5 = zeros(1,50000);

tic;
% parfor img_i = 1:200
  img_i = 1;
  image = imread('./image/' + image_name(img_i));
%   pic = imresize(pic,[224 224]);
  image = single(image); 
%   lgraph = resnet50('Weights','imagenet');
  lgraph = load('merge.mat');
  image = image - lgraph.mean;
%   image = image - lgraph.Layers(1,1).Mean;
  %original image:float32_to_sfp
  
  %conv1_zeropadding(230*230*3),(3,3,3,3)
  image = zero_padding(image,3);
  
  %conv1_conv
  weights = lgraph.conv1(1).conv1;
  bias = lgraph.conv1(2).conv1;
 
%   weights = lgraph.Layers(2,1).Weights; %7*7*3*64
%   bias = lgraph.Layers(2,1).Bias; %1*1*64
  image  = conv(weights,bias,2,image,0);
%   image(10:21,10:21,33)
  %conv1_relu
  image = relu(image);
     
  %pool1_pad
  image = zero_padding(image,1);
  
  %pool1_pool
  image = max_pooling(image,3,2);
 
  %conv2_block1
  weights1 = lgraph.res2a_branch1(1).res2a_branch1;
  bias1 = lgraph.res2a_branch1(2).res2a_branch1;
  
  weights2a = lgraph.res2a_branch2a(1).res2a_branch2a;
  bias2a = lgraph.res2a_branch2a(2).res2a_branch2a;
  
  weights2b = lgraph.res2a_branch2b(1).res2a_branch2b;
  bias2b = lgraph.res2a_branch2b(2).res2a_branch2b;
  
  weights2c = lgraph.res2a_branch2c(1).res2a_branch2c;
  bias2c = lgraph.res2a_branch2c(2).res2a_branch2c;
  
  image = block1(image,weights1,bias1,1,0,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv2_block2
  weights2a = lgraph.res2b_branch2a(1).res2b_branch2a;
  bias2a = lgraph.res2b_branch2a(2).res2b_branch2a;
  
  weights2b = lgraph.res2b_branch2b(1).res2b_branch2b;
  bias2b = lgraph.res2b_branch2b(2).res2b_branch2b;
  
  weights2c = lgraph.res2b_branch2c(1).res2b_branch2c;
  bias2c = lgraph.res2b_branch2c(2).res2b_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv2_block3
  weights2a = lgraph.res2c_branch2a(1).res2c_branch2a;
  bias2a = lgraph.res2c_branch2a(2).res2c_branch2a;
  
  weights2b = lgraph.res2c_branch2b(1).res2c_branch2b;
  bias2b = lgraph.res2c_branch2b(2).res2c_branch2b;
  
  weights2c = lgraph.res2c_branch2c(1).res2c_branch2c;
  bias2c = lgraph.res2c_branch2c(2).res2c_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
 
  %conv3_block1
  weights1 = lgraph.res3a_branch1(1).res3a_branch1;
  bias1 = lgraph.res3a_branch1(2).res3a_branch1;
  
  weights2a = lgraph.res3a_branch2a(1).res3a_branch2a;
  bias2a = lgraph.res3a_branch2a(2).res3a_branch2a;
  
  weights2b = lgraph.res3a_branch2b(1).res3a_branch2b;
  bias2b = lgraph.res3a_branch2b(2).res3a_branch2b;
  
  weights2c = lgraph.res3a_branch2c(1).res3a_branch2c;
  bias2c = lgraph.res3a_branch2c(2).res3a_branch2c;
  
  image = block1(image,weights1,bias1,2,0,weights2a,bias2a,2,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv3_block2
  weights2a = lgraph.res3b_branch2a(1).res3b_branch2a;
  bias2a = lgraph.res3b_branch2a(2).res3b_branch2a;
  
  weights2b = lgraph.res3b_branch2b(1).res3b_branch2b;
  bias2b = lgraph.res3b_branch2b(2).res3b_branch2b;
  
  weights2c = lgraph.res3b_branch2c(1).res3b_branch2c;
  bias2c = lgraph.res3b_branch2c(2).res3b_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv3_block3
  weights2a = lgraph.res3c_branch2a(1).res3c_branch2a;
  bias2a = lgraph.res3c_branch2a(2).res3c_branch2a;
  
  weights2b = lgraph.res3c_branch2b(1).res3c_branch2b;
  bias2b = lgraph.res3c_branch2b(2).res3c_branch2b;
  
  weights2c = lgraph.res3c_branch2c(1).res3c_branch2c;
  bias2c = lgraph.res3c_branch2c(2).res3c_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
 
  %conv3_block4
  weights2a = lgraph.res3d_branch2a(1).res3d_branch2a;
  bias2a = lgraph.res3d_branch2a(2).res3d_branch2a;
  
  weights2b = lgraph.res3d_branch2b(1).res3d_branch2b;
  bias2b = lgraph.res3d_branch2b(2).res3d_branch2b;
  
  weights2c = lgraph.res3d_branch2c(1).res3d_branch2c;
  bias2c = lgraph.res3d_branch2c(2).res3d_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv4_block1
  weights1 = lgraph.res4a_branch1(1).res4a_branch1;
  bias1 = lgraph.res4a_branch1(2).res4a_branch1;
  
  weights2a = lgraph.res4a_branch2a(1).res4a_branch2a;
  bias2a = lgraph.res4a_branch2a(2).res4a_branch2a;
  
  weights2b = lgraph.res4a_branch2b(1).res4a_branch2b;
  bias2b = lgraph.res4a_branch2b(2).res4a_branch2b;
  
  weights2c = lgraph.res4a_branch2c(1).res4a_branch2c;
  bias2c = lgraph.res4a_branch2c(2).res4a_branch2c;
  
  image = block1(image,weights1,bias1,2,0,weights2a,bias2a,2,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv4_block2
  weights2a = lgraph.res4b_branch2a(1).res4b_branch2a;
  bias2a = lgraph.res4b_branch2a(2).res4b_branch2a;
  
  weights2b = lgraph.res4b_branch2b(1).res4b_branch2b;
  bias2b = lgraph.res4b_branch2b(2).res4b_branch2b;
  
  weights2c = lgraph.res4b_branch2c(1).res4b_branch2c;
  bias2c = lgraph.res4b_branch2c(2).res4b_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv4_block3
  weights2a = lgraph.res4c_branch2a(1).res4c_branch2a;
  bias2a = lgraph.res4c_branch2a(2).res4c_branch2a;
  
  weights2b = lgraph.res4c_branch2b(1).res4c_branch2b;
  bias2b = lgraph.res4c_branch2b(2).res4c_branch2b;
  
  weights2c = lgraph.res4c_branch2c(1).res4c_branch2c;
  bias2c = lgraph.res4c_branch2c(2).res4c_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv4_block4
  weights2a = lgraph.res4d_branch2a(1).res4d_branch2a;
  bias2a = lgraph.res4d_branch2a(2).res4d_branch2a;
  
  weights2b = lgraph.res4d_branch2b(1).res4d_branch2b;
  bias2b = lgraph.res4d_branch2b(2).res4d_branch2b;
  
  weights2c = lgraph.res4d_branch2c(1).res4d_branch2c;
  bias2c = lgraph.res4d_branch2c(2).res4d_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv4_block5
  weights2a = lgraph.res4e_branch2a(1).res4e_branch2a;
  bias2a = lgraph.res4e_branch2a(2).res4e_branch2a;
  
  weights2b = lgraph.res4e_branch2b(1).res4e_branch2b;
  bias2b = lgraph.res4e_branch2b(2).res4e_branch2b;
  
  weights2c = lgraph.res4e_branch2c(1).res4e_branch2c;
  bias2c = lgraph.res4e_branch2c(2).res4e_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv4_block6
  weights2a = lgraph.res4f_branch2a(1).res4f_branch2a;
  bias2a = lgraph.res4f_branch2a(2).res4f_branch2a;
  
  weights2b = lgraph.res4f_branch2b(1).res4f_branch2b;
  bias2b = lgraph.res4f_branch2b(2).res4f_branch2b;
  
  weights2c = lgraph.res4f_branch2c(1).res4f_branch2c;
  bias2c = lgraph.res4f_branch2c(2).res4f_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv5_block1
  weights1 = lgraph.res5a_branch1(1).res5a_branch1;
  bias1 = lgraph.res5a_branch1(2).res5a_branch1;
  
  weights2a = lgraph.res5a_branch2a(1).res5a_branch2a;
  bias2a = lgraph.res5a_branch2a(2).res5a_branch2a;
  
  weights2b = lgraph.res5a_branch2b(1).res5a_branch2b;
  bias2b = lgraph.res5a_branch2b(2).res5a_branch2b;
  
  weights2c = lgraph.res5a_branch2c(1).res5a_branch2c;
  bias2c = lgraph.res5a_branch2c(2).res5a_branch2c;
  
  image = block1(image,weights1,bias1,2,0,weights2a,bias2a,2,0,weights2b,bias2b,1,weights2c,bias2c,1,0);
  
  %conv5_block2
  weights2a = lgraph.res5b_branch2a(1).res5b_branch2a;
  bias2a = lgraph.res5b_branch2a(2).res5b_branch2a;
  
  weights2b = lgraph.res5b_branch2b(1).res5b_branch2b;
  bias2b = lgraph.res5b_branch2b(2).res5b_branch2b;
  
  weights2c = lgraph.res5b_branch2c(1).res5b_branch2c;
  bias2c = lgraph.res5b_branch2c(2).res5b_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);

  %conv5_block3
  weights2a = lgraph.res5c_branch2a(1).res5c_branch2a;
  bias2a = lgraph.res5c_branch2a(2).res5c_branch2a;
  
  weights2b = lgraph.res5c_branch2b(1).res5c_branch2b;
  bias2b = lgraph.res5c_branch2b(2).res5c_branch2b;
  
  weights2c = lgraph.res5c_branch2c(1).res5c_branch2c;
  bias2c = lgraph.res5c_branch2c(2).res5c_branch2c;
  
  image = block(image,weights2a,bias2a,1,0,weights2b,bias2b,1,weights2c,bias2c,1,0);

  %avg_pool
  image = global_average_pool(image); %[2048]

  %full_connect
  weights = lgraph.full_weights; 
  bias = lgraph.full_bias; 
  image = full_connect(weights,bias,image)

  %softmax
  predict = softmax_out(image);

%   %TOP1
%   [pred_acc,pred_label] = max(predict);
%   if pred_label - 1 == image_label(img_i)
%     result_top1(img_i) = 1;
%   end
%   
%   %TOP5
%   [b,pred_label_top5]=sort(predict,'descend');
%   pred_label_top5 = pred_label_top5 -1;
%   if find(pred_label_top5(1:5) == image_label(img_i))
%     result_top5(img_i) = 1;
%   else
%     result_top5(img_i) = 0;  
%   end

% end
% sum(result_top1)
% sum(result_top5)
% xlswrite('top1.xls', result_top1);
% xlswrite('top5.xls', result_top5);
toc;
% 
% %TOP1_accuracy
% top1_acc = sum(result_top1) / 50000;
% 
% %TOP5_accuracy
% top5_acc = sum(result_top5) / 50000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%function%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%block
function [image] = block1(image,weights1,bias1,strides0,padding0,weights2a,bias2a,strides1,padding1,weights2b,bias2b,strides2,weights2c,bias2c,strides3,padding3)
  image_sc = image;
  
  %conv_block1_0_conv
  image_sc = conv(weights1,bias1,strides0,image_sc,padding0);

  %conv_block1_1_conv
  image  = conv(weights2a,bias2a,strides1,image,padding1);
  
  %conv_block1_1_relu
  image = relu(image);
  
  %conv_block1_2_conv
  image  = conv_padding_same(weights2b,bias2b,strides2,image);

  %conv_block1_2_relu
  image = relu(image);

  %conv_block1_3_conv
  image  = conv(weights2c,bias2c,strides3,image,padding3);
  
  %conv_block1_add
  image = image + image_sc;

  %conv_block1_relu_out
  image = relu(image);
end

%block
function [image] = block(image,weights2a,bias2a,strides1,padding1,weights2b,bias2b,strides2,weights2c,bias2c,strides3,padding3)
  image_sc = image;

  %conv_block1_1_conv
  image  = conv(weights2a,bias2a,strides1,image,padding1);

  %conv_block1_1_relu
  image = relu(image);

  %conv_block1_2_conv
  image  = conv_padding_same(weights2b,bias2b,strides2,image);

  %conv_block1_2_relu
  image = relu(image);

  %conv_block1_3_conv
  image  = conv(weights2c,bias2c,strides3,image,padding3);

  %conv_block1_add
  image = image + image_sc;

  %conv_block1_relu_out
  image = relu(image);
end

%conv
function [image_conv] = conv(weights,bias,strides,image,padding_size)
  size_weight = size(weights); %[7 7 3 64]
  filters = size_weight(4); %64
  kernels = size_weight(1); %7
  weights = rot90(weights,2);
 
  if padding_size ~= 0
    image = zero_padding(image,padding_size);
  end

  image_size = size(image);
  channels = image_size(3);
  image_size = image_size(1); 
  image_conv_row = (image_size - kernels + 1) / strides;
  image_conv_line = ceil(image_conv_row);
  image_conv_row = image_conv_line;

  image_conv_out = single(zeros(image_size - kernels + 1,image_size - kernels + 1,filters));
  image_conv = single(zeros(image_conv_row,image_conv_line,filters));

  for filter_conv = 1:filters
    for image_channels = 1:channels
      image_conv_out(:,:,filter_conv) = image_conv_out(:,:,filter_conv) + conv2(image(:,:,image_channels),weights(:,:,image_channels,filter_conv),'valid');
    end
    image_conv_out(:,:,filter_conv) = image_conv_out(:,:,filter_conv) + bias(:,:,filter_conv);
    image_conv(:,:,filter_conv) = image_conv_out(1:strides:end,1:strides:end,filter_conv);
  end
  
end

%conv_padding_same
function [image_conv] = conv_padding_same(weights,bias,strides,image)
  size_weight = size(weights); %[7 7 3 64]
  filters = size_weight(4); 
  weights = rot90(weights,2);

  image_size = size(image);
  channels = image_size(3);
  image_size = image_size(1);
  image_conv_row = image_size / strides;
  image_conv_line = ceil(image_conv_row);
  image_conv_row = image_conv_line;
  
  image_conv_out = single(zeros(image_size,image_size,filters));
  image_conv = single(zeros(image_conv_row,image_conv_line,filters));
  for filter_conv = 1:filters
    for image_channels = 1:channels
      b = conv2(image(:,:,image_channels),weights(:,:,image_channels,filter_conv),'same');
      image_conv_out(:,:,filter_conv) = image_conv_out(:,:,filter_conv) + b;
    end
    image_conv_out(:,:,filter_conv) = image_conv_out(:,:,filter_conv) + bias(:,:,filter_conv); 
    image_conv(:,:,filter_conv) = image_conv_out(1:strides:end,1:strides:end,filter_conv);
  end

end

%full_connected_layer
function [full_out] = full_connect(weights,bias,image)
  size_weight = size(weights); %[1000*2048]
  kernels = size_weight(1); %1000
  full_out = single(zeros(1,kernels));

  for full_size = 1:kernels
    full_out(1,full_size) = dot(image,weights(full_size,:)) + bias(full_size,1);
  end
end

%ZeroPadding
function [image_padding_out] = zero_padding(image,padding_size)
  image_padding_out = padarray(image,[padding_size padding_size]);
end

%relu
function [image] = relu(image)
  image(image < 0) = 0; 
end

%max_pooling
function layer1_mp = max_pooling(layer1, ks, s)
  [H,W,C] = size(layer1);
  Hp = ceil((H - ks + 1) / s);
  Wp = ceil((W - ks + 1) / s);
  chan = ones(Hp,Wp)*NaN;
  layer1_mp = zeros(Hp,Wp,C);
  for c = 1:C
      chan(1:H,1:W) = layer1(:,:,c);
      bx = 1:ks;
      by = 1:ks;
      
      for y = 1:Hp
          for x = 1:Wp
              A = chan(by,bx);
              layer1_mp(y,x,c) = max(A(:));
              if bx < H
                bx = bx + s;
              end
          end
          
          bx = 1:ks;
          if by < W
            by = by + s;
          end
      end    
  end
end

%global_average_pool
function [image_average_pool] = global_average_pool(image)
  image_s = size(image);
  filters = image_s(3);
  image_average_pool = single(zeros(1,filters));
  for filter_ave_pool = 1:filters
    image_average_pool(1,filter_ave_pool) = mean(image(:,:,filter_ave_pool),'all');
  end
end

%softmax
function [predict] = softmax_out(image)
  image_size = size(image);
  image_size = image_size(2); %1000
  sum_exp = sum(exp(image));
  predict = single(zeros(1,image_size));
  for predict_n = 1:image_size
    predict(1,predict_n) = exp(image(1,predict_n)) / sum_exp;
  end
end
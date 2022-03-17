%%%%%%%%%%%%%%%%%%%%%%%input(224*224*3)%%%%%%%%%%%%%%%%%%%%%%%
 clear;
 modelfile = 'resnet_50.h5';
 lgraph = importKerasLayers(modelfile,'ImportWeights',true);
 eps = 1.0010e-5;
 mean = [123.68, 116.78, 103.94];
 save('fp.mat', 'mean');
  %conv1_bn merge
  weights = lgraph.Layers(3,1).Weights; 
  bias = lgraph.Layers(3,1).Bias; 
  trained_mean = lgraph.Layers(4,1).TrainedMean;
  trained_variance = lgraph.Layers(4,1).TrainedVariance;
  beta = lgraph.Layers(4,1).Offset;
  gamma = lgraph.Layers(4,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv1','-append');
  
  %conv2_block1
  %image = block1(image,14,16,1,0,8,9,1,0,11,12,1,15,17,1,0);
  weights = lgraph.Layers(14,1).Weights; 
  bias = lgraph.Layers(14,1).Bias; 
  trained_mean = lgraph.Layers(16,1).TrainedMean;
  trained_variance = lgraph.Layers(16,1).TrainedVariance;
  beta = lgraph.Layers(16,1).Offset;
  gamma = lgraph.Layers(16,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block1_0 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block1_0','-append');
  
  weights = lgraph.Layers(8,1).Weights; 
  bias = lgraph.Layers(8,1).Bias; 
  trained_mean = lgraph.Layers(9,1).TrainedMean;
  trained_variance = lgraph.Layers(9,1).TrainedVariance;
  beta = lgraph.Layers(9,1).Offset;
  gamma = lgraph.Layers(9,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block1_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block1_1','-append');
  
  weights = lgraph.Layers(11,1).Weights; 
  bias = lgraph.Layers(11,1).Bias; 
  trained_mean = lgraph.Layers(12,1).TrainedMean;
  trained_variance = lgraph.Layers(12,1).TrainedVariance;
  beta = lgraph.Layers(12,1).Offset;
  gamma = lgraph.Layers(12,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block1_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block1_2','-append');
  
  weights = lgraph.Layers(15,1).Weights; 
  bias = lgraph.Layers(15,1).Bias; 
  trained_mean = lgraph.Layers(17,1).TrainedMean;
  trained_variance = lgraph.Layers(17,1).TrainedVariance;
  beta = lgraph.Layers(17,1).Offset;
  gamma = lgraph.Layers(17,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block1_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block1_3','-append');
  
  %conv2_block2
 %   image = block(image,20,21,1,0,23,24,1,26,27,1,0);
  weights = lgraph.Layers(20,1).Weights; 
  bias = lgraph.Layers(20,1).Bias; 
  trained_mean = lgraph.Layers(21,1).TrainedMean;
  trained_variance = lgraph.Layers(21,1).TrainedVariance;
  beta = lgraph.Layers(21,1).Offset;
  gamma = lgraph.Layers(21,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block2_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block2_1','-append');
  
  weights = lgraph.Layers(23,1).Weights; 
  bias = lgraph.Layers(23,1).Bias; 
  trained_mean = lgraph.Layers(24,1).TrainedMean;
  trained_variance = lgraph.Layers(24,1).TrainedVariance;
  beta = lgraph.Layers(24,1).Offset;
  gamma = lgraph.Layers(24,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block2_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block2_2','-append');
  
  weights = lgraph.Layers(26,1).Weights; 
  bias = lgraph.Layers(26,1).Bias; 
  trained_mean = lgraph.Layers(27,1).TrainedMean;
  trained_variance = lgraph.Layers(27,1).TrainedVariance;
  beta = lgraph.Layers(27,1).Offset;
  gamma = lgraph.Layers(27,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block2_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block2_3','-append');
  
  %conv2_block3
  %image = block(image,30,31,1,0,33,34,1,36,37,1,0);
  weights = lgraph.Layers(30,1).Weights; 
  bias = lgraph.Layers(30,1).Bias; 
  trained_mean = lgraph.Layers(31,1).TrainedMean;
  trained_variance = lgraph.Layers(31,1).TrainedVariance;
  beta = lgraph.Layers(31,1).Offset;
  gamma = lgraph.Layers(31,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block3_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block3_1','-append');
  
  weights = lgraph.Layers(33,1).Weights; 
  bias = lgraph.Layers(33,1).Bias; 
  trained_mean = lgraph.Layers(34,1).TrainedMean;
  trained_variance = lgraph.Layers(34,1).TrainedVariance;
  beta = lgraph.Layers(34,1).Offset;
  gamma = lgraph.Layers(34,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block3_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block3_2','-append');
  
  weights = lgraph.Layers(36,1).Weights; 
  bias = lgraph.Layers(36,1).Bias; 
  trained_mean = lgraph.Layers(37,1).TrainedMean;
  trained_variance = lgraph.Layers(37,1).TrainedVariance;
  beta = lgraph.Layers(37,1).Offset;
  gamma = lgraph.Layers(37,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv2_block3_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv2_block3_3','-append');
  
  %conv3_block1
  %image = block1(image,46,48,2,0,40,41,2,0,43,44,1,47,49,1,0);
  weights = lgraph.Layers(46,1).Weights; 
  bias = lgraph.Layers(46,1).Bias; 
  trained_mean = lgraph.Layers(48,1).TrainedMean;
  trained_variance = lgraph.Layers(48,1).TrainedVariance;
  beta = lgraph.Layers(48,1).Offset;
  gamma = lgraph.Layers(48,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block1_0 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block1_0','-append');
  
  weights = lgraph.Layers(40,1).Weights; 
  bias = lgraph.Layers(40,1).Bias; 
  trained_mean = lgraph.Layers(41,1).TrainedMean;
  trained_variance = lgraph.Layers(41,1).TrainedVariance;
  beta = lgraph.Layers(41,1).Offset;
  gamma = lgraph.Layers(41,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block1_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block1_1','-append');
  
  weights = lgraph.Layers(43,1).Weights; 
  bias = lgraph.Layers(43,1).Bias; 
  trained_mean = lgraph.Layers(44,1).TrainedMean;
  trained_variance = lgraph.Layers(44,1).TrainedVariance;
  beta = lgraph.Layers(44,1).Offset;
  gamma = lgraph.Layers(44,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block1_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block1_2','-append');
  
  weights = lgraph.Layers(47,1).Weights; 
  bias = lgraph.Layers(47,1).Bias; 
  trained_mean = lgraph.Layers(49,1).TrainedMean;
  trained_variance = lgraph.Layers(49,1).TrainedVariance;
  beta = lgraph.Layers(49,1).Offset;
  gamma = lgraph.Layers(49,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block1_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block1_3','-append');
  
  %conv3_block2
  %image = block(image,52,53,1,0,55,56,1,58,59,1,0);
  weights = lgraph.Layers(52,1).Weights; 
  bias = lgraph.Layers(52,1).Bias; 
  trained_mean = lgraph.Layers(53,1).TrainedMean;
  trained_variance = lgraph.Layers(53,1).TrainedVariance;
  beta = lgraph.Layers(53,1).Offset;
  gamma = lgraph.Layers(53,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block2_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block2_1','-append');
  
  weights = lgraph.Layers(55,1).Weights; 
  bias = lgraph.Layers(55,1).Bias; 
  trained_mean = lgraph.Layers(56,1).TrainedMean;
  trained_variance = lgraph.Layers(56,1).TrainedVariance;
  beta = lgraph.Layers(56,1).Offset;
  gamma = lgraph.Layers(56,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block2_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block2_2','-append');
  
  weights = lgraph.Layers(58,1).Weights; 
  bias = lgraph.Layers(58,1).Bias; 
  trained_mean = lgraph.Layers(59,1).TrainedMean;
  trained_variance = lgraph.Layers(59,1).TrainedVariance;
  beta = lgraph.Layers(59,1).Offset;
  gamma = lgraph.Layers(59,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block2_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block2_3','-append');
  
  %conv3_block3
  %image = block(image,62,63,1,0,65,66,1,68,69,1,0);
  weights = lgraph.Layers(62,1).Weights; 
  bias = lgraph.Layers(62,1).Bias; 
  trained_mean = lgraph.Layers(63,1).TrainedMean;
  trained_variance = lgraph.Layers(63,1).TrainedVariance;
  beta = lgraph.Layers(63,1).Offset;
  gamma = lgraph.Layers(63,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block3_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block3_1','-append');
  
  weights = lgraph.Layers(65,1).Weights; 
  bias = lgraph.Layers(65,1).Bias; 
  trained_mean = lgraph.Layers(66,1).TrainedMean;
  trained_variance = lgraph.Layers(66,1).TrainedVariance;
  beta = lgraph.Layers(66,1).Offset;
  gamma = lgraph.Layers(66,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block3_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block3_2','-append');
  
  weights = lgraph.Layers(68,1).Weights; 
  bias = lgraph.Layers(68,1).Bias; 
  trained_mean = lgraph.Layers(69,1).TrainedMean;
  trained_variance = lgraph.Layers(69,1).TrainedVariance;
  beta = lgraph.Layers(69,1).Offset;
  gamma = lgraph.Layers(69,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block3_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block3_3','-append');
  
  %conv3_block4
  %image = block(image,72,73,1,0,75,76,1,78,79,1,0);
  weights = lgraph.Layers(72,1).Weights; 
  bias = lgraph.Layers(72,1).Bias; 
  trained_mean = lgraph.Layers(73,1).TrainedMean;
  trained_variance = lgraph.Layers(73,1).TrainedVariance;
  beta = lgraph.Layers(73,1).Offset;
  gamma = lgraph.Layers(73,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block4_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block4_1','-append');
  
  weights = lgraph.Layers(75,1).Weights; 
  bias = lgraph.Layers(75,1).Bias; 
  trained_mean = lgraph.Layers(76,1).TrainedMean;
  trained_variance = lgraph.Layers(76,1).TrainedVariance;
  beta = lgraph.Layers(76,1).Offset;
  gamma = lgraph.Layers(76,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block4_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block4_2','-append');
  
  weights = lgraph.Layers(78,1).Weights; 
  bias = lgraph.Layers(78,1).Bias; 
  trained_mean = lgraph.Layers(79,1).TrainedMean;
  trained_variance = lgraph.Layers(79,1).TrainedVariance;
  beta = lgraph.Layers(79,1).Offset;
  gamma = lgraph.Layers(79,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv3_block4_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv3_block4_3','-append');
  
  %conv4_block1
  %image = block1(image,88,90,2,0,82,83,2,0,85,86,1,89,91,1,0);
  weights = lgraph.Layers(88,1).Weights; 
  bias = lgraph.Layers(88,1).Bias; 
  trained_mean = lgraph.Layers(90,1).TrainedMean;
  trained_variance = lgraph.Layers(90,1).TrainedVariance;
  beta = lgraph.Layers(90,1).Offset;
  gamma = lgraph.Layers(90,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block1_0 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block1_0','-append');
  
  weights = lgraph.Layers(82,1).Weights; 
  bias = lgraph.Layers(82,1).Bias; 
  trained_mean = lgraph.Layers(83,1).TrainedMean;
  trained_variance = lgraph.Layers(83,1).TrainedVariance;
  beta = lgraph.Layers(83,1).Offset;
  gamma = lgraph.Layers(83,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block1_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block1_1','-append');
  
  weights = lgraph.Layers(85,1).Weights; 
  bias = lgraph.Layers(85,1).Bias; 
  trained_mean = lgraph.Layers(86,1).TrainedMean;
  trained_variance = lgraph.Layers(86,1).TrainedVariance;
  beta = lgraph.Layers(86,1).Offset;
  gamma = lgraph.Layers(86,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block1_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block1_2','-append');
  
  weights = lgraph.Layers(89,1).Weights; 
  bias = lgraph.Layers(89,1).Bias; 
  trained_mean = lgraph.Layers(91,1).TrainedMean;
  trained_variance = lgraph.Layers(91,1).TrainedVariance;
  beta = lgraph.Layers(91,1).Offset;
  gamma = lgraph.Layers(91,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block1_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block1_3','-append');
  
  %conv4_block2
  %image = block(image,94,95,1,0,97,98,1,100,101,1,0);
  weights = lgraph.Layers(94,1).Weights; 
  bias = lgraph.Layers(94,1).Bias; 
  trained_mean = lgraph.Layers(95,1).TrainedMean;
  trained_variance = lgraph.Layers(95,1).TrainedVariance;
  beta = lgraph.Layers(95,1).Offset;
  gamma = lgraph.Layers(95,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block2_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block2_1','-append');
  
  weights = lgraph.Layers(97,1).Weights; 
  bias = lgraph.Layers(97,1).Bias; 
  trained_mean = lgraph.Layers(98,1).TrainedMean;
  trained_variance = lgraph.Layers(98,1).TrainedVariance;
  beta = lgraph.Layers(98,1).Offset;
  gamma = lgraph.Layers(98,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block2_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block2_2','-append');
  
  weights = lgraph.Layers(100,1).Weights; 
  bias = lgraph.Layers(100,1).Bias; 
  trained_mean = lgraph.Layers(101,1).TrainedMean;
  trained_variance = lgraph.Layers(101,1).TrainedVariance;
  beta = lgraph.Layers(101,1).Offset;
  gamma = lgraph.Layers(101,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block2_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block2_3','-append');
  
  %conv4_block3
  %image = block(image,104,105,1,0,107,108,1,110,111,1,0);
  weights = lgraph.Layers(104,1).Weights; 
  bias = lgraph.Layers(104,1).Bias; 
  trained_mean = lgraph.Layers(105,1).TrainedMean;
  trained_variance = lgraph.Layers(105,1).TrainedVariance;
  beta = lgraph.Layers(105,1).Offset;
  gamma = lgraph.Layers(105,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block3_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block3_1','-append');
  
  weights = lgraph.Layers(107,1).Weights; 
  bias = lgraph.Layers(107,1).Bias; 
  trained_mean = lgraph.Layers(108,1).TrainedMean;
  trained_variance = lgraph.Layers(108,1).TrainedVariance;
  beta = lgraph.Layers(108,1).Offset;
  gamma = lgraph.Layers(108,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block3_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block3_2','-append');
  
  weights = lgraph.Layers(110,1).Weights; 
  bias = lgraph.Layers(110,1).Bias; 
  trained_mean = lgraph.Layers(111,1).TrainedMean;
  trained_variance = lgraph.Layers(111,1).TrainedVariance;
  beta = lgraph.Layers(111,1).Offset;
  gamma = lgraph.Layers(111,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block3_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block3_3','-append');
  
  %conv4_block4
  %image = block(image,114,115,1,0,117,118,1,120,121,1,0);
  weights = lgraph.Layers(114,1).Weights; 
  bias = lgraph.Layers(114,1).Bias; 
  trained_mean = lgraph.Layers(115,1).TrainedMean;
  trained_variance = lgraph.Layers(115,1).TrainedVariance;
  beta = lgraph.Layers(115,1).Offset;
  gamma = lgraph.Layers(115,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block4_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block4_1','-append');
  
  weights = lgraph.Layers(117,1).Weights; 
  bias = lgraph.Layers(117,1).Bias; 
  trained_mean = lgraph.Layers(118,1).TrainedMean;
  trained_variance = lgraph.Layers(118,1).TrainedVariance;
  beta = lgraph.Layers(118,1).Offset;
  gamma = lgraph.Layers(118,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block4_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block4_2','-append');
  
  weights = lgraph.Layers(120,1).Weights; 
  bias = lgraph.Layers(120,1).Bias; 
  trained_mean = lgraph.Layers(121,1).TrainedMean;
  trained_variance = lgraph.Layers(121,1).TrainedVariance;
  beta = lgraph.Layers(121,1).Offset;
  gamma = lgraph.Layers(121,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block4_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block4_3','-append');
  
  %conv4_block5
  %image = block(image,124,125,1,0,127,128,1,130,131,1,0);
  weights = lgraph.Layers(124,1).Weights; 
  bias = lgraph.Layers(124,1).Bias; 
  trained_mean = lgraph.Layers(125,1).TrainedMean;
  trained_variance = lgraph.Layers(125,1).TrainedVariance;
  beta = lgraph.Layers(125,1).Offset;
  gamma = lgraph.Layers(125,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block5_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block5_1','-append');
  
  weights = lgraph.Layers(127,1).Weights; 
  bias = lgraph.Layers(127,1).Bias; 
  trained_mean = lgraph.Layers(128,1).TrainedMean;
  trained_variance = lgraph.Layers(128,1).TrainedVariance;
  beta = lgraph.Layers(128,1).Offset;
  gamma = lgraph.Layers(128,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block5_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block5_2','-append');
  
  weights = lgraph.Layers(130,1).Weights; 
  bias = lgraph.Layers(130,1).Bias; 
  trained_mean = lgraph.Layers(131,1).TrainedMean;
  trained_variance = lgraph.Layers(131,1).TrainedVariance;
  beta = lgraph.Layers(131,1).Offset;
  gamma = lgraph.Layers(131,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block5_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block5_3','-append');
  
  %conv4_block6
  %image = block(image,134,135,1,0,137,138,1,140,141,1,0);
  weights = lgraph.Layers(134,1).Weights; 
  bias = lgraph.Layers(134,1).Bias; 
  trained_mean = lgraph.Layers(135,1).TrainedMean;
  trained_variance = lgraph.Layers(135,1).TrainedVariance;
  beta = lgraph.Layers(135,1).Offset;
  gamma = lgraph.Layers(135,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block6_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block6_1','-append');
  
  weights = lgraph.Layers(137,1).Weights; 
  bias = lgraph.Layers(137,1).Bias; 
  trained_mean = lgraph.Layers(138,1).TrainedMean;
  trained_variance = lgraph.Layers(138,1).TrainedVariance;
  beta = lgraph.Layers(138,1).Offset;
  gamma = lgraph.Layers(138,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block6_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block6_2','-append');
  
  weights = lgraph.Layers(140,1).Weights; 
  bias = lgraph.Layers(140,1).Bias; 
  trained_mean = lgraph.Layers(141,1).TrainedMean;
  trained_variance = lgraph.Layers(141,1).TrainedVariance;
  beta = lgraph.Layers(141,1).Offset;
  gamma = lgraph.Layers(141,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv4_block6_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv4_block6_3','-append');
  
  %conv5_block1
  %image = block1(image,150,152,2,0,144,145,2,0,147,148,1,151,153,1,0);
  weights = lgraph.Layers(150,1).Weights; 
  bias = lgraph.Layers(150,1).Bias; 
  trained_mean = lgraph.Layers(152,1).TrainedMean;
  trained_variance = lgraph.Layers(152,1).TrainedVariance;
  beta = lgraph.Layers(152,1).Offset;
  gamma = lgraph.Layers(152,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block1_0 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block1_0','-append');
  
  weights = lgraph.Layers(144,1).Weights; 
  bias = lgraph.Layers(144,1).Bias; 
  trained_mean = lgraph.Layers(145,1).TrainedMean;
  trained_variance = lgraph.Layers(145,1).TrainedVariance;
  beta = lgraph.Layers(145,1).Offset;
  gamma = lgraph.Layers(145,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block1_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block1_1','-append');
  
  weights = lgraph.Layers(147,1).Weights; 
  bias = lgraph.Layers(147,1).Bias; 
  trained_mean = lgraph.Layers(148,1).TrainedMean;
  trained_variance = lgraph.Layers(148,1).TrainedVariance;
  beta = lgraph.Layers(148,1).Offset;
  gamma = lgraph.Layers(148,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block1_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block1_2','-append');
  
  weights = lgraph.Layers(151,1).Weights; 
  bias = lgraph.Layers(151,1).Bias; 
  trained_mean = lgraph.Layers(153,1).TrainedMean;
  trained_variance = lgraph.Layers(153,1).TrainedVariance;
  beta = lgraph.Layers(153,1).Offset;
  gamma = lgraph.Layers(153,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block1_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block1_3','-append');
  %conv5_block2
  %image = block(image,156,157,1,0,159,160,1,162,163,1,0);
  weights = lgraph.Layers(156,1).Weights; 
  bias = lgraph.Layers(156,1).Bias; 
  trained_mean = lgraph.Layers(157,1).TrainedMean;
  trained_variance = lgraph.Layers(157,1).TrainedVariance;
  beta = lgraph.Layers(157,1).Offset;
  gamma = lgraph.Layers(157,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block2_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block2_1','-append');
  
  weights = lgraph.Layers(159,1).Weights; 
  bias = lgraph.Layers(159,1).Bias; 
  trained_mean = lgraph.Layers(160,1).TrainedMean;
  trained_variance = lgraph.Layers(160,1).TrainedVariance;
  beta = lgraph.Layers(160,1).Offset;
  gamma = lgraph.Layers(160,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block2_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block2_2','-append');
  
  weights = lgraph.Layers(162,1).Weights; 
  bias = lgraph.Layers(162,1).Bias; 
  trained_mean = lgraph.Layers(163,1).TrainedMean;
  trained_variance = lgraph.Layers(163,1).TrainedVariance;
  beta = lgraph.Layers(163,1).Offset;
  gamma = lgraph.Layers(163,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block2_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block2_3','-append');
  
  %conv5_block3
  %image = block(image,166,167,1,0,169,170,1,172,173,1,0);
  weights = lgraph.Layers(166,1).Weights; 
  bias = lgraph.Layers(166,1).Bias; 
  trained_mean = lgraph.Layers(167,1).TrainedMean;
  trained_variance = lgraph.Layers(167,1).TrainedVariance;
  beta = lgraph.Layers(167,1).Offset;
  gamma = lgraph.Layers(167,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block3_1 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block3_1','-append');
  
  weights = lgraph.Layers(169,1).Weights; 
  bias = lgraph.Layers(169,1).Bias; 
  trained_mean = lgraph.Layers(170,1).TrainedMean;
  trained_variance = lgraph.Layers(170,1).TrainedVariance;
  beta = lgraph.Layers(170,1).Offset;
  gamma = lgraph.Layers(170,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block3_2 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block3_2','-append');
  
  weights = lgraph.Layers(172,1).Weights; 
  bias = lgraph.Layers(172,1).Bias; 
  trained_mean = lgraph.Layers(173,1).TrainedMean;
  trained_variance = lgraph.Layers(173,1).TrainedVariance;
  beta = lgraph.Layers(173,1).Offset;
  gamma = lgraph.Layers(173,1).Scale;
  [weights,bias] = bn_merge(weights,bias,trained_mean,trained_variance,beta,gamma);
  conv5_block3_3 = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'conv5_block3_3','-append');
  
  %full_connect
  weights = lgraph.Layers(177,1).Weights; 
  bias = lgraph.Layers(177,1).Bias; 
  fc = struct('weights', weights, 'bias', bias);
  save('fp.mat', 'fc','-append');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%function%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



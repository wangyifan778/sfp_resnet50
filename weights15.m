%%%%%%%%%%%%%%%%%%%%%%%input(224*224*3)%%%%%%%%%%%%%%%%%%%%%%%
  clear;
  lgraph = load('merge.mat');
  
  %conv1_conv
  weights = lgraph.conv1(1).conv1;
  bias = lgraph.conv1(2).conv1;
  m = max(abs(weights),[],'all');
  kw = m / 15;
  weights = weights / kw;
  conv1 = struct('weights', weights, 'Kw', kw);
  save('sfp15.mat', 'conv1');
     
  %conv2_block1
  weights1 = lgraph.res2a_branch1(1).res2a_branch1;
  bias1 = lgraph.res2a_branch1(2).res2a_branch1;
  m = max(abs(weights1),[],'all');
  kw = m / 15;
  weights1 = weights1 / kw;
  res2a_branch1 = struct('weights', weights1, 'Kw', kw);
  save('sfp15.mat', 'res2a_branch1','-append');
  
  weights2a = lgraph.res2a_branch2a(1).res2a_branch2a;
  bias2a = lgraph.res2a_branch2a(2).res2a_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res2a_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res2a_branch2a','-append');
  
  weights2b = lgraph.res2a_branch2b(1).res2a_branch2b;
  bias2b = lgraph.res2a_branch2b(2).res2a_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res2a_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res2a_branch2b','-append');
  
  weights2c = lgraph.res2a_branch2c(1).res2a_branch2c;
  bias2c = lgraph.res2a_branch2c(2).res2a_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res2a_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res2a_branch2c','-append');
  
  %conv2_block2
  weights2a = lgraph.res2b_branch2a(1).res2b_branch2a;
  bias2a = lgraph.res2b_branch2a(2).res2b_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res2b_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res2b_branch2a','-append');
  
  weights2b = lgraph.res2b_branch2b(1).res2b_branch2b;
  bias2b = lgraph.res2b_branch2b(2).res2b_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res2b_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res2b_branch2b','-append');
  
  weights2c = lgraph.res2b_branch2c(1).res2b_branch2c;
  bias2c = lgraph.res2b_branch2c(2).res2b_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res2b_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res2b_branch2c','-append');
  
  %conv2_block3
  weights2a = lgraph.res2c_branch2a(1).res2c_branch2a;
  bias2a = lgraph.res2c_branch2a(2).res2c_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res2c_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res2c_branch2a','-append');
  
  weights2b = lgraph.res2c_branch2b(1).res2c_branch2b;
  bias2b = lgraph.res2c_branch2b(2).res2c_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res2c_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res2c_branch2b','-append');
  
  weights2c = lgraph.res2c_branch2c(1).res2c_branch2c;
  bias2c = lgraph.res2c_branch2c(2).res2c_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res2c_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res2c_branch2c','-append');
  
  %conv3_block1
  weights1 = lgraph.res3a_branch1(1).res3a_branch1;
  bias1 = lgraph.res3a_branch1(2).res3a_branch1;
  m = max(abs(weights1),[],'all');
  kw = m / 15;
  weights1 = weights1 / kw;
  res3a_branch1 = struct('weights', weights1, 'Kw', kw);
  save('sfp15.mat', 'res3a_branch1','-append');
  
  weights2a = lgraph.res3a_branch2a(1).res3a_branch2a;
  bias2a = lgraph.res3a_branch2a(2).res3a_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res3a_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res3a_branch2a','-append');
  
  weights2b = lgraph.res3a_branch2b(1).res3a_branch2b;
  bias2b = lgraph.res3a_branch2b(2).res3a_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res3a_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res3a_branch2b','-append');
  
  weights2c = lgraph.res3a_branch2c(1).res3a_branch2c;
  bias2c = lgraph.res3a_branch2c(2).res3a_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res3a_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res3a_branch2c','-append');
  
  %conv3_block2
  weights2a = lgraph.res3b_branch2a(1).res3b_branch2a;
  bias2a = lgraph.res3b_branch2a(2).res3b_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res3b_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res3b_branch2a','-append');
  
  weights2b = lgraph.res3b_branch2b(1).res3b_branch2b;
  bias2b = lgraph.res3b_branch2b(2).res3b_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res3b_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res3b_branch2b','-append');
  
  weights2c = lgraph.res3b_branch2c(1).res3b_branch2c;
  bias2c = lgraph.res3b_branch2c(2).res3b_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res3b_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res3b_branch2c','-append');
  
  %conv3_block3
  weights2a = lgraph.res3c_branch2a(1).res3c_branch2a;
  bias2a = lgraph.res3c_branch2a(2).res3c_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res3c_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res3c_branch2a','-append');
  
  weights2b = lgraph.res3c_branch2b(1).res3c_branch2b;
  bias2b = lgraph.res3c_branch2b(2).res3c_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res3c_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res3c_branch2b','-append');
  
  weights2c = lgraph.res3c_branch2c(1).res3c_branch2c;
  bias2c = lgraph.res3c_branch2c(2).res3c_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res3c_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res3c_branch2c','-append');
  
  %conv3_block4
  weights2a = lgraph.res3d_branch2a(1).res3d_branch2a;
  bias2a = lgraph.res3d_branch2a(2).res3d_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res3d_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res3d_branch2a','-append');
  
  weights2b = lgraph.res3d_branch2b(1).res3d_branch2b;
  bias2b = lgraph.res3d_branch2b(2).res3d_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res3d_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res3d_branch2b','-append');
  
  weights2c = lgraph.res3d_branch2c(1).res3d_branch2c;
  bias2c = lgraph.res3d_branch2c(2).res3d_branch2c;
  m = max(weights2c,[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res3d_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res3d_branch2c','-append');
  
  %conv4_block1
  weights1 = lgraph.res4a_branch1(1).res4a_branch1;
  bias1 = lgraph.res4a_branch1(2).res4a_branch1;
  m = max(abs(weights1),[],'all');
  kw = m / 15;
  weights1 = weights1 / kw;
  res4a_branch1 = struct('weights', weights1, 'Kw', kw);
  save('sfp15.mat', 'res4a_branch1','-append');
  
  weights2a = lgraph.res4a_branch2a(1).res4a_branch2a;
  bias2a = lgraph.res4a_branch2a(2).res4a_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res4a_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res4a_branch2a','-append');
  
  weights2b = lgraph.res4a_branch2b(1).res4a_branch2b;
  bias2b = lgraph.res4a_branch2b(2).res4a_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res4a_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res4a_branch2b','-append');
  
  weights2c = lgraph.res4a_branch2c(1).res4a_branch2c;
  bias2c = lgraph.res4a_branch2c(2).res4a_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res4a_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res4a_branch2c','-append');
  
  %conv4_block2
  weights2a = lgraph.res4b_branch2a(1).res4b_branch2a;
  bias2a = lgraph.res4b_branch2a(2).res4b_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res4b_branch2a = struct('weights', weights2a,'Kw', kw);
  save('sfp15.mat', 'res4b_branch2a','-append');
  
  weights2b = lgraph.res4b_branch2b(1).res4b_branch2b;
  bias2b = lgraph.res4b_branch2b(2).res4b_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res4b_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res4b_branch2b','-append');
  
  weights2c = lgraph.res4b_branch2c(1).res4b_branch2c;
  bias2c = lgraph.res4b_branch2c(2).res4b_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res4b_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res4b_branch2c','-append');
  
  %conv4_block3
  weights2a = lgraph.res4c_branch2a(1).res4c_branch2a;
  bias2a = lgraph.res4c_branch2a(2).res4c_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res4c_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res4c_branch2a','-append');
  
  weights2b = lgraph.res4c_branch2b(1).res4c_branch2b;
  bias2b = lgraph.res4c_branch2b(2).res4c_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res4c_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res4c_branch2b','-append');
  
  weights2c = lgraph.res4c_branch2c(1).res4c_branch2c;
  bias2c = lgraph.res4c_branch2c(2).res4c_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res4c_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res4c_branch2c','-append');
  
  %conv4_block4
  weights2a = lgraph.res4d_branch2a(1).res4d_branch2a;
  bias2a = lgraph.res4d_branch2a(2).res4d_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res4d_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res4d_branch2a','-append');
  
  weights2b = lgraph.res4d_branch2b(1).res4d_branch2b;
  bias2b = lgraph.res4d_branch2b(2).res4d_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res4d_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res4d_branch2b','-append');
  
  weights2c = lgraph.res4d_branch2c(1).res4d_branch2c;
  bias2c = lgraph.res4d_branch2c(2).res4d_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res4d_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res4d_branch2c','-append');
  
  %conv4_block5
  weights2a = lgraph.res4e_branch2a(1).res4e_branch2a;
  bias2a = lgraph.res4e_branch2a(2).res4e_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res4e_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res4e_branch2a','-append');
  
  weights2b = lgraph.res4e_branch2b(1).res4e_branch2b;
  bias2b = lgraph.res4e_branch2b(2).res4e_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res4e_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res4e_branch2b','-append');
  
  weights2c = lgraph.res4e_branch2c(1).res4e_branch2c;
  bias2c = lgraph.res4e_branch2c(2).res4e_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res4e_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res4e_branch2c','-append');
  
  %conv4_block6
  weights2a = lgraph.res4f_branch2a(1).res4f_branch2a;
  bias2a = lgraph.res4f_branch2a(2).res4f_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res4f_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res4f_branch2a','-append');
  
  weights2b = lgraph.res4f_branch2b(1).res4f_branch2b;
  bias2b = lgraph.res4f_branch2b(2).res4f_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res4f_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res4f_branch2b','-append');
  
  weights2c = lgraph.res4f_branch2c(1).res4f_branch2c;
  bias2c = lgraph.res4f_branch2c(2).res4f_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res4f_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res4f_branch2c','-append');
  
  %conv5_block1
  weights1 = lgraph.res5a_branch1(1).res5a_branch1;
  bias1 = lgraph.res5a_branch1(2).res5a_branch1;
  m = max(abs(weights1),[],'all');
  kw = m / 15;
  weights1 = weights1 / kw;
  res5a_branch1 = struct('weights', weights1, 'Kw', kw);
  save('sfp15.mat', 'res5a_branch1','-append');
  
  weights2a = lgraph.res5a_branch2a(1).res5a_branch2a;
  bias2a = lgraph.res5a_branch2a(2).res5a_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res5a_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res5a_branch2a','-append');
  
  weights2b = lgraph.res5a_branch2b(1).res5a_branch2b;
  bias2b = lgraph.res5a_branch2b(2).res5a_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res5a_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res5a_branch2b','-append');
  
  weights2c = lgraph.res5a_branch2c(1).res5a_branch2c;
  bias2c = lgraph.res5a_branch2c(2).res5a_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res5a_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res5a_branch2c','-append');
  
  %conv5_block2
  weights2a = lgraph.res5b_branch2a(1).res5b_branch2a;
  bias2a = lgraph.res5b_branch2a(2).res5b_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res5b_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res5b_branch2a','-append');
  
  weights2b = lgraph.res5b_branch2b(1).res5b_branch2b;
  bias2b = lgraph.res5b_branch2b(2).res5b_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res5b_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res5b_branch2b','-append');
  
  weights2c = lgraph.res5b_branch2c(1).res5b_branch2c;
  bias2c = lgraph.res5b_branch2c(2).res5b_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res5b_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res5b_branch2c','-append');

  %conv5_block3
  weights2a = lgraph.res5c_branch2a(1).res5c_branch2a;
  bias2a = lgraph.res5c_branch2a(2).res5c_branch2a;
  m = max(abs(weights2a),[],'all');
  kw = m / 15;
  weights2a = weights2a / kw;
  res5c_branch2a = struct('weights', weights2a, 'Kw', kw);
  save('sfp15.mat', 'res5c_branch2a','-append');
  
  weights2b = lgraph.res5c_branch2b(1).res5c_branch2b;
  bias2b = lgraph.res5c_branch2b(2).res5c_branch2b;
  m = max(abs(weights2b),[],'all');
  kw = m / 15;
  weights2b = weights2b / kw;
  res5c_branch2b = struct('weights', weights2b, 'Kw', kw);
  save('sfp15.mat', 'res5c_branch2b','-append');
  
  weights2c = lgraph.res5c_branch2c(1).res5c_branch2c;
  bias2c = lgraph.res5c_branch2c(2).res5c_branch2c;
  m = max(abs(weights2c),[],'all');
  kw = m / 15;
  weights2c = weights2c / kw;
  res5c_branch2c = struct('weights', weights2c, 'Kw', kw);
  save('sfp15.mat', 'res5c_branch2c','-append');
  %full_connect
  weights = lgraph.full_weights; 
  bias = lgraph.full_bias; 
  m = max(abs(weights),[],'all');
  kw = m / 15;
  weights = weights / kw;
  fc = struct('weights', weights, 'Kw', kw);
  save('sfp15.mat', 'fc','-append');


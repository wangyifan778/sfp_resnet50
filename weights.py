import scipy.io
import fileinput
import glob
import numpy as np

with open('./Kw15.txt', 'w') as out:
    matpath = './weights15.mat'
    resnet_l = scipy.io.loadmat(matpath)

##########################conv1#########################
    kw = resnet_l["conv1"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

########################block1-1########################
    kw = resnet_l["res2a_branch1"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res2a_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res2a_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res2a_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

#########################block1-2#######################
    kw = resnet_l["res2b_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res2b_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res2b_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

#########################block1-3#######################
    kw = resnet_l["res2c_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res2c_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n') 

    kw = resnet_l["res2c_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n') 

#########################block2-1#######################
    kw = resnet_l["res3a_branch1"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3a_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3a_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3a_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block2-2#######################
    kw = resnet_l["res3b_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3b_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3b_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block2-3#######################
    kw = resnet_l["res3c_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3c_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3c_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block2-4#######################
    kw = resnet_l["res3d_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3d_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res3d_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block3-1#######################
    kw = resnet_l["res4a_branch1"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4a_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4a_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4a_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block3-2#######################
    kw = resnet_l["res4b_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4b_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4b_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')
    
    #########################block3-3#######################
    kw = resnet_l["res4c_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4c_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4c_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block3-4#######################
    kw = resnet_l["res4d_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4d_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4d_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')
    
    #########################block3-5#######################
    kw = resnet_l["res4e_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4e_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4e_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')
    
    #########################block3-6#######################
    kw = resnet_l["res4f_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4f_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res4f_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block4-1#######################
    kw = resnet_l["res5a_branch1"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res5a_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res5a_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res5a_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block4-2#######################
    kw = resnet_l["res5b_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res5b_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res5b_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################block4-3#######################
    kw = resnet_l["res5c_branch2a"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res5c_branch2b"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    kw = resnet_l["res5c_branch2c"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')

    #########################fc1000#####################
    kw = resnet_l["fc"][0][0][1]
    out.write(str(kw) + ' ')
    out.write('\n')


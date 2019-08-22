from scipy.io import loadmat
from scipy.misc import fromimage
from scipy.misc import imsave
from PIL import Image
from utils import *
import scipy.io as sio
import os

imgDir = './test/'
matDira = './mat/SSN/SSN_'
outDira = './img/SSN/SSN_'
spNum = [100, 150, 200, 250, 300, 600, 1000]

for num in spNum:

    matDir = matDira+str(num)+'/'
    outDir = outDira+str(num)+'/'
    if not os.path.exists(outDir):
        os.makedirs(outDir)
    print(num)

    image_list = 'test.txt'
    with open(image_list) as list_f:
        for imgname in list_f:
            imgname = imgname[:-1]
            # print(imgname)
            given_img = fromimage(Image.open(imgDir + imgname +'.jpg'))

            spix_index = loadmat(matDir+imgname+".mat")

            spixel_image = get_spixel_image(given_img, spix_index['Segmentation'])
            out_img_file = outDir+imgname+'.jpg'
            imsave(out_img_file, spixel_image)

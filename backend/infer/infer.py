# -*- coding: utf-8 -*-
"""
Created on Sun Nov  4 11:11:52 2018

@author: lenovo
"""
import json
from django.http import QueryDict
import h5py
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm as c
from tensorflow.keras.models import model_from_json
import time
import os
import json
from tensorflow import keras
from tensorflow.keras.preprocessing import image as image_utils
from tensorflow.keras.applications.imagenet_utils import preprocess_input

def load_model():
    # Function to load and return neural network model 
    json_file = open('infer/Model.json', 'r')
    loaded_model_json = json_file.read()
    json_file.close()
    model = keras.models.load_model("infer/model_A_weights.h5")
    # d = json.loads(json.dumps(loaded_model_json))
    # print(d)
    # loaded_model = model_from_json(d)
    # print(loaded_model)
    # loaded_model.load_weights("weights/model_A_weights.h5")
    return model

def create_img(path):
    #Function to load,normalize and return image 
    print(path)

    newpath = path[1:]
    print(newpath)
    image = image_utils.load_img(newpath, target_size=(224, 224))
    image = image_utils.img_to_array(image)
    image = image.reshape(1,224,224,3)
    image = preprocess_input(image)
    
    im = image/255.0
    
    # im[:,:,0]=(im[:,:,0]-0.485)/0.229
    # im[:,:,1]=(im[:,:,1]-0.456)/0.224
    # im[:,:,2]=(im[:,:,2]-0.406)/0.225


    # im = np.expand_dims(im,axis  = 0)
    return im

def predict(path):
    #Function to load image,predict heat map, generate count and return (count , image , heat map)
    model = load_model()
    image = create_img(path)
    # ans =   model.predict(image)
    preds = np.argmax(model.predict(image))
    print("Mahre")
    print(preds)
    return preds

def getPridiction(image):
    pred = predict(image)
    print("Predict Count:",pred)
    #Print count, image, heat map
    # plt.imshow(img.reshape(img.shape[1],img.shape[2],img.shape[3]))
    # plt.show()
    # plt.imshow(hmap.reshape(hmap.shape[1],hmap.shape[2]) , cmap = c.jet )
    # plt.show()
    # temp = h5py.File('ShanghaiTech/part_A/test_data/ground_truth/IMG_170.h5' , 'r')
    # temp_1 = np.asarray(temp['density'])
    # #plt.imshow(temp_1,cmap = c.jet)
    # print("Original Count : ",int(np.sum(temp_1)) + 1)
    with open('Model.json', 'r') as f:
        my_dict = json.load(f)
        for key, value in my_dict.items():
             if value == pred:
                    PredictedDisease=key
                    return PredictedDisease

# getPridiction('000.jpg')



def my_predict(path):
    #Function to load image,predict heat map, generate count and return (count , image , heat map)
    model = load_model()
    image = create_img(path)
    ans =   model.predict(image)
    count = np.sum(ans)
    return count

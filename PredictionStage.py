from tensorflow import keras
import json
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from tensorflow.keras.preprocessing import image as image_utils
from tensorflow.keras.applications.imagenet_utils import preprocess_input

model = keras.models.load_model('C:/Users/kochitopc/Desktop/TrainingCode/CropDiseaseIdentifier')
model.summary()
# def show_image(image_path):
#     image = mpimg.imread(image_path)
#     plt.imshow(image)

def make_predictions(image_path):
#     show_image(image_path)
    image = image_utils.load_img(image_path, target_size=(224, 224))
    image = image_utils.img_to_array(image)
    image = image.reshape(1,224,224,3)
    image = preprocess_input(image)
    preds = np.argmax(model.predict(image))
    return preds

def TranslatePredictions(image_path):
    Prediction = make_predictions(image_path)
    
    with open('class_indices.json', 'r') as f:
        my_dict = json.load(f)
        def get_key(val):
        for key, value in my_dict.items():
             if val == Prediction:
                    PredicedDisease=key
                    return PredicedDisease

PredictedDisease = make_predictions('data/presidential_doggy_door/valid/bo/bo_20.jpg')


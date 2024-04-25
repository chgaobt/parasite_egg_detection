from flask import Flask, request, jsonify
import roboflow
import tempfile
import numpy as np
import cv2
import base64
import matplotlib
import os
app = Flask(__name__)

@app.route("/", methods=['POST'])
def home():
    # json_file = {}
    # json_file['query'] = 'hello world'

    if 'imagefile' not in request.files:
        return 'File Not Found'
        
    try:
        imagefile = request.files['imagefile']
        if imagefile.filename == '':
            return 'No File Selected'
            
        temp_dir = tempfile.mkdtemp()
        temp_file_path = os.path.join(temp_dir, 'temp')
        imagefile.save(temp_file_path)
           
        rf = roboflow.Roboflow(api_key="YoZtPvlGVyx3HEeaxQWT")
        project = rf.workspace().project("ovos-de-parasitas-azoug")
        model = project.version("6").model
        model.confidence = 70
        model.overlap = 25
        prediction = model.predict(temp_file_path)

        return 'Done'
        #return jsonify(prediction.json())
    
    except Exception as e:
        return f'Error: {e}'
    

if __name__ == '__main__':
    app.run()

from flask import Flask, request, jsonify
from roboflow import Roboflow
import supervision as sv
import tempfile
import os
import io
app = Flask(__name__)

@app.route("/", methods=['POST','GET'])
def home():
    count = 0; 

    if(request.method == 'POST'): 
        if 'imagefile' not in request.files:
            return 'File Not Found'
        
        try:
            imagefile = request.files['imagefile']
        
            if imagefile.filename == '':
                return 'No File Selected'

            file_bytes = imagefile.read()

            with open('uploaded_img.jpeg','wb') as f:
                f.write(file_bytes)

            temp_dir = tempfile.mkdtemp()
            temp_file_path = os.path.join(temp_dir, 'temp')
            imagefile.save(temp_file_path)

            rf = Roboflow(api_key="YoZtPvlGVyx3HEeaxQWT")
            project = rf.workspace().project("ovos-de-parasitas-azoug")
            model = project.version(6).model

            result = model.predict(imagefile, confidence=40, overlap=30).json()

            detections = sv.Detections.from_inference(result)

            print(len(detections))

            count = len(detections)
            return jsonify(len(detections))
    
        except Exception as e:
            return f'Error: {e}'
    
    else: 
        return jsonify(count)


if __name__ == '__main__':
    app.run(host='0.0.0.0')

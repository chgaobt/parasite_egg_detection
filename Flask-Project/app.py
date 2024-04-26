from flask import Flask, request, jsonify
import roboflow
import supervision as sv
import tempfile
import os
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
            
            temp_dir = tempfile.mkdtemp()
            temp_file_path = os.path.join(temp_dir, 'temp')
            imagefile.save(temp_file_path)

            rf = roboflow(api_key="YoZtPvlGVyx3HEeaxQWT")
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
1
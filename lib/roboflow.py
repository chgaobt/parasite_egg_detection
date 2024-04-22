import roboflow

rf = roboflow.Roboflow(api_key="YoZtPvlGVyx3HEeaxQWT")

project = rf.workspace().project("ovos-de-parasitas-azoug")
model = project.version("6").model

# optionally, change the confidence and overlap thresholds
# values are percentages
model.confidence = 60
model.overlap = 25

# predict on a local image
prediction = model.predict("images/parasiteEgg.jpg")

# Predict on a hosted image via file name
#prediction = model.predict("YOUR_IMAGE.jpg", hosted=True)

# Predict on a hosted image via URL
#prediction = model.predict("https://...", hosted=True)

# Plot the prediction in an interactive environment
prediction.plot()

# Convert predictions to JSON
prediction.json()
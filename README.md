# Parasite Egg Detection App

This application makes it easier for farmers raising ruminating animals (such as sheep, goats, and cattle) to detect parasite eggs in fecal samples.

## Background

Inspiration for this project came from a local Charlottesville, Virginia fiber farmer who owns multiple Angora goats. She shared a difficulty with Barber Pole Worms (Haemonchus contortus) infecting her goats which causes haemonchosis, anemia, and death. Haemonchosis is one of the most common parasitic diseases that affects animals worldwide. 

This flutter application can detect parasite eggs from photos of animal fecal samples, streamlining farmers' diagnosis process. Currently, many farmers have to send fecal samples to a veterinarian, who will manually count the parasite eggs, and send the results back. This process commonly takes up to two weeks. 

## Usage 
### Flow
1. User is prompted to upload a fecal sample image from their iPhone gallery
2. Uploaded image is sent to a backend Python Flask project for processing
3. Flask project will run a Roboflow object detection model on the image
4. Model will count the parasite eggs found and return the count
5. Flutter application receives the count
6. Count is displayed for the user to see

# MotionMimic
> MotionMimic is an interactive art creation application that utilises gesture recognition to generate colorful circles on the screen. Users can create unique artwork by simply detecting hand gestures.

## Table of Contents
* [General Information](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Usage](#usage)
* [Project Status](#project-status)
* [Room for Improvement](#room-for-improvement)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)

## General Information
- **Problem Solved**: MotionMimic addresses the need for accessible art creation tools, allowing users to express their creativity through gestures.
- **Purpose**: The purpose of this project is to merge technology and art, providing an innovative way to engage with digital creativity.
- **Motivation**: I undertook this project to explore the intersection of technology and art, particularly focusing on accessibility for those who may have difficulty using traditional art tools.

## Technologies Used
- Processing - version 3.5.4
- OpenCV for Processing - version 3.0.0
- Java - version 8

## Features
List the ready features here:
- Gesture recognition for circle creation
- Real-time video processing
- Colorful visual feedback based on gestures

## Screenshots
![Example screenshot](./img/screenshot.png)
<!-- Include screenshots of your application in action here. -->

## Setup
The project requires Processing and the OpenCV library for Processing. Follow these steps to set up your local environment:
1. Install Processing from [processing.org](https://processing.org/download/).
2. Install the OpenCV for Processing library via the Processing Library Manager.
3. Clone the repository to your local machine.
4. Open the MotionMimic.pde file in Processing.

## Usage
To use MotionMimic, run the program in Processing. Once the camera feed is displayed, make circular gestures in front of the camera. To ensure the gesture is detected and new circles continue to appear on the screen, adjust your hand movements accordingly.
Import Libraries

<img width="718" alt="Screenshot 2024-11-09 at 8 58 13 pm" src="https://github.com/user-attachments/assets/98b11e57-c540-465d-be15-25b667a3b188">


Variables

<img width="1063" alt="Screenshot 2024-11-09 at 8 59 20 pm" src="https://github.com/user-attachments/assets/e012704b-9235-437f-9efb-01b8ac868443">



Setup Function

<img width="755" alt="Screenshot 2024-11-09 at 9 01 06 pm" src="https://github.com/user-attachments/assets/595e8b58-ae10-4cac-89d5-aa453f7d5688">




Main Drawing Function

<img width="1033" alt="Screenshot 2024-11-09 at 9 02 52 pm" src="https://github.com/user-attachments/assets/6cab2947-8a6d-44e1-883d-98ddf4befb3d">




Circle Detection Logic

<img width="854" alt="Screenshot 2024-11-09 at 9 03 49 pm" src="https://github.com/user-attachments/assets/bb987a83-004f-4681-855d-fe4f84591c5b">




Display Artwork Circles

<img width="364" alt="Screenshot 2024-11-09 at 9 04 48 pm" src="https://github.com/user-attachments/assets/54aa5b5e-63aa-4f8c-bd39-c053ff054e81">




Circle Class

<img width="762" alt="Screenshot 2024-11-09 at 9 05 15 pm" src="https://github.com/user-attachments/assets/57f309f1-ce8d-4c35-b0bf-66658944c02c">



## Acknowledgements
Ishmael Perez . (2019). GitHub - ishfulthinking/Python-Hand-Gesture-Recognition: A guide to using Python and OpenCV2 to create an application that can recognize hand gestures/movements. GitHub. https://github.com/ishfulthinking/Python-Hand-Gesture-Recognition?tab=readme-ov-file#step-1a-import-libraries-and-create-global-variables

Bleed AI Academy. (2021, May 25). Contour Detection In OpenCV 101 (1/3): The Basics. YouTube. https://www.youtube.com/watch?v=JfaZNiEbreE

Goncharov, I. (2022, March 14). Custom Hand Gesture Recognition with Hand Landmarks Using Google’s Mediapipe + OpenCV in Python. Www.youtube.com. https://www.youtube.com/watch?v=a99p_fAr6e4
gsnikitin.(2017, April 4). OpenCV circles detection with threshold, edges and contours in Python. YouTube. https://www.youtube.com/watch?v=P4RgDyP4evQ

Hassan, M. (2019, November 10). How to Detect Shapes with OpenCV [Python]. Www.youtube.com. https://www.youtube.com/watch?v=Wl11eloYVm8

Knowledge, P. (2019). OpenCV Python Tutorial For Beginners 24 - Motion Detection and Tracking Using Opencv Contours [YouTube Video]. In YouTube. https://www.youtube.com/watch?v=MkcUgPhOlP8

LearnOpenCV. (2024, February 26). Image Thresholding in OpenCV. YouTube. https://www.youtube.com/watch?v=BA00xTv5-Z4

Matthes, E. (n.d.). Beginner’s Python Cheat Sheet Variables and Strings.

Matthes, E. (2023). Python Crash Course, 3rd Edition. No Starch Press.OpenCV. (n.d.). 

OpenCV: Image Thresholding. Docs.opencv.org. https://docs.opencv.org/4.x/d7/d4d/tutorial_py_thresholding.html

## Project Status
Project is: _complete_. This project has successfully reached its intended goal of using hand gesture recognition to create art.

## Room for Improvement
- Buffering could be improved for a clearer screen, reducing latency between the gesture detection and artwork display.
- More noticeable gestures should be implemented to create a clearer and more intuitive connection between gestures and the generated artwork.

To do:
- Implement functionality to create circles in different parts of the screen for various colors to appear, making it easier to create diverse and dynamic projects.
- Enhance the user interface to allow users to select color schemes or patterns for their artwork.

## Contact
Created by [@hstevenson03](https://github.com/hstevenson03) - feel free to contact me!

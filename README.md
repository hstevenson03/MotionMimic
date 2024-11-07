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
To use MotionMimic, run the program in Processing. When the camera feed is displayed, use your hands to create circular gestures in front of the camera. The application will detect these gestures and generate colorful circles on the screen.

Import Libraries

<img width="642" alt="Screenshot 2024-11-07 at 1 52 51 pm" src="https://github.com/user-attachments/assets/966dde56-378f-4307-ba20-28d7a0582546">


Variables

<img width="703" alt="Screenshot 2024-11-07 at 1 56 52 pm" src="https://github.com/user-attachments/assets/b6904dfd-191f-4a6c-9e5a-f702d11a0215">


Setup Function

<img width="572" alt="Screenshot 2024-11-07 at 1 57 14 pm" src="https://github.com/user-attachments/assets/4d74571f-783c-4cda-b2e8-3bd2e64fbcf1">


Main Drawing Function

<img width="712" alt="Screenshot 2024-11-07 at 1 58 25 pm" src="https://github.com/user-attachments/assets/2468bb7d-28da-4c74-8cc4-58469ddd13d0">


Circle Detection Logic

<img width="1034" alt="Screenshot 2024-11-07 at 2 02 15 pm" src="https://github.com/user-attachments/assets/e441f26f-a8c7-4a8a-83c9-562f32bf656c">


Display Artwork Circles

<img width="598" alt="Screenshot 2024-11-07 at 2 08 57 pm" src="https://github.com/user-attachments/assets/49a7b155-df03-4f25-8b3d-2a2ac340d2b3">


Circle Class

<img width="616" alt="Screenshot 2024-11-07 at 2 09 22 pm" src="https://github.com/user-attachments/assets/f55f5481-dcb4-46aa-a31d-3d8ad2d77ba3">


## Acknowledgements
get from reference list

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

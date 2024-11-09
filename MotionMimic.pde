// Import necessary libraries for video capture and processing
import gab.opencv.*;
import processing.video.*;
import java.util.ArrayList;
import java.awt.Rectangle;

// Initialize OpenCV and video capture objects
OpenCV opencv; // Ishmael Perez. GitHub - ishfulthinking/Python-Hand-Gesture-Recognition
Capture video; // Ishmael Perez. GitHub - ishfulthinking/Python-Hand-Gesture-Recognition

// Create an image for threshold processing
PImage thresholdImg; // LearnOpenCV. Image Thresholding in OpenCV

// Parameters for detecting circles
int minCircleRadius = 50; // Ishmael Perez. GitHub - ishfulthinking/Python-Hand-Gesture-Recognition
float minCircularity = 0.8; // Hassan, M. How to Detect Shapes with OpenCV
boolean circleDetected = false; // Hassan, M. How to Detect Shapes with OpenCV
boolean circleDetectedLastFrame = false; // Hassan, M. How to Detect Shapes with OpenCV

// ArrayList to store circles generated as artwork
ArrayList<Circle> artworkCircles = new ArrayList<Circle>(); // Ishmael Perez. GitHub - ishfulthinking/Python-Hand-Gesture-Recognition

void setup() {
  size(1000, 480); // Set the window size // Knowledge, P., OpenCV setup basics
  video = new Capture(this, 640, 480); // Initialize video capture at 640x480 resolution
  opencv = new OpenCV(this, 640, 480); // Set up OpenCV for the same resolution
  video.start(); // Start capturing video
  // Gesture Recognition with OpenCV and Processing" (Hassan, 2019)
  // GitHub - ishfulthinking/Python-Hand-Gesture-Recognition" (Ishmael Perez)
}

void draw() {
  background(255); // Set background to white
  // Gesture Recognition with OpenCV and Processing" (Hassan, 2019)
  // GitHub - ishfulthinking/Python-Hand-Gesture-Recognition" (Ishmael Perez)

  // Check if there’s new video frame available
  if (video.available()) {
    video.read(); // Read the latest frame
    video.loadPixels();
    
    // Mirror the video horizontally // Gesture Recognition with OpenCV and Processing (Hassan, 2019)
    for (int x = 0; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        int loc = x + y * video.width;
        int mirrorLoc = (video.width - 1 - x) + y * video.width;
        color c = video.pixels[mirrorLoc];
        video.pixels[loc] = c; // Swap pixels for horizontal mirroring
      }
    }
    video.updatePixels(); // Update the mirrored pixels in the video frame
  }
 
  // Convert video frame to grayscale and apply a threshold to detect shapes
  opencv.loadImage(video); // Corrected line without the colon
  opencv.gray(); // Convert to grayscale // Original Code
  opencv.threshold(100); // Apply a threshold to highlight shapes // Original Code
  thresholdImg = opencv.getOutput(); // Get the processed image
  image(thresholdImg, 0, 0); // Display the thresholded image on screen
 
  // Draw a rectangle on the right side to contain generated artwork circles // OpenCV Circles Detection with Threshold, Edges and Contours in Python (gsnikitin, 2017)
  stroke(0);
  noFill();
  rect(640, 0, 160, 480);

  // Reset circle detection flag for this frame
  circleDetected = false;

  // Find contours in the thresholded image
  ArrayList<Contour> contours = opencv.findContours(); // Goncharov I., 2022
  
  // Loop through each contour to check for circle-like shapes // Bleed AI Academy. Contour Detection In OpenCV 101
  for (Contour contour : contours) {
    float contourArea = contour.area(); // Calculate the area of the contour
    if (contourArea > 3000) { // Minimum area threshold to filter out small shapes
      Rectangle boundingBox = contour.getBoundingBox();
      float width = boundingBox.width;
      float height = boundingBox.height;
      float aspectRatio = width / height; // Calculate the aspect ratio to check circularity

      float boundingBoxArea = width * height;
      float circularity = contourArea / boundingBoxArea; // Circularity based on area within bounding box
      // Check if contour is approximately circular and meets size requirements
      if (aspectRatio > 0.95 && aspectRatio < 1.05 && circularity > minCircularity && width >= minCircleRadius * 2) {
        noFill();
        stroke(0, 255, 0); // Green stroke for detected circle
        strokeWeight(2);
        contour.draw(); // Draw the detected circle contour

        // Display a message indicating circle gesture detection // Goncharov.I (2022) Custom Hand Gesture recognition using Google's MediaPipe + OpenCV in Python
        fill(255, 0, 0);
        textSize(20);
        text("Circle Gesture Detected!", 10, height - 10);

        // Set circleDetected to true and add artwork circle if new detection
        circleDetected = true;

        if (!circleDetectedLastFrame) { // Only add a circle if it wasn’t detected in the last frame
          float randomX = random(660, 960); // Random x-coordinate in artwork area
          float randomY = random(30, 450); // Random y-coordinate in artwork area

          // Add a new circle with random color to artwork // OpenCV Circles Detection with Threshold, Edges and Contours in Python (gsnikitin, 2017)
          artworkCircles.add(new Circle(randomX, randomY, 100, color(random(255), random(255), random(255))));
        }
      }
    }
  }

  // Update the last frame's circle detection status
  circleDetectedLastFrame = circleDetected;

  // Display each artwork circle in the list
  for (Circle c : artworkCircles) {
    c.display(); // Call the display method for each circle
  }
}

// Circle class to define and display artwork circles // OpenCV Circles Detection with Threshold, Edges and Contours in Python (gsnikitin, 2017)
class Circle {
  float x, y, diameter;
  color c;

  // Constructor to initialise circle properties // OpenCV Circles Detection with Threshold, Edges and Contours in Python (gsnikitin, 2017)
  Circle(float x, float y, float diameter, color c) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    this.c = c;
  }

  // Display method to draw the circle // Open CV Circles Detection with threshold Edges and Contours in Python (gsnikitin, 2017)
  void display() {
    fill(c, 150); // Set fill color with transparency
    noStroke();
    ellipse(x, y, diameter, diameter); // Draw the circle as an ellipse
  }
}

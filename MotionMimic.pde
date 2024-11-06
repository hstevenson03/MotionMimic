// Import necessary libraries for video capture and processing
import gab.opencv.*;
import processing.video.*;
import java.util.ArrayList;
import java.awt.Rectangle;

// Declare global variables
OpenCV opencv;  // For image processing
Capture video;  // For video capture
PImage thresholdImg;  // Stores processed image
int minCircleRadius = 50;  // Minimum radius for detected circles
float minCircularity = 0.8;  // Minimum threshold for circularity
boolean circleDetected = false;  // Flag for circle detection
boolean circleDetectedLastFrame = false;  // Tracks detection across frames

ArrayList<Circle> artworkCircles = new ArrayList<Circle>();  // Stores artwork circles

void setup() {
  size(1000, 480);  // Set canvas size
  video = new Capture(this, 640, 480);  // Initialise video capture
  opencv = new OpenCV(this, 640, 480);  // Initialise OpenCV
  video.start();  // Start video
}

void draw() {
  background(255);  // Clear canvas
  
  if (video.available()) {
    video.read();
    video.loadPixels();

    // Mirror video feed
    for (int x = 0; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        int loc = x + y * video.width;
        int mirrorLoc = (video.width - 1 - x) + y * video.width;
        video.pixels[loc] = video.pixels[mirrorLoc];
      }
    }
    video.updatePixels();
  }
  
  opencv.loadImage(video);  // Process video frame
  opencv.gray();
  opencv.threshold(100);
  thresholdImg = opencv.getOutput();
  image(thresholdImg, 0, 0);

  rect(640, 0, 160, 480);  // Draw rectangle for artwork section

  circleDetected = false;
  ArrayList<Contour> contours = opencv.findContours();

  // Check each contour for circularity
  for (Contour contour : contours) {
    float contourArea = contour.area();
    if (contourArea > 3000) { 
      Rectangle boundingBox = contour.getBoundingBox();
      float width = boundingBox.width;
      float height = boundingBox.height;
      float aspectRatio = width / height;
      float boundingBoxArea = width * height;
      float circularity = contourArea / boundingBoxArea;

      if (aspectRatio > 0.95 && aspectRatio < 1.05 && circularity > minCircularity && width >= minCircleRadius * 2) {
        contour.draw();  // Draw detected circle
        text("Circle Gesture Detected!", 10, height - 10);

        circleDetected = true;

        if (!circleDetectedLastFrame) {  // Add new artwork circle on first detection
          artworkCircles.add(new Circle(random(660, 960), random(30, 450), 100, color(random(255), random(255), random(255))));
        }
      }
    }
  }
  
  circleDetectedLastFrame = circleDetected;

  // Display all artwork circles
  for (Circle c : artworkCircles) {
    c.display();
  }
}

// Circle class for creating and displaying artwork circles
class Circle {
  float x, y, diameter;
  color c;

  Circle(float x, float y, float diameter, color c) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    this.c = c;
  }

  void display() {
    fill(c, 150);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}

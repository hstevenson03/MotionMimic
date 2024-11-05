import gab.opencv.*;
import processing.video.*;
import java.util.ArrayList;
import java.awt.Rectangle;

OpenCV opencv;
Capture video;
PImage thresholdImg;
int minCircleRadius = 50;
float minCircularity = 0.8; 
boolean circleDetected = false;
boolean circleDetectedLastFrame = false;

ArrayList<Circle> artworkCircles = new ArrayList<Circle>();

void setup() {
  size(1000, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  video.start();
}

void draw() {
  background(255);

  if (video.available()) {
    video.read();
    video.loadPixels();
    for (int x = 0; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        int loc = x + y * video.width;
        int mirrorLoc = (video.width - 1 - x) + y * video.width;
        color c = video.pixels[mirrorLoc];
        video.pixels[loc] = c;
      }
    }
    video.updatePixels();
  }
  
  opencv.loadImage(video);
  
  opencv.gray();
  opencv.threshold(100);
  thresholdImg = opencv.getOutput();
  image(thresholdImg, 0, 0);
  
  stroke(0);
  noFill();
  rect(640, 0, 160, 480);

  circleDetected = false;
  ArrayList<Contour> contours = opencv.findContours();

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
        noFill();
        stroke(0, 255, 0);
        strokeWeight(2);
        contour.draw();

        fill(255, 0, 0);
        textSize(20);
        text("Circle Gesture Detected!", 10, height - 10);
        
        circleDetected = true;

        if (!circleDetectedLastFrame) {
          float randomX = random(660, 960);
          float randomY = random(30, 450);
          artworkCircles.add(new Circle(randomX, randomY, 100, color(random(255), random(255), random(255))));
        }
      }
    }
  }
  
  circleDetectedLastFrame = circleDetected;
  
  for (Circle c : artworkCircles) {
    c.display();
  }
}

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

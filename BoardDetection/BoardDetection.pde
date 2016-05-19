import java.util.*;
import processing.video.*;
Capture cam;
PImage img;
PImage accumulatorImg;
PImage base;


float[][]  gaussianBlur= { { 9, 12, 9 }, 
    { 12, 15, 12 }, 
    { 9, 12, 9 } };

void settings() {
  //size(640, 480);  // size for the cam
  size(2200, 600);
}
void setup() {
  /*String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
        println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();
  }

  if (cam.available() == true) {
      cam.read();
      base = cam.get();
    } else {
      base = loadImage("board4.jpg");
    }*/
  
  base = loadImage("board4.jpg");
  
  //thresholds
  img = hueInterval(base, 100, 135);
  img = brightInterval(img, 30, 200);  
  img = satInterval(img, 80, 255);
 
  //blur
  img = convolute(img,gaussianBlur, 10f); 
  
  
  img = binaryThreshold(img, 40);
  
  //sobel
  img = sobel(img);
  noLoop(); // no interactive behaviour: draw() will be called only once.
  
  
}
void draw() {
 
  //base.resize(400, 300); 
  image(base, 0, 0);
  /*ArrayList<PVector>lines = hough(img);
  getIntersections(lines);
  //accumulatorImg.resize(300, 300); 
  image(accumulatorImg, 800, 0);
  
  //img.resize(300, 400); 
  image(img, 1400, 0);*/
  
  QuadGraph graph = new QuadGraph();
  ArrayList<PVector> lines = hough(img);
  graph.build(lines, width, height);
  List<int[]> quads = graph.findCycles();
  getIntersections(lines);

  //accumulatorImg.resize(300, 300); 
  image(accumulatorImg, 800, 0);
  
  //img.resize(300, 400); 
  image(img, 1400, 0);
  
  
  for (int[] quad : quads) {
    PVector l1 = lines.get(quad[0]);
    PVector l2 = lines.get(quad[1]);
    PVector l3 = lines.get(quad[2]);
    PVector l4 = lines.get(quad[3]);

    PVector c12 = intersection(l1, l2);
    PVector c23 = intersection(l2, l3);
    PVector c34 = intersection(l3, l4);
    PVector c41 = intersection(l4, l1);
    
    // Choose a random, semi-transparent colour
    Random random = new Random();
    fill(color(min(255, random.nextInt(300)),
    min(255, random.nextInt(300)),
    min(255, random.nextInt(300)), 50));
    quad(c12.x,c12.y,c23.x,c23.y,c34.x,c34.y,c41.x,c41.y);
  }
  
}


PImage img;
PImage accumulatorImg;
PImage base;

void settings() {
  size(2200, 600);
}
void setup() {
  base = loadImage("board1.jpg");
  img = hueInterval(base, 100, 135);
  img = brightInterval(img, 30, 200);  
  img = satInterval(img, 80, 255);
  img = gaussianBlur(img);
  img = binaryThreshold(img, 40);
  img = sobel(img);
  noLoop(); // no interactive behaviour: draw() will be called only once.
}
void draw() {
  image(base, 0, 0);
  ArrayList<PVector> lines = hough(img);
  ArrayList<PVector> intersections = getIntersections(lines);
  image(accumulatorImg, 800, 0);
  image(img, 1400, 0);
}
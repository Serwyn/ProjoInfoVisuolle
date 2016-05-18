

PImage img;
PImage accumulatorImg;
PImage base;

void settings() {
  size(2200, 600);
}
void setup() {
  base = loadImage("board1.jpg");
  img = hueInterval(base, 80, 135);
  img = brightInterval(img, 60, 150);  
  img = satInterval(img, 100, 255);
  img = gaussianBlur(img);
  img = binaryThreshold(img, 10);
  img = sobel(img);
  noLoop(); // no interactive behaviour: draw() will be called only once.
}
void draw() {
  image(base,0,0);
  hough(img);
  image(accumulatorImg, 800, 0);
  image(img, 1400, 0);
}
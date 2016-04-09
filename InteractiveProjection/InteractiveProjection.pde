// Definition des variables globales 
public float myScale = 1;
public float MouseY;
public float rotationX;
public float rotationY; 

// autres variables 
float depth = 2000;
int  size = 400;



void settings() {
  size(1000, 1000, P2D);
}
void setup() {
   strokeWeight(4);
}
void draw() {
  background(255, 255, 255);
  keyPressed(); 

  My3DPoint eye = new My3DPoint(0, 0, -5000);
  My3DPoint origin = new My3DPoint(0, 0, 0);
  
  My3DBox input3DBox = new My3DBox(origin, size, size, size);
  
  //rotated around x
  float[][] transform1 = rotateXMatrix(rotationX);
  input3DBox = transformBox(input3DBox, transform1);
  
  //rotated around y 
  float[][] transform2 = rotateYMatrix(rotationY);
  input3DBox = transformBox(input3DBox, transform2);

  //scaled
  float[][] transform3 = scaleMatrix(myScale, myScale, myScale);
  input3DBox = transformBox(input3DBox, transform3);
  
  
  //translated
  float[][] transform4 = translationMatrix(width/2 - size/2 * myScale, height/2 - size/2 * myScale, 0);
  input3DBox = transformBox(input3DBox, transform4);
  
  //display
  projectBox(eye, input3DBox).render();
}
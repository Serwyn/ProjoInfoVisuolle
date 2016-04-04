
void settings() {
  size (1000, 1000, P2D);
}

void setup()  {
  background(255, 255, 255);
  noLoop();
}

void draw() {
  My3DPoint eye = new My3DPoint(-100, -100, -5000);
  My3DPoint origin = new My3DPoint(50, 50, 50);
  My3DBox input3DBox = new My3DBox(origin, 100, 150, 300);
  //rotated around x
  float[][] transform1 = rotateXMatrix(PI/2);
  input3DBox = input3DBox.transformBox(transform1);
  input3DBox.projectBox(eye).render();  
  //rotated and translated
  float[][] transform2 = translationMatrix(200, 200, 0);
  input3DBox = input3DBox.transformBox(transform2);
  input3DBox.projectBox(eye).render();  //rotated, translated, and scaled
  float[][] transform3 = scaleMatrix(2, 2, 2);
  input3DBox = input3DBox.transformBox(transform3);
  input3DBox.projectBox(eye).render();
}
My3DBox input3DBox;
My3DPoint eye;
float boxX, boxY, boxZ;

void settings() {
  size (200, 200, P3D);
}

void setup()  {
  boxX = 100f;
  boxY = 150f;
  boxZ = 300f;
  eye = new My3DPoint(-200, -200, -5000);
  My3DPoint origin = new My3DPoint(450, 450, 450);
  input3DBox = new My3DBox(origin, boxX, boxY, boxZ);
}

void draw() {
  // Update the scale with mouse dragging
  background(255, 255, 255);
  float[][] scaleMatrix = scaleMatrix(scaleFactor, scaleFactor, scaleFactor);
  input3DBox.transformBox(scaleMatrix).projectBox(eye).render();
}
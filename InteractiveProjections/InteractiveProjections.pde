My3DBox input3DBox;
My3DPoint eye;

void settings() {
  size (1000, 1000, P2D);
}

void setup()  {
  background(255, 255, 255);
  eye = new My3DPoint(-200, -200, -5000);
  My3DPoint origin = new My3DPoint(450, 450, 450);
  input3DBox = new My3DBox(origin, 100, 150, 300);
  noLoop();
}

void draw() {
  input3DBox.projectBox(eye).render();

  // Update the scale with mouse dragging
  float[][] scaleMatrix = scaleMatrix(value, value, value);
  input3DBox = input3DBox.transformBox(scaleMatrix);
  input3DBox.projectBox(eye).render();
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66); 
}
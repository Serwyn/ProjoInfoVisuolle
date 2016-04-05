float depth = 2000;
float rx = 0f;
float rz = 0f;
float offsetX = 0f;
float offsetZ = 0f;
float speed = 1f;
float rxSum = 0f;
float rzSum = 0f;
PFont f;

void settings() {
  size (1920, 1200, P3D);
}

void setup() {
  surface.setResizable(true);
  f = createFont("Arial", 16, true);
  textFont(f, 36);
  noStroke();
}

void draw() {
  camera(0, 0, depth, 0, 0, 0, 0, 1, 0);
  directionalLight(50, 100, 125, 0, -1, 0);
  ambientLight(30, 0, 10);
  background(200);
  text("Rot X : " + rxSum + " Rot Z : " + rzSum + " speed : " + speed, width/2, height/2);
  pushMatrix();
  if (rxSum >= -PI/3 || rxSum <= PI/3) rotateX(rx);
  if (rzSum >= -PI/3 || rzSum <= PI/3) rotateZ(rz);
  box(1500, 100, 1500);
  popMatrix();
}

void mouseDragged() {
  rx = map(mouseX-offsetX, 0, height, 0, 2*PI)*speed;
  rz = map(mouseY-offsetZ, 0, width, 0, 2*PI)*speed;
  rxSum += rx;
  rzSum += rz;
}

void mousePressed() {
  offsetX = mouseX;
  offsetZ = mouseY;
}

void mouseWheel(MouseEvent event) {
  speed += event.getCount()/10f;
  if (speed < 0.2) speed = 0.2;
  if (speed > 1.5) speed = 1.5;
}
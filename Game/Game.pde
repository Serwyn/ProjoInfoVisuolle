void settings() {
  size(gameSize, gameSize, P3D);
}
void setup() {
  cylinderSetup();
}

void draw() {
  background(200);
  if (!pause) { 
    draw3DBoard();
    drawCylindersOn3DBoard();
    noStroke();
    velocity = ballVelocityVector();
    bounceEffect();
    drawSphere();
  } else {
    draw2DBoard();
    drawCylindersOn2DBoard();
  }
}
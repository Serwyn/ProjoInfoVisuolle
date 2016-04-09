void settings() {
  size(gameSize, gameSize, P3D);
}
void setup() {
  cylinderSetup();
}

void draw() {
  pointLight(255, 255, 255, gameSize+100, 100, gameSize+100);
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
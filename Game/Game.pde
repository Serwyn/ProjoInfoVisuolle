void settings() {
  size(gameSize, gameSize, P3D);
}
void setup() {
  cylinderSetup();
  setupUI();
  //String[] fontList = PFont.list();
  //printArray(fontList);
}

void draw() {
  
  background(200);
  drawUI();
  if (!pause) { 
    pointLight(255, 255, 255, gameSize+100, 100, gameSize+100);
    draw3DBoard();
    drawCylindersOn3DBoard();
    noStroke();
    velocity = ballVelocityVector();
    bounceEffect();
    drawSphere();
  } else {
    draw2DBoard(gameSize*0.1, gameSize*0.1, gameSize*0.8);
    drawCylindersOn2DBoard(gameSize*0.1, gameSize*0.1, gameSize*0.8);
  }
}
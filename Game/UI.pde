void setupUI() {
  mySurface = createGraphics(gameSize, gameSize, P2D);
  myScore = createGraphics((int)(0.8*0.15*4*gameSize), (int)(0.8*0.15*gameSize), P2D);
  calibri = createFont("Disco Duck", 32);
}



void drawUI() {
  mySurface.beginDraw();
  mySurface.fill(230, 255, 110);
  mySurface.noStroke();
  mySurface.rect(0, 0.85*gameSize, gameSize, 0.15*gameSize );
  draw2DBoard(0.015*gameSize, 0.865*gameSize, 0.8*0.15*gameSize, mySurface);
  drawCylindersOn2DBoard(0.015*gameSize, 0.865*gameSize, 0.8*0.15*gameSize, mySurface);
  drawSphereOn2DBoard(0.015*gameSize, 0.865*gameSize, 0.8*0.15*gameSize, mySurface);
  mySurface.endDraw();
  image(mySurface, 0, 0);
  
  myScore.beginDraw();
  myScore.clear();
  myScore.fill(0, 0, 0);
  myScore.textFont(calibri);
  myScore.stroke(0,0,0);
  myScore.textSize(24);
  myScore.text("Previous score: "+str((int)prev), 10, 30); 
  myScore.text("Actual score:   "+str((int)score), 10, 60);
  myScore.text("Velocity:       "+str((int)velocity.mag()), 10, 90);
  myScore.endDraw();
  image(myScore, 0.9*0.15*gameSize, 0.865*gameSize);
  

}
void setupUI() {
  mySurface = createGraphics(gameSize, gameSize, P2D);
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
  

}
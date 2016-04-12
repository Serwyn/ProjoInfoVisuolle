void draw3DBoard() {
  if (click) {
    // The formula is to bound rotation to 60°, and use the sensibility factor
    alpha = max(min(alpha1+(mouseY-centreY)/sensibilite*PI/3.0, PI/3.0), -PI/3.0); 
    beta  = max(min(beta1+(mouseX-centreX)/sensibilite*PI/3.0, PI/3.0), -PI/3.0);
  }
  translate(gameSize/2, gameSize/2, gameSize*2/5); // put the plate in the center of our window
  pushMatrix();
  rX = alpha;
  rZ = beta;
  rotate(rZ); // rotate Z axis function of mouse
  rotateX(rX); // rotate X axis function of mouse
  stroke(255);
  fill(70, 70, 70); // fill the stroke light grey
  box(boox, 10, boox);
  fill(255, 255, 255); // fill the board black
}

void draw2DBoard(float x, float y, float size, PGraphics truc) {
  truc.fill(30, 30, 30);
  truc.rect(x, y, size, size);
  truc.fill(255, 255, 255);
}

void draw2DBoard(float x, float y, float size) {
  draw2DBoard(x, y, size, g);
}
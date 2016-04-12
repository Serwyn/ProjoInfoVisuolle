// Sets up the cylinders shape
void cylinderSetup() {
  float angle;
  float[] x = new float[cylinderResolution + 1];
  float[] y = new float[cylinderResolution + 1];
  //get the x and y position on a circle for all the sides
  for (int i = 0; i < x.length; i++) {
    angle = (TWO_PI / cylinderResolution) * i;
    x[i] = sin(angle) * cylinderBaseSize;
    y[i] = cos(angle) * cylinderBaseSize;
  }

  cylinder = createShape();
  //BAS

  cylinder.beginShape(TRIANGLE);
  cylinder.vertex(x[0], y[0], 0);
  for (int i = 0; i < x.length; i++) {
    cylinder.vertex(x[i], y[i], 0);
    cylinder.vertex(0, 0, 0);
    if (i!=x.length-1) {
      cylinder.vertex(x[i], y[i], 0);
    }
  }
  cylinder.endShape();

  //HAUT
  cylinder.beginShape(TRIANGLE);
  cylinder.vertex(x[0], y[0], cylinderHeight);
  for (int i = 0; i < x.length; i++) {
    cylinder.vertex(x[i], y[i], cylinderHeight);
    cylinder.vertex(0, 0, cylinderHeight);
    if (i!=x.length-1) {
      cylinder.vertex(x[i], y[i], cylinderHeight);
    }
  }
  cylinder.endShape();

  //BORDS
  cylinder.beginShape(QUAD_STRIP);
  for (int i = 0; i < x.length; i++) {
    cylinder.vertex(x[i], y[i], 0);
    cylinder.vertex(x[i], y[i], cylinderHeight);
  }
  cylinder.endShape();
}

// Draws cylinders in the game
void drawCylindersOn3DBoard() { 
  for (PVector v : cylindres) {
    pushMatrix();
    translate(v.x, 0, v.y);
    rotateX(PI/2);
    shape(cylinder);
    popMatrix();
  }
  popMatrix();
}

// Draws Cylinder in the sky view of the board
void drawCylindersOn2DBoard(float x, float y, float size) {
  drawCylindersOn2DBoard(x, y, size, g);
}
void drawCylindersOn2DBoard(float x, float y, float size, PGraphics truc) {
  ratio = size/boox;
  for (PVector v : cylindres) {
    truc.ellipse(v.x*ratio+x+size/2, v.y*ratio+y+size/2, 2*cylinderBaseSize*ratio, 2*cylinderBaseSize*ratio);
  }
}

// Activates the bounce effect on cylinders
void bounceEffect() {
  for (PVector v : cylindres) {
    println(v.x, v.y, sphereuh.x, sphereuh.z);
    float d = sqrt(pow((sphereuh.x-v.x), 2) + pow((sphereuh.z-v.y), 2));
    if (d<cylinderBaseSize+radius) {
      println(true);
      PVector n = (new PVector(v.x-sphereuh.x, v.y-sphereuh.z)).normalize();
      float sp = velocity.x*n.x+velocity.z*n.y;
      velocity = new PVector(velocity.x-2*sp*n.x, 0, velocity.z-2*sp*n.y);
      sphereuh.x-=n.x*(cylinderBaseSize+radius-d);
      sphereuh.z-=n.y*(cylinderBaseSize+radius-d);
      
    }
  }
}
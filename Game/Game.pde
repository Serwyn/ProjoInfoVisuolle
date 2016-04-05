
int gameSize = 800;
float rX, rZ = 0;
float sM = 400;
float alpha1 = 0;
float beta1 = 0;
float alpha = 0;
float beta = 0;
boolean click = false;
float centreX = 0;
float centreY = 0;
PVector gravityForce = new PVector(0, 0, 0);
PVector velocity = new PVector(0, 0, 0);
PVector sphereuh = new PVector(0, 0, 0);
float boox = 200;
float g = 0.2;
float radius = 15;
float cylinderBaseSize = 20;
float cylinderHeight = 40;
int cylinderResolution = 40;
PShape cylinder = new PShape();
float ratio = (gameSize*0.8)/(boox);
boolean pause = false;

ArrayList<PVector> cylindres = new ArrayList();


void settings() {
  size(gameSize, gameSize, P3D);
}
void setup() {
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

void draw() {

  background(200);
  if (!pause) {
    if (click == true) {
      alpha = max(min(alpha1+(mouseY-centreY)/sM*PI/3.0, PI/3.0), -PI/3.0);
      beta  = max(min(beta1+(mouseX-centreX)/sM*PI/3.0, PI/3.0), -PI/3.0);
    }

    translate(gameSize/2, gameSize/2, gameSize/2);
    pushMatrix();
    rX = alpha;
    rZ = beta;
    rotate(rZ);
    rotateX(rX);
    stroke(255);
    fill(30, 30, 30);
    box(boox, 10, boox);
    fill(255, 255, 255);
    //float ratio = gameSize/boox*0.8;
    noStroke();
    for (PVector v : cylindres) {
      pushMatrix();
      translate(v.x, 0, v.y);
      rotateX(PI/2);
      shape(cylinder);
      popMatrix();
    }
    popMatrix();
    
    
    gravityForce.x = sin(rZ) * g;
    gravityForce.z = -sin(rX) * g;
    
    float normalForce = 1;
    float mu = 0.01;
    float frictionMagnitude = normalForce * mu;
    PVector friction = velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    velocity = velocity.add(friction);
    
    velocity = velocity.add(gravityForce);
    sphereuh = sphereuh.add(velocity);
    sphereuh.x = max(min(sphereuh.x, boox/2), -boox/2);
    sphereuh.z = max(min(sphereuh.z, boox/2), -boox/2);
    if (abs(sphereuh.x)==boox/2) velocity.x = -velocity.x*0.8;
    if (abs(sphereuh.z)==boox/2) velocity.z = -velocity.z*0.8;
    
    for(PVector v:cylindres){
      println(v.x, v.y, sphereuh.x, sphereuh.z);
      float d = sqrt(pow((sphereuh.x-v.x), 2) + pow((sphereuh.z-v.y), 2));
      if(d<cylinderBaseSize+radius){
        println(true);
        PVector n = (new PVector(v.x-sphereuh.x, v.y-sphereuh.z)).normalize();
        float sp = velocity.x*n.x+velocity.z*n.y;
        velocity = new PVector(velocity.x-2*sp*n.x, 0, velocity.z-2*sp*n.y);
      }
    }
    
    
    pushMatrix();
    rotate(rZ);
    rotateX(rX);
    translate(sphereuh.x, sphereuh.y-radius-5, sphereuh.z);
    noStroke();
    fill(200, 50, 0, 255);
    sphere(radius);
    popMatrix();
  } else {

    fill(30, 30, 30);
    rect(gameSize*0.1, gameSize*0.1, gameSize*0.8, gameSize*0.8);
    fill(255, 255, 255);
    
    for (PVector v : cylindres) {
      ellipse(v.x*ratio+gameSize*0.5, v.y*ratio+gameSize*0.5, 2*cylinderBaseSize*ratio, 2*cylinderBaseSize*ratio);
    }
  }
}

void mousePressed(MouseEvent event) {
  click = true;
  centreY = mouseY;
  centreX = mouseX;

  if (pause) {
    cylindres.add(new PVector((mouseX-gameSize*0.5)/ratio, (mouseY-gameSize*0.5)/ratio));
  }
}

void mouseReleased(MouseEvent event) {
  click = false;
  alpha1 = alpha;
  beta1 = beta;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  sM+=10*e;
  if (sM<150) {
    sM=150;
  } else if (sM>800) {
    sM=800;
  }
}

void keyPressed(KeyEvent event) {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      pause = true;
    }
  }
}

void keyReleased(KeyEvent event) {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      pause = false;
    }
  }
}
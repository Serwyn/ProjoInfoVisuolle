// Draws the Sphere
void drawSphere() {
  pushMatrix();
  rotate(rZ);
  rotateX(rX);
  translate(sphereuh.x, sphereuh.y-radius-5, sphereuh.z);
  noStroke();
  fill(200, 50, 0, 255);
  sphere(radius);
  popMatrix();
}

void drawSphereOn2DBoard(float x, float y, float size, PGraphics truc) {
  ratio = size/boox;
  //float d = sqrt(pow(sphereuh.x,2)+ pow(sphereuh.y,2)+  pow(sphereuh.z,2));
  float xs = sphereuh.x;
  float zs = sphereuh.z;
  truc.fill(200, 50, 0, 255);
  truc.ellipse(xs*ratio+x+size/2, zs*ratio+y+size/2, 2*radius*ratio, 2*radius*ratio);
}
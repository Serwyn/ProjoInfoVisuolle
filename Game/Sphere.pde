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
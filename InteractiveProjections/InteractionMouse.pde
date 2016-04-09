// l'echelle varie en fonction de la coordonne Y de la sourie 
void mousePressed() {
  MouseY = mouseY;
}

void mouseDragged() {
  float deltaY = (mouseY - MouseY);
  myScale = myScale + 0.005 * deltaY ;
  MouseY = mouseY;
}
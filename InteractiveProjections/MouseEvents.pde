float scaleFactor = 1f;
boolean locked = false;

void mouseDragged() {
  if (locked) {
    scaleFactor += 1;
  }
}

void mousePressed() {
  locked = true;
}

void mouseReleased() {
  locked = false;
}
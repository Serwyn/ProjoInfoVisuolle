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
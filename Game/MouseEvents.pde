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
  sensibilite+=10*e;
  if (sensibilite<150) {
    sensibilite=150;
  } else if (sensibilite>800) {
    sensibilite=800;
  }
}
void keyPressed() {
  if (keyPressed == true) {
    switch(keyCode){
    case UP : 
      rotationX += PI / 256;
      break; 
    case DOWN :  
      rotationX -=  PI/256;
      break; 
    case LEFT : 
      rotationY += PI/256; 
      break; 
    case RIGHT : 
      rotationY -= PI/256; 
      break; 
    }
  }
}
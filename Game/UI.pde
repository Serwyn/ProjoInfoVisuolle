void setupUI() {
  mySurface = createGraphics(gameSize, gameSize, P2D);
  myScore = createGraphics((int)(0.8*0.375*gameSize), (int)(0.8*0.15*gameSize), P2D);
  myChart = createGraphics((int)((1-0.045-0.8*0.375)*gameSize), (int)(0.8*0.15*gameSize), P2D);
  calibri = createFont("Disco Duck", 28);
}



void drawUI() {
  mySurface.beginDraw();
  mySurface.fill(230, 226, 175);
  mySurface.noStroke();
  mySurface.rect(0, 0.85*gameSize, gameSize, 0.15*gameSize );
  draw2DBoard(0.015*gameSize, 0.865*gameSize, 0.8*0.15*gameSize, mySurface);
  drawCylindersOn2DBoard(0.015*gameSize, 0.865*gameSize, 0.8*0.15*gameSize, mySurface);
  drawSphereOn2DBoard(0.015*gameSize, 0.865*gameSize, 0.8*0.15*gameSize, mySurface);
  mySurface.endDraw();
  image(mySurface, 0, 0);

  myScore.beginDraw();
  myScore.clear();
  myScore.fill(0, 0, 0);
  myScore.textFont(calibri);
  myScore.stroke(0, 0, 0);
  myScore.textSize(gameSize/40);
  myScore.text("Last score:  "+str((int)prev), 10, 30); 
  myScore.text("Actual score:  "+str((int)score), 10, 60);
  myScore.text("Velocity:  "+str((int)velocity.mag()), 10, 90);
  myScore.endDraw();
  image(myScore, 0.9*0.15*gameSize, 0.865*gameSize);


  myChart.beginDraw();
  myChart.fill(239, 236, 202);
  myChart.noStroke();
  float rectl = 1-0.8*0.375-0.99*0.15;
  myChart.rect(0, 0, (rectl)*gameSize, 0.8*0.15*gameSize);
  myChart.fill(255,0,0);
  if (allPrevs.size() != 0) {
    float max = java.util.Collections.max(allPrevs);
    int i = 0;
    while (i < allPrevs.size() && i < 50) {
      myChart.rect(
              i/50f*(rectl)*gameSize,
              (1-allPrevs.get(i)/max)*0.8*0.15*gameSize,
              1/50f*(rectl)*gameSize-1,
              allPrevs.get(i)/max*0.8*0.15*gameSize
              );
      i++;
    }
  }
  myChart.endDraw();
  image(myChart, (0.9*0.15+0.8*0.375)*gameSize, 0.865*gameSize);
}
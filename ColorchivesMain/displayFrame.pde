
//Display Scenes here
public void displayScene(PeasyCam cam, int ID, String system, Plotter plot, kMeans cluster){
  int[] viewport = cam.getViewport();
  int w = viewport[2];
  int h = viewport[3];
  int x = viewport[0];
  int y = viewport[1];
  int y_inv =  height - y - h; // inverted y-axis

  // scissors-test and viewport transformation
  setGLGraphicsViewport(x, y_inv, w, h);
  
  // modelview - using camera state
  cam.feed();

  // projection - using camera viewport
  float aspect = w/(float)h;
  aspect = 1;
  //println(aspect);
  perspective(60 * PI/180, aspect, 1, 5000);

  // clear background (scissors makes sure we only clear the region we own)
  background(bgColor);  
  noStroke();
  
  // scene objects  
  pushMatrix();
  translate(-100, 20, 0);
  plot.draw();
  if (NUM_CLUSTERS > 0){
  cluster.drawClusters();
  }
    popMatrix();

      
  // screen-aligned 2D HUD
  cam.beginHUD();
  rectMode(CORNER);
  fill(0);
  fill(255);
  textSize(15);
  text(system, 10, 15);
  
    if (NUM_CLUSTERS > 0){
  int palSize = 30;
  for(int i = 0; i<cluster.colors.length; i++){
    fill(cluster.colors[i]);
    stroke(255);
    rect(10, i*palSize + 25, palSize, palSize);
  }
    }
  fill(255);
  //ellipse(w - 40, h/2, 20, 20);
  //b.draw(w- b.r - 10, h/2);
  cam.endHUD();
}

//Display Scenes here -- without any quant
public void displayScene(PeasyCam cam, int ID, String system, Plotter plot){
  int[] viewport = cam.getViewport();
  int w = viewport[2];
  int h = viewport[3];
  int x = viewport[0];
  int y = viewport[1];
  int y_inv =  height - y - h; // inverted y-axis

  // scissors-test and viewport transformation
  setGLGraphicsViewport(x, y_inv, w, h);
  
  // modelview - using camera state
  cam.feed();

  // projection - using camera viewport
  float aspect = w/(float)h;
  aspect = 1.2;
  println(aspect);
  perspective(60 * PI/180, aspect, 1, 5000);

  // clear background (scissors makes sure we only clear the region we own)
  background(bgColor);  
  noStroke();
  
  // scene objects  
  pushMatrix();
  translate(-100, 20, 0);
  plot.draw();
  popMatrix();
      
  // screen-aligned 2D HUD
  //cam.beginHUD();
  //rectMode(CORNER);
  //fill(0);
  //fill(255);
  //textSize(15);
  //text(system, 10, 15);
  
  //int palSize = 30;

  //fill(255);
  ////ellipse(w - 40, h/2, 20, 20);
  ////b.draw(w- b.r - 10, h/2);
  //cam.endHUD();
}

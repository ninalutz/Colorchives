/*   
3D Plotting of various color spaces and palettes
Nina Lutz 2020 
for Ofrenda Digital and Colorchives project at MIT Media Lab
 */

import peasy.PeasyCam;
import processing.opengl.PGL;
import processing.opengl.PGraphics3D;
import processing.opengl.PJOGL;


//Multiple Camera Variables
final int NX = 3;
final int NY = 1;
PeasyCam[] cameras = new PeasyCam[NX * NY];
String[] modes = new String[NX*NY];
Plotter[] plots = new Plotter[NX*NY];
kMeans[] clusters = new kMeans[NX*NY];

//Single came
PeasyCam cam;
Plotter p, p1, p2; 

//Color variables 
kMeans k, k1, k2;
color bgColor = color(20);

public void settings(){
  size(1600, 800, P3D); // 3D
  smooth(8);
}

void setup ()
{

  
  processImage("test.jpg");
  modes[0] = "RGB";
  modes[1] = "HSV";
  modes[2] = "HSL";
  
  p = new Plotter(imageData, true, false, false); //rgb
  k = new kMeans(p);
  k.setupClusters();
  
  p1 = new Plotter(imageData, false, true, false); //hsv
  k1 = new kMeans(p1);
  k1.setupClusters();
  
  p2 = new Plotter(imageData, false, false, true); //hsl
  k2 = new kMeans(p2);
  k2.setupClusters();
  
  
  plots[0] = p;
  plots[1] = p1;
  plots[2] = p2;
  
  clusters[0] = k;
  clusters[1] = k1;
  clusters[2] = k2;
  
  initMultiView();
  
  background(bgColor);
}


void draw()
{
  drawMulitView();
}



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
  perspective(60 * PI/180, w/(float)h, 1, 5000);

  // clear background (scissors makes sure we only clear the region we own)
  background(bgColor);  
  noStroke();
  
  // scene objects  

  pushMatrix();
  translate(-100, 0, 0);
  image(pic, 0, 100);
  plot.draw();
  cluster.drawClusters();
  popMatrix();

  // screen-aligned 2D HUD
  cam.beginHUD();
  rectMode(CORNER);
  fill(0);
  fill(255);
  textSize(15);
  text(system, 10, 15);
  int palSize = 50;
  for(int i = 0; i<cluster.colors.length; i++){
    fill(cluster.colors[i]);
    noStroke();
    rect(i*palSize, 30, palSize, palSize);
  }
  cam.endHUD();
}

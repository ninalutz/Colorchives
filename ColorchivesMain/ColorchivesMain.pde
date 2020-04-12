/*   
3D Plotting of various color spaces and palettes
Nina Lutz 2020 
for Ofrenda Digital and Colorchives project at MIT Media Lab
*/

import peasy.PeasyCam;
import processing.opengl.PGL;
import processing.opengl.PGraphics3D;
import processing.opengl.PJOGL;

import java.util.Comparator;
import java.util.*;

//Multiple Camera Variables
final int NX = 3;
final int NY = 3;
PeasyCam[] cameras = new PeasyCam[NX * NY];
String[] modes = new String[NX*NY];
Plotter[] plots = new Plotter[NX*NY];
kMeans[] clusters = new kMeans[NX*NY];
int NUM_CLUSTERS = 8;


//Single came
PeasyCam cam;
Plotter p, p1, p2, p3, p4, p5, p6, p7, p8;

Blob b;

//Color variables 
kMeans k, k1, k2, k3, k4, k5, k6, k7, k8;
color bgColor = color(20);

public void settings(){
  size(1600, 900, P3D); // 3D
  //size(200, 200);
  smooth(8);
}

void setup (){
  processImage(imageLink);
  modes[0] = "RGB + K-means";
  modes[1] = "HSV + K-means";
  modes[2] = "HSL + K-means";
  modes[3] = "RGB + medianCut";
  modes[4] = "HSV + medianCut";
  modes[5] = "HSL + medianCut";
  modes[6] = "RGB + histogram";
  modes[7] = "HSV + histogram";
  modes[8] = "HSL + histogram";
  
  
  p = new Plotter(imageData, true, false, false); //rgb
  k = new kMeans(p);
  k.setupClusters();
  
  b = new Blob(k, 80);
  
  p1 = new Plotter(imageData, false, true, false); //hsv
  k1 = new kMeans(p1);
  k1.setupClusters();
  
  p2 = new Plotter(imageData, false, false, true); //hsl
  k2 = new kMeans(p2);
  k2.setupClusters();
  
  p3 = new Plotter(imageData, true, false, false); //rgb
  k3 = new kMeans(p3);
  k3.setupClusters();
  
  p4 = new Plotter(imageData, false, true, false); //hsv
  k4 = new kMeans(p4);
  k4.setupClusters();
  
  p5 = new Plotter(imageData, false, false, true); //hsl
  k5 = new kMeans(p5);
  k5.setupClusters();
  
  p6 = new Plotter(imageData, true, false, false); //rgb
  k6 = new kMeans(p6);
  k6.setupClusters();
  
  p7 = new Plotter(imageData, false, true, false); //hsv
  k7 = new kMeans(p7);
  k7.setupClusters();
  
  p8 = new Plotter(imageData, false, false, true); //hsl
  k8 = new kMeans(p8);
  k8.setupClusters();
  
  
  plots[0] = p;
  plots[1] = p1;
  plots[2] = p2;
  plots[3] = p3;
  plots[4] = p4;
  plots[5] = p5;
  plots[6] = p6;
  plots[7] = p7;
  plots[8] = p8;
  
  clusters[0] = k;
  clusters[1] = k1;
  clusters[2] = k2;
  clusters[3] = k3;
  clusters[4] = k4;
  clusters[5] = k5;
  clusters[6] = k6;
  clusters[7] = k7;
  clusters[8] = k8;
    
  
  initMultiView();
  
  background(bgColor);
}


void draw(){
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
  cluster.drawClusters();
  popMatrix();
      
  // screen-aligned 2D HUD
  cam.beginHUD();
  rectMode(CORNER);
  fill(0);
  fill(255);
  textSize(15);
  text(system, 10, 15);
  
  int palSize = 30;
  for(int i = 0; i<cluster.colors.length; i++){
    fill(cluster.colors[i]);
    stroke(255);
    rect(10, i*palSize + 25, palSize, palSize);
  }
  fill(255);
  ellipse(w - 40, h/2, 20, 20);
  b.draw(w- b.r - 10, h/2);
  cam.endHUD();
}

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
final int NX = 1;
final int NY = 1;
PeasyCam[] cameras = new PeasyCam[NX * NY];
String[] modes = new String[NX*NY];
Plotter[] plots = new Plotter[NX*NY];
kMeans[] clusters = new kMeans[NX*NY];
int NUM_CLUSTERS = 0;


//Single came
PeasyCam cam;
Plotter p, p1, p2;


//Color variables 
kMeans k, k1, k2;
color bgColor = color(20);

public void settings(){
  size(800, 800, P3D); // 3D
  //size(200, 200);
  smooth(8);
}

void setup (){
  processImage(imageLink);
  //modes[0] = "RGB + K-means";
  modes[0] = "HSV + K-means";
  //modes[0] = "HSL + K-means";
  //modes[3] = "RGB + medianCut";
  //modes[4] = "HSV + medianCut";
  //modes[5] = "HSL + medianCut";
  //modes[6] = "RGB + histogram";
  //modes[7] = "HSV + histogram";
  //modes[8] = "HSL + histogram";
  
  
  //p = new Plotter(imageData, true, false, false); //rgb
  ////k = new kMeans(p);
  ////k.setupClusters();

  p = new Plotter(imageData, false, true, false); //hsv
  //k1 = new kMeans(p1);
  //k1.setupClusters();

  
  //p2 = new Plotter(imageData, false, false, true); //hsl
  //k2 = new kMeans(p2);
  //k2.setupClusters();

  //p3 = new Plotter(imageData, true, false, false); //rgb
  
  //p4 = new Plotter(imageData, false, true, false); //hsv
  
  //p5 = new Plotter(imageData, false, false, true); //hsl
  
  //p6 = new Plotter(imageData, true, false, false); //rgb
  
  //p7 = new Plotter(imageData, false, true, false); //hsv
  
  //p8 = new Plotter(imageData, false, false, true); //hsl
  
  //plots[0] = p;
  plots[0] = p;
  //plots[2] = p2;
  //plots[3] = p3;
  //plots[4] = p4;
  //plots[5] = p5;
  //plots[6] = p6;
  //plots[7] = p7;
  //plots[8] = p8;
  
  //clusters[0] = k;
  //clusters[1] = k1;
  //clusters[2] = k2;
  ////clusters[3] = k3;
  //clusters[4] = k4;
  //clusters[5] = k5;
  //clusters[6] = k6;
  //clusters[7] = k7;
  //clusters[8] = k8;
    
  
  initMultiView();
  
  background(bgColor);
}


void draw(){
  drawMulitView();
}

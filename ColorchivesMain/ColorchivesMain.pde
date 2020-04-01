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

//Single came
PeasyCam cam;
Plotter p; 

//Color variables 
boolean hsv = true;
boolean hsl;
boolean rgb;
String mode = "";

public void settings(){
  size(1600, 800, P3D); // 3D
  smooth(8);
}

void setup ()
{
  initMultiView();
 //initSingleCam();
  //if(rgb) mode = "RGB";
  //if(hsl) mode = "HSL";
  //if(hsv) mode = "HSV";
  //processImage("test.jpg");
  //setupClusters();
  //p = new Plotter(imageData);
}


void draw()
{
  drawMulitView();
  //background(20);
  //image(pic, -300 - pic.width/2, -300);
  //fill(255);
  //textSize(20);
  //text(mode, -350, -350);
  //p.draw();
  //drawClusters();
  
}

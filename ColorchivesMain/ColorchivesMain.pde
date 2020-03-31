/*   
 float arrays var_x, var_y & var_z represent variables to be visualized
 arrays are filled with random values, limited to the dimensions of the axis
 make sure peasyCam libary is installed so you can move around in the plot.     
 */
import peasy.*;
PeasyCam cam;

Plotter p; 
boolean hsv = true;
boolean hsl;
boolean rgb;
String mode = "";
void setup ()
{
  size(800, 800, P3D);
  if(rgb) mode = "RGB";
  if(hsl) mode = "HSL";
  if(hsv) mode = "HSV";
  processImage("test.jpg");
  setupClusters();
  cam = new PeasyCam(this, 1000);
  cam.setFreeRotationMode();
  p = new Plotter(imageData);
}


void draw()
{
  background(20);
  image(pic, -300 - pic.width/2, -300);
  fill(255);
  textSize(20);
  text(mode, -350, -350);
  p.draw();
  drawClusters();
}

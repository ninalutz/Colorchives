/*   
 float arrays var_x, var_y & var_z represent variables to be visualized
 arrays are filled with random values, limited to the dimensions of the axis
 make sure peasyCam libary is installed so you can move around in the plot.     
 */
import peasy.*;
PeasyCam cam;

Plotter p; 

void setup ()
{
  size(800, 800, P3D);
  processImage("test2.jpeg");
  cam = new PeasyCam(this, 1000);
  cam.setFreeRotationMode();
  p = new Plotter(imageData);
}


void draw()
{
  background(128);
  fill(0);
  image(pic, -300, -300);
  text(frameRate, 30, 30);
  p.draw();

}

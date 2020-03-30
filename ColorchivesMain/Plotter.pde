class Plotter{
  ArrayList<PVector> data;
  float axis_length = 300;
  float x_axis, y_axis, z_axis;
  String x, y, z;
  int xrange, yrange, zrange;
  
  Plotter(){
    x_axis = axis_length;
    y_axis = -axis_length;
    z_axis = axis_length;
    xrange = 255;
    yrange = 255;
    zrange = 255;
    String x = "R";
    String y = "G";
    String z = "B";
    testData();
  }
  
  Plotter(ArrayList<PVector> _data){
    data = _data;
    x_axis = axis_length;
    y_axis = -axis_length;
    z_axis = axis_length;
    //defaults to RGB
    xrange = 255;
    yrange = 255;
    zrange = 255;
    String x = "R";
    String y = "G";
    String z = "B";
  }
  
  
  Plotter(ArrayList<PVector> _data, boolean hsv){
    data = _data;
    x_axis = axis_length;
    y_axis = -axis_length;
    z_axis = axis_length;
    String x = "R";
    String y = "G";
    String z = "B";
    
    if(hsv){  
    xrange = 360; //hue
    yrange = 100; //sat
    zrange = 100; //bright
    }
  }
  
  void draw(){
    for (int i = 0; i < data.size(); i++){   
      PVector d = data.get(i);
      PVector p = dataToAxis(d);
      colorMode(RGB);
      strokeWeight(4);
      stroke(d.x, d.y, d.z);
      point(p.x, p.y, p.z);
     }
    axis();
  }
  
  void drawHSV(){
    for (int i = 0; i < data.size(); i++){   
      PVector d = RGBtoHSB(data.get(i));
      PVector p = dataToAxis(d);
      strokeWeight(4);
      colorMode(HSB, 360, 100, 100);
      stroke(d.x, d.y, d.z);
      point(p.x, p.y, p.z);
     }
    axisHSB();
  }
 
  PVector dataToAxis(PVector point){
    PVector p;
    float x = map(point.x, 0, xrange, 0, x_axis);
    float y = map(point.y, 0, yrange, 0, y_axis);
    float z = map(point.z, 0, zrange, 0, z_axis);
    p = new PVector(x, y, z);
    return p;
  }

  PVector RGBtoHSB(PVector p){
    return rgb_to_hsv(p);
  }
  
  void axis(){
    strokeWeight(2);
    stroke(255, 0, 0);
    line(0, 0, 0, x_axis, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, y_axis, 0); 
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, z_axis);
  }
  
  void axisHSB(){
    strokeWeight(2);
    stroke(255, 0, 0);
    line(0, 0, 0, x_axis, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, y_axis, 0); 
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, z_axis);
  }
  
  //////TEST FUNCTIONS
   void testData(){
     data = new ArrayList<PVector>();
     for(int i = 0; i<20000; i++){
       PVector d = new PVector(random(255), random(255), random(255));
       data.add(d);
     }
   }
}

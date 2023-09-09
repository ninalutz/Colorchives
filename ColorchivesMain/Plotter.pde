class Plotter{
  ArrayList<PVector> data;
  float axis_length = 90;
  float x_axis, y_axis, z_axis;
  String x, y, z;
  int xrange, yrange, zrange;
  boolean rgb, hsv, hsl;
  
  int alpha = 100;
  int strokeW = 4;

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
    //testData();
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
    if(hsl || hsv){  
    xrange = 360; //hue
    yrange = 100; //sat
    zrange = 100; //bright
    }
  }
  
   Plotter(ArrayList<PVector> _data, boolean _rgb, boolean _hsv, boolean _hsl){
    data = _data;
   // testData();
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
    rgb = _rgb;
    hsv = _hsv;
    hsl = _hsl;
    if(hsl || hsv){  
    xrange = 360; //hue
    yrange = 100; //sat
    zrange = 100; //bright
    }
  }
  
  
  
  void draw(){
    if(hsv) drawHSV();
    if (hsl) drawHSL();
    if(rgb) drawRGB();
    axis();
  }
  
  
  void drawRGB(){
    for (int i = 0; i < data.size(); i++){   
      PVector d = data.get(i);
      PVector p = dataToAxis(d);
      strokeWeight(strokeW);
      stroke(d.x, d.y, d.z, alpha);
      point(p.x, p.y, p.z);
     }
  }
  
  void drawHSV(){
    for (int i = 0; i < data.size(); i++){   
      PVector d = data.get(i);
      PVector d2 = RGBtoHSV(d);
      PVector p = dataToAxis(d2);
      strokeWeight(strokeW);
      stroke(d.x, d.y, d.z, alpha);
      point(p.x, p.y, p.z);
     }
    axis();
  }
  
  void drawHSL(){
   for (int i = 0; i < data.size(); i++){  
      PVector d = data.get(i);
      PVector d2 = RGBtoHSL(d);
      PVector p = dataToAxis(d2);
      strokeWeight(strokeW);
      stroke(d.x, d.y, d.z, alpha);
      point(p.x, p.y, p.z);
     }
    axis();
  }
 
  PVector dataToAxis(PVector point){
    float x = map(point.x, 0, xrange, 0, x_axis);
    float y = map(point.y, 0, yrange, 0, y_axis);
    float z = map(point.z, 0, zrange, 0, z_axis);
    return  new PVector(x, y, z);
  }

  PVector RGBtoHSV(PVector p){
    return rgb_to_hsv(p);
  }
  
  PVector RGBtoHSL(PVector p){
    return rgb_to_hsl(p);
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
  
  //////TEST FUNCTIONS
   void testData(){
     data = new ArrayList<PVector>();
     for(int i = 0; i<20000; i++){
       PVector d = new PVector(random(255), random(255), random(255));
       data.add(d);
     }
   }
}


class Histogram{
    boolean adjusted = false;
    float x_axis, y_axis, z_axis;
    float xrange, yrange, zrange;
    float r,g,b;  // cluster color;
    Plotter p;
    boolean rgb, hsv, hsl;
    
    ArrayList<Cube> cubes = new ArrayList<Cube>();
    

    color[] colors = new color[NUM_CLUSTERS];
    int gridDim = 3;
    
  Histogram(Plotter _p){
      p = _p;
      rgb = p.rgb;
      hsv = p.hsv;
      hsl = p.hsl;
      x_axis = p.x_axis;
      y_axis = p.y_axis;
      z_axis = p.z_axis;
      xrange = p.xrange;
      yrange = p.yrange;
      zrange = p.zrange;
    }
   
  void initGrid(){
    float gridCellSizeX = x_axis/gridDim;
    float gridCellSizeY = y_axis/gridDim;
    float gridCellSizeZ = z_axis/gridDim;
    for(int i = 0; i<gridDim; i++){
      for(int j = 0; j<gridDim; j++){
            for(int k = 0; k<gridDim; k++){
               Cube c0 = new Cube(gridCellSizeX*i, gridCellSizeY*j, gridCellSizeZ*k, gridCellSizeX, gridCellSizeY, gridCellSizeZ);
               cubes.add(c0);
            }
      }
    }
  }
  
  //Get points from plotter and assign them to buckets
  void assignBuckets(){
    
  }
  
  
// STRUCTURES
  class Cube{
      float x, y, z; //upper left corner
      float size, xsize, ysize, zsize;
      Cube(){}
      color c;
      ArrayList<Point3D> points;
      
      Cube(float _x, float _y, float _z, float size){
        x = _x;
        y = _y;
        z = _z;
        this.size = size;
        xsize =  size;;
        ysize = size;
        zsize = size;
        c = color(random(255), random(255), random(255));
        points = new ArrayList<Point3D>();
      }
      
      Cube(float _x, float _y, float _z, float xsize, float ysize, float zsize){
        x = _x;
        y = _y;
        z = _z;
        this.xsize =  size;;
        this.ysize = size;
        this.zsize = size;
        c = color(random(255), random(255), random(255));
      }
      
      void draw(){
        pushMatrix();
        translate(x, y, z);
        fill(c, 10);
        stroke(c);
        box(xsize, ysize, zsize);
        popMatrix();
      }
      
      //tells if point is in a cube
      boolean inCube(PVector p){
       return x <= p.y  && p.x <= (x + xsize) && y <= p.y && p.y <= (y+ ysize)  && z <= p.z && p.z <= (z+ zsize);
      }
      
      //returns the average bucket color 
      PVector bucketColor(){
        float xTotal = 0;
        float yTotal = 0;
        float zTotal = 0;
        float xAvg = 0;
        float yAvg = 0;
        float zAvg = 0;
          for(Point3D p : points){
            xTotal += p.x;
            
          }
          if(xTotal != 0) xAvg = xTotal/points.size();
          if(yTotal != 0) yAvg = yTotal/points.size();
          if(zTotal != 0) zAvg = zTotal/points.size();
        return new PVector(xAvg, yAvg, zAvg);
      }
}


  class Point3D {
    public float x,y,z;
    int bucket;
    
    Point3D(float xx,float yy, float zz) {
      x=xx;
      y=yy;
      z = zz;
    }
  }
    



}

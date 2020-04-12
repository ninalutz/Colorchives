
class Histogram{
    boolean adjusted = false;
    float x_axis, y_axis, z_axis;
    float xrange, yrange, zrange;
    float r,g,b;  // cluster color;
    Plotter p;
    boolean rgb, hsv, hsl;
    

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
        //gridCellSizeX, gridCellSizeY, gridCellSizeZ
        //gridCellSizeX, gridCellSizeY*2, gridCellSizeZ
        //gridCellSizeX, gridCellSizeY*3, gridCellSizeZ
        //gridCellSizeX, gridCellSizeY, gridCellSizeZ
        //gridCellSizeX, gridCellSizeY*2, gridCellSizeZ*2
        //gridCellSizeX, gridCellSizeY*3, gridCellSizeZ*3
        //gridCellSizeX, gridCellSizeY, gridCellSizeZ
        //gridCellSizeX*2, gridCellSizeY*2, gridCellSizeZ*2
        //gridCellSizeX*3, gridCellSizeY*3, gridCellSizeZ*3
      }
    }
    //Once you have the grids,
    //The NUM_CLUSTERS most populated ones 
    //Take their average --> color 
  }
  
}

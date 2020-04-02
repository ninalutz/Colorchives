// k-means 
// CONSTANTS

class kMeans{
    final int NUM_CLUSTERS = 6;
    boolean adjusted = false;
    // GLOBALS
    Point3D [] points;
    Point3D [] clusters;
    float x_axis, y_axis, z_axis;
    float xrange, yrange, zrange;
    float r,g,b;  // cluster color;
    Plotter p;
    boolean rgb, hsv, hsl;
    
    color[] colors = new color[NUM_CLUSTERS];
      
    float clusterSize = 20;
    float pointSize = 1.5;
    
    kMeans(){}
    
    kMeans(Plotter _p){
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
    
    // METHODS
    void setupClusters(){
      points = new Point3D[imageData.size()];
      clusters = new Point3D[NUM_CLUSTERS];
      
      for(int i =0; i<imageData.size(); i++){
        if(hsv){
          PVector c = new PVector(imageData.get(i).x, imageData.get(i).y, imageData.get(i).z);
          PVector c2 =  rgb_to_hsv(c);
          points[i] = new Point3D(c2.x, c2.y, c2.z);
        }
        
        if(hsl){
          PVector c = new PVector(imageData.get(i).x, imageData.get(i).y, imageData.get(i).z);
          PVector c2 =  rgb_to_hsl(c);
          points[i] = new Point3D(c2.x, c2.y, c2.z);
        }
        
        if(rgb){
        points[i] = new Point3D(imageData.get(i).x, imageData.get(i).y, imageData.get(i).z);
        }
      }
    
      for(int j=0;j<clusters.length;++j) {
        clusters[j] = new Point3D(imageData.get(j).x, imageData.get(j).y, imageData.get(j).z);
      }
      assignClusters();
    
    }
    
    
    void drawClusters() {
      
      float prevCluster0 = clusters[0].x;
      if(!adjusted){
        assignClusters();
        adjustClusters();
      }
     
      // Draws the clusters
      strokeWeight(clusterSize);
      for(int j=0;j<clusters.length;++j) {
        colors[j] = clusterColor(j);
        stroke(colors[j]);
        PVector d = dataToAxis(new PVector(clusters[j].x, clusters[j].y, clusters[j].z));
        point(d.x, -d.y, d.z);
     }
     
     //Draws points
     strokeWeight(pointSize);
     for(int i=0;i<points.length;i++) {
        PVector d = dataToAxis(new PVector(points[i].x,points[i].y, points[i].z));
        PVector c = imageData.get(i);
        stroke(c.x, c.y, c.z, 100);
        point(d.x, -d.y, d.z);
     }
      if(clusters[0].x == prevCluster0){
        adjusted = true;
      }
    }
    
    public color clusterColor(int j){
      //
      color c = color(0, 0, 0);
      int clusterSize = 1; 
      float x = 0; float y = 0; float z = 0;//
      for(int i=0;i<points.length;++i) {
        if(points[i].cluster == j){
          x+= imageData.get(i).x;
          y+= imageData.get(i).y;
          z+= imageData.get(i).z;
          clusterSize += 1;
        }
      }
       return color(x/clusterSize, y/clusterSize, z/clusterSize);
     
    }
    
    float distance3(Point3D a,Point3D b) {
      float dx=a.x-b.x;
      float dy=a.y-b.y;
      float dz=a.z-b.z;
      return dx*dx+dy*dy+dz*dz; 
    }
    
    
    void assignClusters() {
      for(int i=0;i<points.length;++i) {
        double minLen = distance3(clusters[0],points[i]);
        int minIndex=0;
        for(int j=1;j<clusters.length;++j) {
          double len = distance3(clusters[j],points[i]);
          if(minLen > len) {
            minLen=len;
            minIndex=j;
          }
        }
        points[i].cluster=minIndex;
      }
    }
    
    void adjustClusters() {
      for(int j=0;j<clusters.length;++j) {
        float x=0,y=0, z=0;
        int sum=0;
        for(int i=0;i<points.length;++i) {
          if(points[i].cluster==j) {
            x+=points[i].x;
            y+=points[i].y;
            z+=points[i].z;
            sum++;
          }
        }
        if(sum<1) sum=1;
        clusters[j].x=x/sum;
        clusters[j].y=y/sum;
        clusters[j].z=z/sum;
      }
    }
    
    
      PVector dataToAxis(PVector point){
        float x = map(point.x, 0, xrange, 0, x_axis);
        float y = map(point.y, 0, yrange, 0, y_axis);
        float z = map(point.z, 0, zrange, 0, z_axis);
        return  new PVector(x, y, z);
      }
    
    
    // STRUCTURES
    class Point3D {
      public float x,y,z;
      int cluster;
      
      Point3D(float xx,float yy, float zz) {
        x=xx;
        y=yy;
        z = zz;
      }
      
    
    }
}

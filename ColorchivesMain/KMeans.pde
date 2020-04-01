// k-means 
// CONSTANTS

class kMeans{
final int NUM_CLUSTERS = 8;
boolean adjusted = false;
// GLOBALS
Point3D [] points;
Point3D [] clusters;
float r,g,b;  // cluster color;

kMeans(){}

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
 
  //// the clusters
  strokeWeight(20);
  for(int j=0;j<clusters.length;++j) {
    stroke(clusterColor(j));
    point(clusters[j].x,clusters[j].y, clusters[j].z);
 }
 
 //strokeWeight(1);
 //for(int i=0;i<points.length;i++) {
 //   stroke(points[i].x,points[i].y, points[i].z, 100);
 //   point(points[i].x,points[i].y, points[i].z);
 //}
  if(clusters[0].x == prevCluster0) adjusted = true;
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

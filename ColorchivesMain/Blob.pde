class Blob{
 color[] colors;
 float x, y;
 float w, h;
 float r;
 kMeans k;
  
  Blob(color[] colors, float _r){
    this.colors = colors;
    r = _r;
  }
  
  Blob(kMeans k, float _r){
    this.k = k;
    r = _r;
  }
  
  void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

  void draw(float _x, float _y){
    polygon(_x, _y, r, k.colors.length);
  }
}

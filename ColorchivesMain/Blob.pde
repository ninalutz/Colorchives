class Blob{
 color[] colors;
 float x, y;
 float w, h;
 float r;
  
  Blob(kMeans k, float _r){
    colors = k.colors;
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
    polygon(_x, _y, r, colors.length);
  }
}

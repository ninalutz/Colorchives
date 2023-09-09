void initMultiView(){
  //Multiview elements
  int gap = 5;
  
  // tiling size
  int tilex = floor((width  - gap) / NX);
  int tiley = floor((height - gap) / NY);
  
  // viewport offset ... corrected gap due to floor()
  int offx = (width  - (tilex * NX - gap)) / 2;
  int offy = (height - (tiley * NY - gap)) / 2;
  
  // viewport dimension
  int cw = tilex - gap;
  int ch = tiley - gap;
  // create new viewport for each camera
  for(int y = 0; y < NY; y++){
    for(int x = 0; x < NX; x++){
      int id = y * NX + x;
      int cx = offx + x * tilex;
      int cy = offy + y * tiley;
      cameras[id] = new PeasyCam(this, 310);
      cameras[id].setViewport(cx, cy, cw, ch); // this is the key of this whole demo
    }
  }

}

void drawMulitView(){
  // clear background once, for the whole window
  setGLGraphicsViewport(0, 0, width, height);

  // render scene once per camera/viewport
  for(int i = 0; i < 1; i++){
    pushStyle();
    pushMatrix();
    displayScene(cameras[i], i, modes[i], plots[i], clusters[i]);
    popMatrix();
    popStyle();
  }
  
  for(int i = 3; i < cameras.length; i++){
    pushStyle();
    pushMatrix();
    displayScene(cameras[i], i, modes[i], plots[i]);
    popMatrix();
    popStyle();
  }
  // setGLGraphicsViewport(0, 0, width, height);
}


// some OpenGL instructions to set our custom viewport
//   https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/glViewport.xhtml
//   https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/glScissor.xhtml
void setGLGraphicsViewport(int x, int y, int w, int h){
  PGraphics3D pg = (PGraphics3D) this.g;
  PJOGL pgl = (PJOGL) pg.beginPGL();  pg.endPGL();
  
  pgl.enable(PGL.SCISSOR_TEST);
  pgl.scissor (x,y,w,h);
  pgl.viewport(x,y,w,h);
}

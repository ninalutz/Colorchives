ArrayList<PVector> imageData;
PImage pic;
String imageLink = "test2.png";

void processImage(String imagePath){
  imageData = new ArrayList<PVector>();
  pic = loadImage(imagePath);
  image(pic, 0, 0);
  loadPixels();
  for(int i = 0; i<pic.width; i++){
    for(int j = 0; j<pic.height; j++){
    color c = get(i, j);
    imageData.add(new PVector(red(c), green(c), blue(c)));
  }
  }
}

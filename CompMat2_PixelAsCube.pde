PImage[] images;
int currentframe = 0;
int pixelHeight = 20;
int pixelWidth = 18;

void setup() {
  size (400,400);
  frameRate(5);
  
  loadPix();
}

void draw() {
  background(0, 0, 0);
  for (int currentRow = 0; currentRow < ((height)/pixelHeight*1.36); currentRow++) {
    int rowOffset = 0;
    if (currentRow % 2 == 1) {
      rowOffset = 9;
    }
    for (int currentCol = 0; currentCol < ((width)/pixelWidth*1.1); currentCol++) {
      image(images[currentframe], (currentCol*pixelWidth)-(pixelWidth/2)-rowOffset, (currentRow*(pixelHeight-5))-(pixelHeight/2));
    }
  }
  currentframe++;
  if(currentframe >= images.length) {
    currentframe = 0;
  }
}

void loadPix() {
  File picturesPath = sketchFile("pixel"); // Supposes you have a "pictures" folder in your sketch folder
  File[] files = picturesPath.listFiles(); // Get a list of files
  images = new PImage[files.length];
  int imageCount = 0;
  for (int i = 0; i < files.length; i++) {
    String fileName = files[i].getName().toLowerCase();
    if (fileName.endsWith(".png") ) {
      images[imageCount++] = loadImage(files[i].getAbsolutePath());
      //println(files[i].getAbsolutePath());
    }
  }
}

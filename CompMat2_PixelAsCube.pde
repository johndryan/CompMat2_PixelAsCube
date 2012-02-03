PImage[] images;
int currentframe = 0;
int pixelHeight = 20;
int pixelWidth = 18;
int numOfFiles = 0;

void setup() {
  size (800, 600);
  frameRate(15);
  loadPix();
}

void draw() {
  background(163, 120, 196);
  for (int currentRow = 0; currentRow < ((height)/pixelHeight*1.36); currentRow++) {
    int rowOffset = 0;
    if (currentRow % 2 == 1) {
      rowOffset = 9;
    }
    for (int currentCol = 0; currentCol < ((width)/pixelWidth*1.1); currentCol++) {
      int spriteFrame = currentframe + (currentCol % images.length) + (currentRow % images.length);
      if (spriteFrame >= images.length) spriteFrame = (spriteFrame % images.length);
      int xPos = (currentCol*pixelWidth)-(pixelWidth/2)-rowOffset;
      int yPos = (currentRow*(pixelHeight-5))-(pixelHeight/2);
      image(images[spriteFrame], xPos, yPos);
    }
  }
  currentframe++;
  if (currentframe >= images.length) {
    currentframe = 0;
  }
}

void loadPix() {
  File picturesPath = sketchFile("cube"); // Supposes you have a "pictures" folder in your sketch folder
  File[] files = picturesPath.listFiles(); // Get a list of files
  println(files.length);
  for (int i = 0; i < files.length; i++) {
    String fileName = files[i].getName().toLowerCase();
    if (fileName.endsWith(".png")) numOfFiles++;
  }
  println(numOfFiles);
  images = new PImage[numOfFiles];
  int imageCount = 0;
  for (int i = 0; i < files.length; i++) {
    String fileName = files[i].getName().toLowerCase();
    if (fileName.endsWith(".png") ) {
      images[imageCount++] = loadImage(files[i].getAbsolutePath());
      println(files[i].getAbsolutePath());
    }
  }
  println(images.length);
}


PImage[] images;
float[][] pixelsArray;

int pixelHeight = 20;
int pixelWidth = 18;

float increment = 0.01;
float zoff = 0.0;
float zincrement = 0.01; 

int numOfFiles = 0;
int currentframe = 0;
float numOfRows, numOfCols;

void setup() {
  size (800, 600);
  frameRate(30);
  
  numOfRows = (height/pixelHeight)*1.36;
  numOfCols = (width/pixelWidth)*1.1;
  
  loadPix();
}

void draw() {
  //background(163, 120, 196);
  background(0);
  noiseDetail(8,0.65f);
  float xoff = 0.0; // Start xoff at 0
  for (int currentRow = 0; currentRow < numOfRows; currentRow++) {
    int rowOffset = 0;
    if (currentRow % 2 == 1) {
      rowOffset = 9;
    }
    xoff += increment;
    float yoff = 0.0;
    for (int currentCol = 0; currentCol < numOfCols; currentCol++) {
      yoff += increment;
      // Calculate noise and scale by numOfFiles
      int spriteFrame = int(noise(xoff, yoff, zoff)*(numOfFiles-1));
      if (spriteFrame >= numOfFiles) spriteFrame = numOfFiles-1;
      int xPos = (currentCol*pixelWidth)-(pixelWidth/2)-rowOffset;
      int yPos = (currentRow*(pixelHeight-5))-(pixelHeight/2);
      image(images[spriteFrame], xPos, yPos);
      //println(currentRow + "," + currentCol + "  =  " + spriteFrame);
    }
  }
  zoff += zincrement;
}

void loadPix() {
  File picturesPath = sketchFile("cube"); // Supposes you have a "pictures" folder in your sketch folder
  File[] files = picturesPath.listFiles(); // Get a list of files
  //println(files.length);
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
      //println(files[i].getAbsolutePath());
    }
  }
  println(images.length);
}


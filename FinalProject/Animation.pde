class Animation {
  
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 1; i <= imageCount ; i++) {
      // Use nf() to number format 'i' into four digits
      
      String filename = imagePrefix + i + ".png";
      images[i-1] = loadImage(filename);
      images[i-1].resize(200,200);
    }
  }

  // display animation based on frame count
  void display(float xpos, float ypos) {
    if (frameCount % 10 == 0) { 
    frame = (frame+1) % (imageCount);
    }
    image(images[frame], xpos, ypos);
  }  
}
class Animation {
  
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 1; i <= imageCount ; i++) {
      // Use nf() to number format 'i' into four digits
      
      String filename = imagePrefix + nf (i, 2) + ".png";
      images[i-1] = loadImage(filename);
      images[i-1].resize(40,40);
    }
  }

  // display animation based on frame count
  void display(int xpos, int ypos) {
    if (frameCount % 10 == 0) { 
    frame = (frame+1) % (imageCount);
    }
    image(images[frame], xpos, ypos);
  }  
}
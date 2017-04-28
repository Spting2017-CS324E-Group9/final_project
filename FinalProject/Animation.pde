class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount ; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + str (i+1) + ".png";
      images[i] = loadImage(filename);
      images[i].resize(200,200);
    }
  }

  void display(float xpos, float ypos) {
   
    if (frameCount % 10 == 0) { 
    frame = (frame+1) % (imageCount);
    }
    image(images[frame], xpos, ypos);
  }  
}
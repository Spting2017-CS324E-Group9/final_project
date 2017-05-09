class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  PImage aux;
  Animation(String imagePrefix, int count, String s) {
    imageCount = count;
    images = new PImage[imageCount];
    if( s == "Farming"){aux = wheaty;}
    if(s == "Mining"){aux = ironbar;}
    if(s == "Logging"){aux = log;}
    if(s == "Guarding"){aux = arrow;}
    for (int i = 1; i <= imageCount ; i++) {
      // Use nf() to number format 'i' into four digits
      
      String filename = imagePrefix + i + ".png";
      images[i-1] = loadImage(filename);
      images[i-1].resize((1000/6-10)/2,(800/5-10)/2);
    }
  }

  void display(float xpos, float ypos) {
    
    if (frameCount % 10 == 0) { 
    frame = (frame+1) % (imageCount);
    }
    image(images[frame], xpos, ypos);
    image(aux,xpos+(1000/6-10)/4,ypos  + frame*5);
  }  
}
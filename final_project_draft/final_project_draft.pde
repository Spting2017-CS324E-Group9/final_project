
game g;


void setup () {
  size (1600, 800);

  
  g = new game ();
  g.clock.unpause ();
}

void draw () {
  background (2, 173, 60);
  g.display ();
}

void keyPressed () {
  if (key == 'q') {
    exit ();
  }
}

void mouseClicked () {
  if (mouseButton == LEFT) {
    
    for (int i = 0; i < g.com.num_w; i++) {
      if (g.com.w[i].area.inside (mouseX, mouseY)) {
        g.com.w[i].sel = true;
      }
      else {
        g.com.w[i].sel = false;      
      }
    }
    
    if (g.h_box.inside (mouseX, mouseY)) {
      g.place_house = true;
    }
    else {
      g.place_house = false;
    }
    
  }
  
  else if (mouseButton == RIGHT) {
    for (int i = 0; i < g.com.num_w; i++) {
      if (g.com.w[i].sel) {
        g.com.w[i].x = mouseX;
        g.com.w[i].y = mouseY;
      }
    }
    
    if (g.place_house) {
      g.com.add_house (mouseX, mouseY);
    }
  } 
  
}
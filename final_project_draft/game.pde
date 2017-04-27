class game {

  timer clock;
  community com;
  PFont f;
  box res_box, build_box, h_box;
  house build_h;
  boolean place_house;
  
  game () {
    clock = new timer (3600);
    f = loadFont ("Trebuchet-BoldItalic-48.vlw");
    com = new community ();
    res_box = new box (0, 0, width, int (0.04 * height), 0, 100, true);
    build_box = new box (int (width - (0.08 * width)), int (0.04 * height), width, height, 0, color (93, 77, 77), true);
    build_h = new house (int (width - (0.05 * width)), int (0.04 * height) + 40);
    h_box = new box (int (width - (0.05 * width)), int (0.04 * height) + 40, 40, 40, 0, 255, false);
    
    place_house = false;
  }
  
  void display () {
    res_box.display ();
    fill (0);
    textFont (f);
    textAlign (LEFT);
    textSize (int (0.03 * height));
    text ("pop: " + com.pop.current_pop, 10, int (0.03 * height));
    text ("food: " + int (com.food), 140, int (0.03 * height));
    text ("trees: " + int (com.stuff), 280, int (0.03 * height));
    text ("lil dudes: " + com.num_w + "/" + com.w.length, 440, int (0.03 * height));
    
    textAlign (RIGHT);
    text ("clock: " + clock.display, width - 10, int (0.03 * height));
    
    build_box.display ();
    fill (0);
    textAlign (CENTER);
    text ("house", int (width - (0.04 * width)), int (0.04 * height) + 25);
    build_h.display ();
    for (int i = 0; i < com.num_w; i++) {
      com.w[i].display ();
    }
    
    for (int i = 0; i < com.num_h; i++) {
      com.h[i].display ();
    }
  
    com.pop.update (clock.time, com.food);
    clock.update ();
    //com.food += 0.2;
    
    fill (0);
    textAlign (LEFT);
    //println ("select your worker by left clicking on them. if they are selected, you can move them by right clicking on the screen.");
    //println ("select the house in the build menu by left clicking on it. if it is selected, you can place a new house by right clicking on the screen.");
    //println ("to deselect a worker or build option, left click elsewhere on the screen.");
    //println ("press q to quit");
  }

}
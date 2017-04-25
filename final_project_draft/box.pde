class box {
  
  int h, w, top, side, opac;
  color fc;
  boolean str;
  box (int right_side_of_box, int top_of_box, int box_width, int box_height, int opacity, color fill_color, boolean has_stroke) {
    w = box_width;
    h = box_height;
    top = top_of_box;
    side = right_side_of_box;
    opac = opacity;
    fc = fill_color;
    str = has_stroke;
  }
  
  void display () {
    fill (fc);
    if (str) {
      stroke (0);
      strokeWeight (1);
    }
    else {
      noStroke ();
    }
    tint (fc, opac);
    rect (side, top, w, h);
    noTint ();
  }
  
  boolean inside (int x, int y) {
    if ((x > side) && (x < side + w) && (y > top) && (y < top + h)) {
      return true;
    }
    else {
      return false;
    }
  }
  

}
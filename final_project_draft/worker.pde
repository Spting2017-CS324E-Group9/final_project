class worker {
    
  String s;
  PShape look;
  int x, y;
  boolean sel;
  box area;
  worker () {
    sel = false;
    s = "idle";
    x = width / 2;
    y = height / 2;
    
    look = createShape (ELLIPSE, 0, 0, 20, 20);
    look.setStroke (0);
    look.setStrokeWeight (3);
    look.setFill (color (34, 68, 188));
    
    area = new box (x - 10, y - 10, 20, 20, 0, 255, false);
  }
  
  void display () {
    pushMatrix ();
    translate (x, y);
    shape (look);
    popMatrix ();
    area.side = x - 10;
    area.top = y - 10;
  }

}
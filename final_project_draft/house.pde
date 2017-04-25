class house {
  
  PShape look;
  house (int x, int y) {
    look = createShape (RECT, x, y, 40, 40);
    look.setStroke (0);
    look.setStrokeWeight (3);
    look.setFill (color (67, 43, 46));

  }
  
  void display () {
    shape (look);
  }

}
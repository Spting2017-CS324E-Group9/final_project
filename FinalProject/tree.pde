class tree extends feature {

  PShape look, trunk, branches;
  tree () {
    
    // create look for tree
    look = createShape (GROUP);
    // create trunk
    trunk = createShape (RECT, 4, 4, 4, 8);
    trunk.setFill (color (100, 61, 61));
    trunk.setStroke (false);
    look.addChild (trunk);
    // create branches
    branches = createShape (TRIANGLE, 6, 0, 12, 4, 0, 4);
    branches.setFill (color (61, 100, 65));
    branches.setStroke (false);
    look.addChild (branches);
  }
  
  void display (int x, int y) {
    pushMatrix ();
    translate (x, y);
    shape (this.look);
    popMatrix ();
  }
  
  void interact () {
  }

}
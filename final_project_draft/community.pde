class community {

  population pop;
  float food, stuff;
  worker[] w;
  int num_w, num_h;
  house[] h;

  
  community () {
    pop = new population ();
    food = 100;
    stuff = 1000;
    w = new worker[8];
    worker worker1 = new worker ();
    w[0] = worker1;
    num_w = 1;
    
    h = new house[8];
    house house1 = new house ((width / 2) - 50, (height / 2) - 50);
    h[0] = house1;
    num_h = 1;
  }
  
  void add_worker () {
    if (num_w <= w.length) {
      worker new_worker = new worker ();
      w[num_w] = new_worker;
    }
    else {
      println ("you already have the maximum number of workers");
    } 
  }
  
  void add_house (int x, int y) {
   
    if (num_h <= h.length) {
      if (stuff >= 400) {
        house new_house = new house (x, y);
        h[num_h] = new_house;
        num_h += 1;
        stuff -= 400;
      }
      else {
        println ("you do not have enough stuff to build another house");
      }
    }
    else {
      println ("you already have the maximum number of houses");
    } 
  }
  
  

}
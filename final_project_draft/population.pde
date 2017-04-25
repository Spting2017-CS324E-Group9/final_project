class population {

  float carry_cap, rgr, init_pop;
  int current_pop;

  
  population () {
    init_pop = 100;
    carry_cap = 10000;
    rgr = 0.0003;
    
    current_pop = int (carry_cap / (1 + ((carry_cap - init_pop) / init_pop) * exp (- rgr * 0)));
  }
  
  void update (int time, float resources) {
    rgr = 0.0003 + (resources / 10000000);
    this.current_pop = int (carry_cap / (1 + ((carry_cap - init_pop) / init_pop) * exp (- rgr * time)));
  }

}
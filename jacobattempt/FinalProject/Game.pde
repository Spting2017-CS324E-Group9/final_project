class Game {
  float food, wood, stone, defence, attack;
  float cfood, cwood, cstone;
  int day, x,y, charcount;
  Character[] population = new Character[255];
  Tile[][] tiles = new Tile[120][90];
  boolean pause;
  
  
  Game() {
   food = 10; 
   wood = 6; 
   stone = 5;
   defence = 0;
   day = 1;
   this.makeTiles();
   x = 0;
   y = 0;
   charcount = 4;
   for(int i=0; i<4; i++){Character j = new Character();population[i] = j;}
   pause = false;
  }
  void makeTiles(){
    for (int i = 0; i <120; i++){for(int j =0; j< 90; j++){
      float k = floor(random(3.99)) ;
      int r = int(k);
      tiles[i][j] = new Tile(r);
      if(i >= 61 && i <= 62 && j >= 45 && j <= 46){tiles[i][j].capture();}
      if(j == 45){if(i == 61 |i == 62){tiles[i][j].type = "Farm";}}
      if(j == 46 && i == 61){tiles[i][j].type = "Mill";}
      if(j == 46 && i == 62){tiles[i][j].type = "Quarry";}
    }
  } 
  }
  
  void display() {
    if (pause == false){
    image(scroll,-100,-20);
    for(int i = 0; i < 6; i ++) { for (int j = 0; j <4; j++) {
      tiles[i+59+x][j+44+y].display(0 + i*width/6, 800/5+ j*height/5);
      fill(244,66,161);
      int q = round(i+59+x);
      int w = round(j+44+y);
      text("("+q+","+w+")",0 + i*width/6, 800/5+ j*height/5+15);}}
    }
  }
  void charList(int a) {
    this.pause = true;
    image(smallscroll,760,140);
    fill(0);
    text(population[a].name,800,180);
    
  }
  void unpause(){this.pause = false;}
    
    
  }
  
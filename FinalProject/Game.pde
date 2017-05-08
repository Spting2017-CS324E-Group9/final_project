class Game {
  
  // current amount
  float food, wood, stone, defence, attack;
  // change values
  float cfood, cwood, cstone;
  int day, x,y, charcount;
  Character[] population = new Character[255];
  Character currentchar;
  Tile[][] tiles = new Tile[120][90];
  boolean pause;
  String[] stats = {"Defence","Farming","Building", "Milling","Smithing"};
  int control;
  PImage tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging, smallscroll, scroll, fail_scroll;
  String state;
  PImage start_image;

  Game() {
    
    int v = 1000/6-10;
    int w = 800/6-10;
    // initialize all images
    smallscroll = loadImage("smallscroll.png");
    smallscroll.resize(250, 200);
    scroll = loadImage("long_scroll.png");
    scroll.resize (width, 250);
    fail_scroll = loadImage ("another_scroll.png");
    fail_scroll.resize (width + 100, height + 100);
  
    snow = loadImage ("snow.jpg");
    snow.resize (v, w);
    iron = loadImage("iron.png");
    iron.resize(v, w);
    tower = loadImage("ruin.png");
    tower.resize(v, w);
    castle = loadImage("castle.png");
    castle.resize(v, w);
    farm = loadImage("farm.png");
    farm.resize(v, w);
    mountain = loadImage("mountain.png");
    mountain.resize(v, w);
    forest = loadImage("forest.png");
    forest.resize(v, w);
    tundra = loadImage("tundra.png");
    tundra.resize(v, w);
    wheat = loadImage("wheat.png");
    wheat.resize(v, w);
    logging = loadImage("logging.png");
    logging.resize(v, w);
    
    control = 4;
    food = 10; 
    wood = 6; 
    stone = 5;
    defence = 5;
    day = 1;
    cfood = 0;
    cwood = 0;
    cstone = 0;
    this.makeTiles();
    x = 0;
    y = 0;
    charcount = 4;
    for(int i=0; i<4; i++){Character j = new Character(tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging);population[i] = j;}
    pause = false;
    
    state = "init";
    start_image = loadImage("Medieval_villages_1920x1200.jpg");
    
  }
  
  // Creates the background tiles
  void makeTiles(){
    for (int i = 0; i <120; i++){
      for(int j =0; j< 90; j++){
        float k = floor(random(3.99)) ;
        int r = int(k);
        tiles[i][j] = new Tile(r,tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging);
        if(i >= 61 && i <= 62 && j >= 45 && j <= 46){tiles[i][j].capture();}
        if(j == 45){if(i == 61 |i == 62){tiles[i][j].type = "Farm";}}
        if(j == 46 && i == 61){tiles[i][j].type = "Mill";}
        if(j == 46 && i == 62){tiles[i][j].type = "Quarry";}
      }
    } 
  }
  
  // The main display function
  void display() {
    
    if (state == "init"){
      image(start_image,0,0,width,height);
      //textMode(CENTER);
      //textSize(50);
      text("Press 'S' to start. This is temporary.",300,180);
      
    }
    
    if ( (pause == false) && (state == "play") ){
      fill(0);
      
      // display tiles
      for(int i = 0; i < 6; i ++) { 
        for (int j = 0; j <6; j++) {
          tiles[i+59+x][j+44+y].display(0 + i*width/6, 0 + j*height/6);
        
          fill(244,66,161);
          int q = round(i+59+x);
          int w = round(j+44+y);
          text("("+q+","+w+")",0 + i*width/6, 0 + j*height/6+15);
        }
      }
      
      // display header scroll
      image(scroll, 0, -25);
      
      // display resources
      text("food: " + food +"("+cfood+")",75,50);
      text("wood: " + wood + "("+ cwood+")",75,75);
      text("stone: "+stone + "("+ cstone +")",75,100);
      text("Population: "+charcount,75, 125);
      text("defence: " +defence,175,50);
      text("day: " +day, 500,50);
      float j = pow(day,3/2) *.75;
      float k = pow(day,3/2) * 1.25;
      text("coming attack: " +j+ "-" +k,175,75);
    }
  }
  
  // displays the character list
  void charList(int a) {
    this.pause = true;
    image(smallscroll,760,140);
    fill(0);
    text(population[a].name,820,200);
    for(int i =0; i <5;i++){
        text(stats[i]+": "+ population[a].skills[i],820, 220 + i*20);
    }
    currentchar = population[a];
  }
  
  // Unpauses the game
  void unpause(){this.pause = false;}
  
  // Pauses the game
  void pause(){this.pause = true;}
  
  // not sure what this function does
  void calculate() {
    cfood =0; cwood = 0; cstone = 0; defence = 0;
    for(int i = 0; i< charcount; i++){
        Tile j = population[i].location;
        if(j.type == "Farm"){cfood += 1.5 +population[i].skills[1]/4;}
        if(j.type == "Mill"){cwood += 1 +population[i].skills[3]/4;}
        if(j.type == "Quarry"){cstone += 2 +population[i].skills[4]/2;}
        if(j.type == "Tower"){defence += 2 +population[i].skills[0];}
    }
    this.cfood -=charcount;
    this.cwood -=charcount/2;
    this.defence -= control/5;
  }
  
  // Makes end of day calculations
  void newDay() {
    // increments day
    this.day += 1;
    
    // calculates attack
    float j = pow(day,3/2);
    float k = random(.75,1.5);
    attack = j * k;
    
    // determine continue, if not, display lose screen
    if(attack > this.defence| food < 0 | wood < 0) {
      gm.pause = true; 
      image (fail_scroll, -45, -40);
      textSize (20);
      textAlign (CENTER);
      textFont (end);
      fill (0);
      text("Failure!", width / 2, 200);
    }
    
    // otherwise, reset day
    else {
      
      // resets character movement 
      for(int i = 0; i< charcount; i++){
        population[i].tired = false;
      }
      
      // calculate new resource values
      this.food += cfood;
      this.wood += cwood;
      this.cstone += 1/(defence -attack) * 5;
      this.stone += cstone;       
    } 
  }
  
}

  
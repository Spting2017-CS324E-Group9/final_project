class Game {
  float food, wood, stone, defence, attack;
  float cfood, cwood, cstone;
  int day, x,y, charcount;
  Character[] population = new Character[255];
  Character currentchar;
  Tile[][] tiles = new Tile[120][90];
  boolean pause,on;
  String[] stats = {"Defence","Farming","Building", "Milling","Smithing"};
  int control;
  String dayString;
  
  Game() {
  dayString = "";
    on = true;
   control = 4;
   food = 10; 
   wood = 6; 
   stone = 5;
   defence = 5;
   day = 1;
   cfood =0;
   cwood =0;
   cstone = 0;
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
    fill(0);
    
    for(int i = 0; i < 6; i ++) { for (int j = 0; j <4; j++) {
      tiles[i+59+x][j+44+y].display(0 + i*width/6, 800/5+ j*height/5);
      
      fill(244,66,161);
      int q = round(i+59+x);
      int w = round(j+44+y);
      text("("+q+","+w+")",0 + i*width/6, 800/5+ j*height/5+15);}}
    
    text(dayString,550,20,400,200);  
    text("food: " + food +"("+cfood+")",75,50);
    text("wood: " + wood + "("+ cwood+")",75,75);
    text("stone: "+stone + "("+ cstone +")",75,100);
    text("Population: "+charcount,75, 125);
    text("defence: " +defence,175,50);
    text("day: " +day, 500,50);
    float j = pow(day,(day+1)/day) *.75;
    float k = pow(day,(day+1)/day) * 1.25;
    text("coming attack: " +j+ "-" +k,175,75);
    }
  }
  
  void charList(int a) {
    this.currentchar = population[a];
    this.pause = true;
    int b = a+1;
    image(smallscroll,760,140);
    fill(0);
    text(population[a].name,820,200);
    text(population[a].Job,860,200);
    text(b + "/" +this.charcount,930,200); 
    for(int i =0; i <5;i++){
        text(stats[i]+": "+ population[a].skills[i],820, 220 + i*20);
    }
    
  }
  
  void unpause(){this.pause = false;}
  
  void calculate() {
    
    cfood =0; cwood = 0; cstone = 0; defence = 2+charcount;
    for(int i = 0; i< charcount-1; i++){
      if(population[i].location.type != "nothing"){
        Tile j = population[i].location;
        if(j.type == "Farm"){cfood += 1.5 +population[i].skills[1]/4;}
        if(j.type == "Mill"){cwood += 1 +population[i].skills[3]/4;}
        if(j.type == "Quarry"){cstone += 2 +population[i].skills[4]/2;}
        if(j.type == "Tower"){defence += 2 +population[i].skills[0];}
    }
    }
    this.cfood -=charcount;
    this.cwood -=charcount/2;
    this.defence -= control/5;
  }
  
  void newDay() {
    for(int i = 0; i< charcount; i++){population[i].tired = false;}
    this.day += 1;
    float j = pow(day,3/2);
    float k = random(.75,1.5);
    attack = j *k;
    if(attack > this.defence| food < 0 | wood < 0) {g.pause = true; fill(255);rect(0,0,width,height);fill(0);text("You have died",300,300);this.on=false;}
    this.food += cfood;
    this.wood += cwood;
    this.cstone += 1/(defence -attack) * 5;
    this.stone += cstone;
    this.dayString = " "; 
    
    
  }
  }
  
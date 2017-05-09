class Game {
  float food, wood, stone, defence, attack;
  float cfood, cwood, cstone;
  int day, x,y, charcount;
  Character[] population = new Character[255];
  Character currentchar;
  Tile[][] tiles = new Tile[120][90];
  boolean pause,on;
  String[] stats = {"Defence","Farming","Scouting", "Milling","Smithing"};
  int control;
  String dayString;
  PImage tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging, smallscroll, scroll, fail_scroll;
  String state, previous_state;
  PImage start_image, instructions_image, mute_button, exit_button, instructions_button, title_image;
  String controls = ("Keep your defence above the attack, if any of your resources hit 0 you lose. \n\nMove around the map with awsd. Press space to return to the center of your town. Use shift to see the people in your town and their skills. Cycle through them with left and right and assign them an appropriate task. Press '/' to close the character menu. While the character menu is open, click on a controlled tile to have that character begin work on that tile, and click on a neighboring tile to have your character capture that tile. Characters can only perform one action per day. Press enter to end the day and see how you fare against the forces of the night.\n\n\nGood Luck!");
  
  Game() {
   dayString = "";
   on = true;
   control = 4;
   food = 25; 
   wood = 15; 
   stone = 15;
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
   
    smallscroll = loadImage("smallscroll.png");
    smallscroll.resize(250, 200);
    scroll = loadImage("long_scroll.png");
    scroll.resize (width, 250);
    fail_scroll = loadImage ("another_scroll.png");
    fail_scroll.resize (width + 100, height + 100);
   
    state = "init";
    start_image = loadImage("Medieval_villages_1920x1200.jpg");
    mute_button = loadImage("mute.png");
    exit_button = loadImage("exit_button.png");
    instructions_button = loadImage("info_button.png");
    title_image = loadImage("cooltext243280598908684.png");
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
    
    if (state == "init"){
      image(start_image,0,0,width,height);
      fill(#D8D8D8);
      noStroke();
      rect( (width/4), 300, (width*2/4), 100);
      rect( (width/4), 410, (width*2/4), 100);
      rect( (width/4), 520, (width*2/4), 100);
      textAlign(CENTER,CENTER);
      fill(0);
      textSize(30);
      text("Start Game", (width/2), 350);
      text("Instructions", (width/2), 460);
      text("Quit", (width/2), 570);
      imageMode(CENTER);
      image(title_image,width/2,200);
      imageMode(CORNER);
      textSize(12);
      stroke(0);
      textAlign(LEFT);
      image(mute_button, 50,700);
    }
    
    if (state == "instructions"){
      image(scroll,0,0,width,height);
      rectMode(CORNERS);
      textAlign(CENTER);
      textSize(20);
      fill(0);
      //textFont(end);
      text(controls,100,200,900,700);
      rectMode(CORNER);
      fill(#D8D8D8);
      noStroke();
      rect( (width/4), 700, (width*2/4), 80);
      textAlign(CENTER,CENTER);
      fill(0);
      textSize(30);
      text("Done", (width/2), 740);
      textSize(12);
      stroke(0);
      textAlign(LEFT);
    }
    
    if (pause == false && (state == "play")){
    //image(scroll,-100,-20);
    image(scroll,0,-25);
    fill(0);
    
    for(int i = 0; i < 6; i ++) { for (int j = 0; j <4; j++) {
      tiles[i+59+x][j+44+y].display(0 + i*width/6, 800/5+ j*height/5);
      
      fill(244,66,161);
      int q = round(i+59+x);
      int w = round(j+44+y);
      text("("+q+","+w+")",0 + i*width/6, 800/5+ j*height/5+15);}}
    
      //UI buttons
      mute_button.resize(45,45);
      image(mute_button,880,20);
      instructions_button.resize(45,45);
      image(instructions_button,880,64);
      exit_button.resize(70,50);
      image(exit_button,870,110);
      
    text(dayString,550,20,400,200);  
    text("food: " + food +"("+cfood+")",75,50);
    text("wood: " + wood + "("+ cwood+")",75,75);
    text("stone: "+stone + "("+ cstone +")",75,100);
    text("Population: "+charcount,75, 125);
    text("   defence: " +defence,175,50);
    text("day: " +day, 500,50);
    float j = pow(day,(day+1)/day) *.75;
    float k = pow(day,(day+1)/day) * 1.25;
    text("   coming attack: " +j+ "-" +k,175,75);
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
    if(population[a].tired == true){text("Tired",930,220);}
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
    //gm.pause = true; 
    image (fail_scroll, -45, -40);
    textSize (20);
    textAlign (CENTER);
    fill (0);
    text("End of Day", width / 2, 200);
    if(attack > this.defence| food < 0 | wood < 0 | stone <0) {this.kill();}
    else {
     state = "end_day";
     textSize (20);
     textAlign (CENTER);
     fill (0);
     text("You Survived! Congratulations \n Click to continue", width / 2, 270);
    }
    
    this.food += cfood;
    this.wood += cwood;
    this.stone -= (1-(defence - attack)/defence)*5;
    this.stone += cstone;
    this.dayString = " ";
    textSize(12);
    textAlign(LEFT);
    
    
  }
  void kill(){
    this.state = "kill";
    fill(255);
    rect(0,0,width,height);
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("YOU DIED",width/2,height/2);
      fill(#D8D8D8);
      noStroke();
      rect( (width/4), 700, (width*2/4), 80);
      textAlign(CENTER,CENTER);
      fill(0);
      textSize(30);
      text("EXIT", (width/2), 740);
      textSize(12);
      stroke(0);
      textAlign(LEFT);
  }
  }
  

PImage tower,arrow, log, farm, mountain, forest, tundra, wheat,logging,castle,iron, scroll, smallscroll,ironbar,wheaty;

Animation m,b,c,d;
import ddf.minim.*;

// sound variables
Minim minim;
AudioPlayer song, button_click, button_click2, button_click3, button_click4, button_click5, scroll_sound;


// game variables
Game gm;
int ind;
PFont end;

boolean muted = false;
void setup() {
  size(1000,800);

  //set sound
  minim = new Minim(this);
  song = minim.loadFile("Thatched_Villagers.mp3");
  song.loop();
  scroll_sound = minim.loadFile("page-flip-01a.mp3");
  button_click = minim.loadFile("button_click.wav");
  button_click2 = minim.loadFile("button-15.mp3");
  button_click3 = minim.loadFile("button-17.mp3");
  button_click4 = minim.loadFile("button-21.mp3");
  button_click5 = minim.loadFile("button-16.mp3");
  

  
  //file = new SoundFile(this, "Thatched_Villagers.mp3");
  //file.play();
  gm= new Game();
  gm.calculate();
  fill(20,250,47);
  
  int x = 1000/6-10;
  int y = 800/5-10;
  smallscroll = loadImage("smallscroll.png");
  smallscroll.resize(250,200);
  scroll = loadImage("scroll.png");
  scroll.resize(1200,800/5 +30);
  iron = loadImage("iron.png");
  iron.resize(x,y);
  log = loadImage("log.png");
  log.resize(30,30);
  ironbar = loadImage("iron_ore.png");
  ironbar.resize(30,30);
  wheaty = loadImage("wheaty.png");
  wheaty.resize(30,30);
  arrow = loadImage("arrow.png");
  arrow.resize(30,30);
  tower = loadImage("ruin.png");
  tower.resize(x,y);
  castle = loadImage("castle.png");
  castle.resize(x,y);
  farm = loadImage("farm.png");
  farm.resize(x,y);
  mountain = loadImage("mountain.png");
  mountain.resize(x,y);
  forest = loadImage("forest.png");
  forest.resize(x,y);
  tundra = loadImage("tundra.png");
  tundra.resize(x,y);
  wheat = loadImage("wheat.png");
  wheat.resize(x,y);
  logging = loadImage("logging.png");
  logging.resize(x,y);
  log = loadImage("log.png");
  log.resize(30,30);
  m = new Animation("chop",8,"Farming");
  b = new Animation("chop",8,"Logging");
  c = new Animation("chop",8,"Mining");
  d = new Animation("chop",8,"Guarding");
}
void draw() {
 if(frameCount % 60 == 0){gm.display();}
 if(gm.pause == true){gm.charList(ind);}
 
 if(gm.state != "end_day"){
  for (int i =0; i <gm.charcount-1; i++){
        Animation a = m;
        if(gm.population[i].Job == "Farming"){a =m;}
        if(gm.population[i].Job == "Logging"){a =b;}
        if(gm.population[i].Job == "Mining"){a =c;}
        if(gm.population[i].Job == "Guarding"){a =d;}
        if(gm.population[i].xtile >= 59+gm.x && gm.population[i].xtile <= 64+gm.x && gm.population[i].ytile >= 44+gm.y && gm.population[i].ytile <= 47+gm.y){
          if(gm.population[i].location.pop == 1){
             a.display((gm.population[i].xtile - (59 + gm.x)) * (1000/6),(gm.population[i].ytile - (44 +gm.y))*800/5 + 800/5 +80);
          }
          if(gm.population[i].location.pop == 2){
             a.display((gm.population[i].xtile - (59 + gm.x)) * (1000/6),(gm.population[i].ytile - (44 +gm.y))*800/5 + 800/5 +80);
             a.display((gm.population[i].xtile - (59 + gm.x)) * (1000/6) +1000/12,(gm.population[i].ytile - (44 +gm.y))*800/5 + 800/5 +80);
          }  
        }
        }
     }
    } 


void keyPressed(){
 if ( key == 'w' && gm.y >= -43 && gm.state == "play") {gm.y -=1;}
 if ( key == 'a' && gm.x >= -57 && gm.state == "play") {gm.x -=1;}
 if ( key == 's' && gm.y <=41 && gm.state == "play") {gm.y +=1;}
 if ( key == 'd' && gm.x<=54 && gm.state == "play") {gm.x +=1;}
 if ( key == ' ' && gm.state == "play") {button_click3.play(0);gm.y = 0; gm.x =0;}
 if ( keyCode == SHIFT && gm.state == "play") {scroll_sound.play(0); ind =0;gm.charList(ind); gm.calculate();}
 if (gm.pause == true && keyCode == LEFT && ind < gm.charcount-1 && gm.state == "play"){button_click4.play(0);ind +=1;gm.charList(ind);}
 if (gm.pause == true && keyCode == RIGHT && ind > 0 && gm.state == "play"){button_click4.play(0);ind -=1;gm.charList(ind);}
 if (key == '/' && gm.state == "play"){button_click2.play(0);gm.unpause();gm.calculate();} 
 if (keyCode == ENTER && gm.state == "play"){gm.newDay();}
 }
  
void mouseClicked() {
  //print(mouseX, mouseY,"                            ");
  if(gm.on == true && gm.pause == true && gm.currentchar.tired == false && gm.state == "play"){
    for(int i = 0; i < 6; i++){
      if(mouseX > i*1000/6 && mouseX <(i+1)*1000/6){button_click3.play(0);gm.currentchar.xloc = i;}
      }
    for(int j = 0; j <4; j++) {
      if(mouseY > 800/5 + (j)*800/5 && mouseY <((j+1)*800/5 + 800/5)){button_click3.play(0);gm.currentchar.yloc = j;}}
      Tile r = gm.tiles[59+gm.currentchar.xloc][gm.currentchar.yloc];
      print(gm.currentchar.xloc,gm.currentchar.yloc,r.type,r.activity,"\n");
  gm.currentchar.locate();
  }
  if (gm.state == "play" && gm.pause == false){
    if( ( (mouseX <= 925) && (mouseX>= 880) ) && ( (mouseY <= 65) && (mouseY>= 20) ) ){
      button_click.play(0);
      if(muted){
        song.play();
        muted = false;
      }
      else{
        song.pause();
        muted = true;
      }
    }
    if( ( (mouseX <= 925) && (mouseX>= 880) ) && ( (mouseY <= 109) && (mouseY>= 64) ) ){
      button_click.play(0);
      gm.state = "instructions";
    }
    if( ( (mouseX <= 925) && (mouseX>= 880) ) && ( (mouseY <= 155) && (mouseY>= 110) ) ){
      button_click.play(0);
      exit();
    }
  }
  
  if (gm.state == "init"){
    
    if( ( (mouseX <= ((width/4)+(width*2/4))) && (mouseX>= (width/4)) ) && ( (mouseY <= 400) && (mouseY>= 300) ) ){
      fill(#767676);
      rect( (width/4), 300, (width*2/4), 100);
      button_click.play(0);
      gm.state = "play";
      gm.previous_state = "play";
    }
    if( ( (mouseX <= ((width/4)+(width*2/4))) && (mouseX>= (width/4)) ) && ( (mouseY <= 510) && (mouseY>= 410) ) ){
      fill(#767676);
      rect( (width/4), 410, (width*2/4), 100);
      button_click.play(0);
      gm.state = "instructions";
      gm.previous_state = "init";
    }
    if( ( (mouseX <= ((width/4)+(width*2/4))) && (mouseX>= (width/4)) ) && ( (mouseY <= 620) && (mouseY>= 520) ) ){
      fill(#767676);
      rect( (width/4), 520, (width*2/4), 100);
      button_click.play(0);
      exit();
    }
    
    //rect(50,700,62,62);
    if( ( (mouseX <= 112 ) && (mouseX>= 50 ) ) && ( (mouseY <= 762) && (mouseY>= 700) ) ){
      fill(#767676);
      button_click.play(0);
      if(muted){
        song.play();
        muted = false;
      }
      else{
        song.pause();
        muted = true;
      }
    }   
    
  }
  
  if (gm.state == "instructions"){
    
    if( ( (mouseX <= ((width/4)+(width*2/4))) && (mouseX>= (width/4)) ) && ( (mouseY <= 780) && (mouseY>= 700) ) ){
      fill(#767676);      
      rect( (width/4), 700, (width*2/4), 80);
      button_click.play(0);
      if(gm.previous_state == "init"){gm.state = "init";}
      else if(gm.previous_state == "play"){gm.state = "play";}
    }    
    
  }  

  if (gm.state == "kill"){
    
    if( ( (mouseX <= ((width/4)+(width*2/4))) && (mouseX>= (width/4)) ) && ( (mouseY <= 780) && (mouseY>= 700) ) ){
      fill(#767676);      
      rect( (width/4), 700, (width*2/4), 80);
      button_click.play(0);
      exit();
    }    
    
  }
  if (gm.state == "end_day"){
    gm.pause = false;
    gm.state = "play";
  }
}
      
  
  



  
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
  // set size
  size(1000, 800);

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
  
  fill(20, 250, 47);
 
  // initialize fonts
  end = loadFont ("TempusSansITC-48.vlw");

  // initialize game
  gm = new Game();
  gm.calculate();
}
void draw() {
  gm.display();
}

void keyPressed() {
  
  
  // screen scroll
  if ( key == 'w' && gm.y >= -43 && gm.state == "play") {
    //button_click.play(0);
    gm.y -=1;
  }
  if ( key == 'a' && gm.x >= -57 && gm.state == "play") {
    //button_click.play(0);
    gm.x -=1;
  }
  if ( key == 's' && gm.y <=41 && gm.state == "play") {
    //button_click.play(0);
    gm.y +=1;
  }
  if ( key == 'd' && gm.x<=54 && gm.state == "play") {
    //button_click.play(0);
    gm.x +=1;
  }
  if ( key == ' ' && gm.state == "play") {
    button_click3.play(0);
    gm.y = 0; 
    gm.x =0;
  }

  // toggle character list
  if ( keyCode == SHIFT && gm.state == "play") { 
    scroll_sound.play(0);
    ind =0;
    gm.charList(ind); 
    gm.calculate();
  }
  if (gm.pause == true && keyCode == LEFT && ind < gm.charcount-1 && gm.state == "play") {
    button_click4.play(0);
    ind +=1;
    gm.charList(ind);
  }
  if (gm.pause == true && keyCode == RIGHT && ind > 0 && gm.state == "play") {
    button_click4.play(0);
    ind -=1;
    gm.charList(ind);
  }
  if (key == '/' && gm.state == "play") {
    button_click2.play(0);
    gm.unpause();
    gm.calculate();
  }

  // end day
  if (keyCode == ENTER && gm.state == "play") {
    gm.newDay();
  }
}

void mouseClicked() {

  // assign tile to character
  if (gm.pause == true && gm.currentchar.tired == false && gm.state == "play") {
    for (int i = 0; i < 6; i++) {
      if (mouseX > i*1000/6 && mouseX <(i+1)*1000/6) {
        button_click3.play(0);
        gm.currentchar.x = i;
      }
    }
    for (int j = 0; j <4; j++) {
      if (mouseY > 800/5 + (j)*800/5 && mouseX <(j+1)*800/5 + 800/5) {
        button_click3.play(0);
        gm.currentchar.y = j;
      }
    }
    print(gm.currentchar.x, gm.currentchar.y, "\n");
    print(mouseX, mouseY);
    gm.currentchar.locate();
    
  }
  
  if (gm.state == "play" && gm.pause == false){
      //rect(880,20,45,45);
      //rect(880,64,45,45);
      //rect(870,110,70,50);
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
      gm.state = "init";
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
}
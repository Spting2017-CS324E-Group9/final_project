import ddf.minim.*;

// sound variables
Minim minim;
AudioPlayer song, button_click, button_click2, button_click3, button_click4, scroll_sound;


// game variables
Game g;
int ind;
Animation chop;
PFont end;

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
  




  fill(20, 250, 47);
  

  // initialize fonts
  end = loadFont ("TempusSansITC-48.vlw");

  
  
    // initialize game
  g = new Game();
  g.calculate();

  chop = new Animation("chop", 8);
}
void draw() {
  g.display();
}

void keyPressed() {
  
  if ( g.state == "init" && key == 's' ){
    button_click.play(0);
    g.state = "play";
  }
  
  
  // screen scroll
  if ( key == 'w' && g.y >= -43 && g.state == "play") {
    g.y -=1;
  }
  if ( key == 'a' && g.x >= -57 && g.state == "play") {
    g.x -=1;
  }
  if ( key == 's' && g.y <=41 && g.state == "play") {
    g.y +=1;
  }
  if ( key == 'd' && g.x<=54 && g.state == "play") {
    g.x +=1;
  }
  if ( key == ' ' && g.state == "play") {
    g.y = 0; 
    g.x =0;
  }

  // toggle character list
  if ( keyCode == SHIFT && g.state == "play") { 
    scroll_sound.play(0);
    ind =0;
    g.charList(ind); 
    g.calculate();
  }
  if (g.pause == true && keyCode == LEFT && ind < g.charcount-1 && g.state == "play") {
    button_click4.play(0);
    ind +=1;
    g.charList(ind);
  }
  if (g.pause == true && keyCode == RIGHT && ind > 0 && g.state == "play") {
    button_click4.play(0);
    ind -=1;
    g.charList(ind);
  }
  if (key == '/' && g.state == "play") {
    button_click2.play(0);
    g.unpause();
    g.calculate();
  }

  // end day
  if (keyCode == ENTER && g.state == "play") {
    g.newDay();
  }
}

void mouseClicked() {

  // assign tile to character
  if (g.pause == true && g.currentchar.tired == false && g.state == "play") {
    for (int i = 0; i < 6; i++) {
      if (mouseX > i*1000/6 && mouseX <(i+1)*1000/6) {
        g.currentchar.xloc = i;
      }
    }
    for (int j = 0; j <4; j++) {
      if (mouseY > 800/5 + (j)*800/5 && mouseX <(j+1)*800/5 + 800/5) {
        g.currentchar.yloc = j;
      }
    }
    print(g.currentchar.xloc, g.currentchar.yloc, "\n");
    print(mouseX, mouseY);
    g.currentchar.locate();
  }
}
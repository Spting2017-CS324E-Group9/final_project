import ddf.minim.*;

// sound variables
//Minim minim;
//AudioPlayer song;

// game variables
Game g;
PImage tower, farm, mountain, forest, tundra, wheat, logging, castle, iron, scroll, fail_scroll, smallscroll, snow;
int ind;
Animation chop;
PFont end;

void setup() {
  // set size
  size(1000, 800);

  // set sound
  //minim = new Minim(this);
  //song = minim.loadFile("Thatched_Villagers.mp3");
  //song.play();

  // initialize game
  g = new Game();
  g.calculate();


  fill(20, 250, 47);
  int x = 1000/6-10;
  int y = 800/5-10;

  // initialize fonts
  end = loadFont ("TempusSansITC-48.vlw");

  // initialize all images
  smallscroll = loadImage("smallscroll.png");
  smallscroll.resize(250, 200);
  scroll = loadImage("long_scroll.png");
  //scroll.resize(1200,800/5 +30);
  scroll.resize (width, 250);
  fail_scroll = loadImage ("another_scroll.png");
  fail_scroll.resize (width + 100, height + 100);

  snow = loadImage ("snow.jpg");
  snow.resize (x, y);
  iron = loadImage("iron.png");
  iron.resize(x, y);
  tower = loadImage("ruin.png");
  tower.resize(x, y);
  castle = loadImage("castle.png");
  castle.resize(x, y);
  farm = loadImage("farm.png");
  farm.resize(x, y);
  mountain = loadImage("mountain.png");
  mountain.resize(x, y);
  forest = loadImage("forest.png");
  forest.resize(x, y);
  tundra = loadImage("tundra.png");
  tundra.resize(x, y);
  wheat = loadImage("wheat.png");
  wheat.resize(x, y);
  logging = loadImage("logging.png");
  logging.resize(x, y);

  chop = new Animation("chop", 8);
}
void draw() {
  g.display();
}

void keyPressed() {

  // screen scroll
  if ( key == 'w' && g.y >= -43) {
    g.y -=1;
  }
  if ( key == 'a' && g.x >= -57) {
    g.x -=1;
  }
  if ( key == 's' && g.y <=41) {
    g.y +=1;
  }
  if ( key == 'd' && g.x<=54) {
    g.x +=1;
  }
  if ( key == ' ') {
    g.y = 0; 
    g.x =0;
  }

  // toggle character list
  if ( keyCode == SHIFT) { 
    ind =0;
    g.charList(ind); 
    g.calculate();
  }
  if (g.pause == true && keyCode == LEFT && ind < g.charcount-1) {
    ind +=1;
    g.charList(ind);
  }
  if (g.pause == true && keyCode == RIGHT && ind > 0) {
    ind -=1;
    g.charList(ind);
  }
  if (key == '/') {
    g.unpause();
    g.calculate();
  }

  // end day
  if (keyCode == ENTER) {
    g.newDay();
  }
}

void mouseClicked() {

  // assign tile to character
  if (g.pause == true && g.currentchar.tired == false) {
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
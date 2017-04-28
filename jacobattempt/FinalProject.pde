Game g;
PImage tower, farm, mountain, forest, tundra, wheat,logging,castle,iron, scroll, smallscroll;
int ind;

void setup() {
  size(1000,800);
  g = new Game();
  fill(20,250,47);
  int x = 1000/6-10;
  int y = 800/5-10;
  smallscroll = loadImage("smallscroll.png");
  smallscroll.resize(250,200);
  scroll = loadImage("scroll.png");
  scroll.resize(1200,800/5 +30);
  iron = loadImage("iron.png");
  iron.resize(x,y);
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
}
void draw() {
 g.display(); 
  
}

void keyPressed(){
 if ( key == 'w' && g.y >= -43) {g.y -=1;}
 if ( key == 'a' && g.x >= -57) {g.x -=1;}
 if ( key == 's' && g.y <=41) {g.y +=1;}
 if ( key == 'd' && g.x<=54) {g.x +=1;}
 if ( key == ' ') {g.y = 0; g.x =0;}
 if ( keyCode == SHIFT) { ind =0;g.charList(ind);}
 if (g.pause == true && keyCode == DOWN && ind < g.charcount-1){ind +=1;g.charList(ind);}
 if (g.pause == true && keyCode == UP && ind > 1){ind -=1;g.charList(ind);}
 if (key == '/'){g.unpause();}
   
 }
  
  
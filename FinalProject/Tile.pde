class Tile{
  
 String type;
 PImage building;
 boolean captured;
 int pop;
 PImage tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging;
 feature[] features;
 int x, y;
 
 // takes type of tile as int
 Tile(int i, int xloc, int yloc, PImage _tower, PImage _tundra, PImage _forest, PImage _mountain, PImage _snow,PImage _castle,PImage _iron, PImage _farm, PImage _wheat, PImage _logging){
   x = xloc;
   y = yloc;
   this.tower = _tower;
   this.tundra = _tundra;
   this.forest = _forest;
   this.mountain = _mountain;
   this.snow = _snow;
   this.castle = _castle;
   this.iron = _iron;
   this.farm = _farm;
   this.wheat = _wheat;
   this.logging = _logging;
   
   this.building = tower;
   this.pop = 0;
   if (i == 0) {this.type = "Farm";}
   if (i == 1) {this.type = "Mill";}
   if (i == 2) {this.type = "Quarry";}
   if (i == 3) {this.type = "Tower";}
   if (i == 5) {this.type = "nothing";}
   
   // set image based on type
   if(this.type == "Tower"){
     this.building = snow;
   }
   else if(this.type == "Farm"){
     this.building = snow;
   }
   else if(this.type == "Mill"){
     this.building = snow;
     features = new feature[30];
     for (int k = 0; k < 30; k++) {
       tree t = new tree ();
       features[k] = t;
     }
   }
   else if(this.type == "Quarry"){
     this.building = snow;
   }
   else if(this.type == "nothing"){
     this.building = snow;
   }
 }
 
 // display tiles; takes top-left x, y location
 void display(float x, float y) {
   
   // display animation
   //chop.display(x,y);
   
   // display tile
   noStroke();
   fill(220);
   if (this.captured == true){
     fill(200,100,50);
   }
   rect(x,y,x+250,y+200);
   image(this.building,x+5,y+5);
   fill(20,250,47);  
   if (features != null) {
     for (int i = 0; i < features.length; i += 5) {
       int w = this.building.width;
       int h = this.building.height;
       features[i].display (int (x + 15), int (y + 15 + (h / 6) * (i / 5)));
       features[i + 1].display (int (x + 15 + (w / 5) * 1), int (y + 15 + (h / 6) * (i / 5)));
       features[i + 2].display (int (x + 15 + (w / 5) * 2), int (y + 15 + (h / 6) * (i / 5)));
       features[i + 3].display (int (x + 15 + (w / 5) * 3), int (y + 15 + (h / 6) * (i / 5)));
       features[i + 4].display (int (x + 15 + (w / 5) * 4), int (y + 15 + (h / 6) * (i / 5)));
     }
   }
 }
 
 // captures a tile
 void capture() {
   
   // set capture 
   this.captured = true;
   
   // set image based on type
   if(this.type == "Tower"){
     this.building = castle;
   }
   if(this.type == "Farm"){
     this.building = wheat;
   }
   if(this.type == "Mill"){
     this.building = logging;
   }
   if(this.type == "Quarry"){
     this.building = iron;
   }
   if(this.type == "nothing"){
     this.building = iron;
   }
 }
 
}
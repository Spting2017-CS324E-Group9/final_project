class Tile{
 String type;
 PImage building;
 boolean captured;
 Tile(int i){
   building = tower;
   if ( i == 0) {type = "Farm";}
   if ( i == 1) {type = "Mill";}
   if ( i == 2) {type = "Quarry";}
   if ( i == 3) {type = "Tower";}
   print(type, "\n");
 }
 void display(float x, float y) {
   if(this.type =="Tower"){building = tower;if(this.captured == true){building = castle;}}
   if(this.type =="Farm"){building = tundra;if(this.captured == true){building = wheat;}}
   if(this.type =="Mill"){building = forest;if(this.captured == true){building = logging;}}
   if(this.type =="Quarry"){building = mountain;if(this.captured == true){building = iron;}}
   
   noStroke();
   fill(20,250,47);
   if (captured == true){fill(200,100,50);}
   rect(x,y,x+250,y+200);
   image(building,x+5,y+5);
   fill(20,250,47);
   
 
   
 }
 void capture() {captured = true;}
 
}
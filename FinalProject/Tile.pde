class Tile{
  
 String type;
 PImage building;
 boolean captured;
 int pop;
 
 // takes type of tile as int
 Tile(int i){
   building = tower;
   pop = 0;
   if ( i == 0) {type = "Farm";}
   if ( i == 1) {type = "Mill";}
   if ( i == 2) {type = "Quarry";}
   if ( i == 3) {type = "Tower";}
   if ( i == 5) {type = "nothing";}
 }
 
 // display tiles; takes top-left x, y location
 void display(float x, float y) {
   
   // assign images by type and captured values
   if(this.type == "Tower"){
     if(this.captured){
       building = castle;
     }
     else {
       building = tower;
     }
   }
   if(this.type == "Farm"){
     if(this.captured){
       building = wheat;
     }
     else {
       building = tundra;
     }
   }
   if(this.type == "Mill"){
     if(this.captured){
       building = logging;
     }
     else {
       building = forest;
     }
   }
   if(this.type == "Quarry"){
     if(this.captured){
       building = iron;
     }
     else {
       building = mountain;
     }
   }
   if(this.type == "nothing"){
     if(this.captured){
       building = iron;
     }
     else {
       building = mountain;
     }
   }
   
   // display animation
   chop.display(x,y);
   noStroke();
   fill(100,250,100);
   if (captured == true){fill(200,100,50);}
   rect(x,y,x+250,y+200);
   image(building,x+5,y+5);
   fill(20,250,47);  
 }
 
 // captures a tile
 void capture() {captured = true;}
 
}
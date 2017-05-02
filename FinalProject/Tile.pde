class Tile{
  
 String type;
 PImage building;
 boolean captured;
 int pop;
 
 // takes type of tile as int
 Tile(int i){
   building = tower;
   pop = 0;
   if (i == 0) {type = "Farm";}
   if (i == 1) {type = "Mill";}
   if (i == 2) {type = "Quarry";}
   if (i == 3) {type = "Tower";}
   if (i == 5) {type = "nothing";}
   
   // set image based on type
   if(this.type == "Tower"){
     building = tower;
   }
   else if(this.type == "Farm"){
     building = tundra;
   }
   else if(this.type == "Mill"){
     building = forest;
   }
   else if(this.type == "Quarry"){
     building = mountain;
   }
   else if(this.type == "nothing"){
     building = mountain;
   }
 }
 
 // display tiles; takes top-left x, y location
 void display(float x, float y) {
   
   // display animation
   chop.display(x,y);
   
   // display tile
   noStroke();
   fill(100,250,100);
   if (captured == true){
     fill(200,100,50);
   }
   rect(x,y,x+250,y+200);
   println (this.type);
   //image(building,x+5,y+5);
   fill(20,250,47);  
 }
 
 // captures a tile
 void capture() {
   
   // set capture 
   captured = true;
   
   // set image based on type
   if(this.type == "Tower"){
     building = castle;
   }
   if(this.type == "Farm"){
     building = wheat;
   }
   if(this.type == "Mill"){
     building = logging;
   }
   if(this.type == "Quarry"){
     building = iron;
   }
   if(this.type == "nothing"){
     building = iron;
   }
 }
 
}
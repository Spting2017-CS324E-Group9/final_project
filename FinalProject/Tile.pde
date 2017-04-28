class Tile{
 String type;
 PImage building;
 boolean captured;
 int pop;
 
 Tile(int i){
   building = tower;
   pop = 0;
   if ( i == 0) {type = "Farm";}
   if ( i == 1) {type = "Mill";}
   if ( i == 2) {type = "Quarry";}
   if ( i == 3) {type = "Tower";}
   if ( i == 5) {type = "nothing";}
 }
 void display(float x, float y) {
   if(this.type =="Tower"){building = tower;if(this.captured == true){building = castle;}}
   if(this.type =="Farm"){building = tundra;if(this.captured == true){building = wheat;}}
   if(this.type =="Mill"){building = forest;if(this.captured == true){building = logging;}}
   if(this.type =="Quarry"){building = mountain;if(this.captured == true){building = iron;}}
    if(this.type =="nothing"){building = mountain;if(this.captured == true){building = iron;}}
   noStroke();
   fill(100,250,100);
   if (captured == true){fill(200,100,50);}
   rect(x,y,x+250,y+200);
   image(building,x+5,y+5);
   fill(20,250,47);
   
 
   
 }
 void capture() {captured = true;}
 
}
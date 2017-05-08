class Character{
  
  float[] skills = new float[5];
  String[] names = {"Njal","Hrafenkel","Aelid","Snorri","Thorbjorn","Jacob","Dennis","Chris"};
  String name;
  int xloc, yloc;
  Tile location;
  boolean tired;
  PImage tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging;
  
  Character(PImage _tower, PImage _tundra, PImage _forest, PImage _mountain, PImage _snow,PImage _castle,PImage _iron, PImage _farm, PImage _wheat, PImage _logging ) {

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
    location = new Tile(5,tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging);
    for(int i= 0; i< 5; i++){skills[i] = round(5-sqrt(random(25)));}
    int j = floor(random(5));
    name = names[j];
    this.tired =false;
  }
  
  // moves a character
  void locate() {
    Tile dest = gm.tiles[xloc+59+gm.x][yloc+44+gm.y]; 
    if(dest.pop <2 && dest.captured == true){
      print("huzzah");
        this.location.pop -= 1;
        this.location = dest;
        this.location.pop +=1;
        this.tired = true; 
    }
    if(dest.captured == false){
      if(gm.tiles[xloc+60+gm.x][yloc +44+gm.y].captured == true | gm.tiles[xloc+58+gm.x][yloc+44+gm.y].captured == true |gm.tiles[xloc+59+gm.x][yloc+45+gm.y].captured == true |gm.tiles[xloc+59+gm.x][yloc+43+gm.y].captured == true){
        dest.captured = true;
        gm.control +=1;
        this.tired = true;
        float j = random(100);
        if(j >= 50){
          Character r = new Character(tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging);
          gm.charcount +=1;
          gm.population[gm.charcount] = r;
        }
        if(j >= 75){
          Character r = new Character(tower,tundra,forest,mountain,snow, castle, iron, farm, wheat, logging);
          gm.charcount +=1;
          gm.population[gm.charcount] = r;
        }
        
        
      }
    }
  }
  
}
  
  
  
  
  
  
  
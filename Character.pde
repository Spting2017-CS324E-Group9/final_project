class Character{
  float[] skills = new float[5];
  String[] names = {"Njal","Hrafenkel","Aelid","Snorri","Thorbjorn","Jacob","Dennis","Chris"};
  String name;
  int xloc, yloc;
  Tile location;
  boolean tired;
  
  Character() {
    location = new Tile(5);
    for(int i= 0; i< 5; i++){skills[i] = round(5-sqrt(random(25)));}
    int j = floor(random(5));
    name = names[j];
    this.tired =false;
  }
  
  void locate() {
    Tile dest = g.tiles[xloc+59+g.x][yloc+44+g.y]; 
    if(dest.pop <2 && dest.captured == true){
        this.location.pop -= 1;
        this.location = dest;
        this.tired = true; 
    }
    if(dest.captured == false){
      if(g.tiles[xloc+60+g.x][yloc +44+g.y].captured == true | g.tiles[xloc+58+g.x][yloc+44+g.y].captured == true |g.tiles[xloc+59+g.x][yloc+45+g.y].captured == true |g.tiles[xloc+59+g.x][yloc+43+g.y].captured == true){
        dest.captured = true;
        g.control +=1;
        this.tired = true;
        float j = random(100);
        if(j >= 50){
          Character r = new Character();
          g.charcount +=1;
          g.population[g.charcount] = r;
        }
        if(j >= 75){
          Character r = new Character();
          g.charcount +=1;
          g.population[g.charcount] = r;
        }
        
        
      }
    }
  }
  
}
  
  
  
  
  
  
  
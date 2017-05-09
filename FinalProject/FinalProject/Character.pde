class Character{
  float[] skills = new float[5];
  String[] names = {"Njal","Hrafe","Aelid","Snorri","Thorb","Jacob","Dennis","Chris","Tyson","Wlad","Antho","Kubra","Deon","Jopa","Kintiz","Gennad"};
  String name,Job;
  int xloc, yloc;
  Tile location;
  boolean tired;
  
  Character() {
    Job= " ";
    location = new Tile(5);
    for(int i= 0; i< 5; i++){skills[i] = round(5-sqrt(random(25)));}
    int j = floor(random(names.length -1));
    name = names[j];
    this.tired =false;
  }
  
  void locate() {
    Tile dest = g.tiles[xloc+59+g.x][yloc+44+g.y]; 
    if(dest.pop <2 && dest.captured == true){
       
        this.location.pop -= 1;
        this.location = dest;
        this.location.pop +=1;
        
        this.tired = true; 
         if (this.location.type == "Farm"){ this.Job = "Farming";}
         if (this.location.type == "Mill"){ this.Job = "Logging";}
         if (this.location.type == "Quarry"){ this.Job = "Mining";}
         if (this.location.type == "Tower"){ this.Job = "Guarding";}
         int i = this.xloc + 59 + g.x;
         int j = this.yloc + 44 + g.y;
        g.dayString += this.name + " is now " +this.Job + " at (" + i+", "+j+") ";
    }
    if(dest.captured == false){
      if(g.tiles[xloc+60+g.x][yloc +44+g.y].captured == true | g.tiles[xloc+58+g.x][yloc+44+g.y].captured == true |g.tiles[xloc+59+g.x][yloc+45+g.y].captured == true |g.tiles[xloc+59+g.x][yloc+43+g.y].captured == true){
        dest.captured = true;
        this.Job = "Capturing";
        g.control +=1;
        this.tired = true;
        float j = random(100);
        //if(j >= 50){
        //  Character r = new Character();
        //  g.charcount +=1;
        //  g.population[g.charcount] = r;
        //  g.dayString += "New Character has joined ";
        //}
        //if(j >= 75){
        //  Character r = new Character();
        //  g.charcount +=1;
        //  g.population[g.charcount+1] = r;
        //}
        
        
      }
    }
  }
  
}
  
  
  
  
  
  
  
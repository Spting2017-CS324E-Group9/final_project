class Character{
  float[] skills = new float[5];
  String[] names = {"Njal","Hrafe","Aelid","Snorri","Thorb","Jacob","Dennis","Chris","Tyson","Wlad","Antho","Kubra","Deon","Jopa","Kintiz","Gennad","Kova","Schmilco"};
  String name,Job;
  int xloc, yloc;
  int xtile,ytile;
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
    Tile dest = gm.tiles[xloc+59+gm.x][yloc+44+gm.y]; 
    xtile = xloc+59+gm.x;
    ytile = yloc +44+gm.y;
    if(dest.pop <2 && dest.captured == true){
       
        this.location.pop -= 1;
        this.location = dest;
        this.location.pop +=1;
        
        this.tired = true; 
         if (this.location.type == "Farm"){ this.Job = "Farming";}
         if (this.location.type == "Mill"){ this.Job = "Logging";}
         if (this.location.type == "Quarry"){ this.Job = "Mining";}
         if (this.location.type == "Tower"){ this.Job = "Guarding";}
         int i = this.xloc + 59 + gm.x;
         int j = this.yloc + 44 + gm.y;
        gm.dayString += this.name + " is now " +this.Job + " at (" + i+", "+j+") ";
    }
    if(dest.captured == false){
      if(gm.tiles[xloc+60+gm.x][yloc +44+gm.y].captured == true | gm.tiles[xloc+58+gm.x][yloc+44+gm.y].captured == true |gm.tiles[xloc+59+gm.x][yloc+45+gm.y].captured == true |gm.tiles[xloc+59+gm.x][yloc+43+gm.y].captured == true){
        dest.captured = true;
        this.Job = "Capturing";
        gm.control +=1;
        this.tired = true;
        float j = random(100);
        float l = random(100);
        float r = random(100);
        if (j > 60) {
          Character k = new Character();
          gm.population[gm.charcount] = k;
          gm.dayString += "Character "+k.name+" has been found. ";
          gm.charcount += 1;
        }
        if (l > 75) {
          Character k = new Character();
          gm.population[gm.charcount] = k;
          gm.charcount += 1;
          gm.dayString += "Character "+k.name+" has been found. ";
        }
        if(r <= 80 && r >= 75){
          j = floor(random(3,8));
          gm.defence += j;
          gm.dayString += "You have found a wizard's staff adding " + j+ "defence to your city"; 
        }
        if(r>=80 && r <= 90){
          j = floor(random(5,15));  
          gm.cfood += j;
          gm.dayString += "You have found a stockpile adding " + j+ "food to your city"; 
        }
        if(r>=60 && r <= 67){
          j = floor(random(5,15));  
          gm.cstone += j;
          gm.dayString += "You have found rubble adding " + j+ "stone to your city"; 
        }
        if(r>=20 && r <= 29){
          j = floor(random(5,15));  
          gm.wood += j;
          gm.dayString += "You have found furniture adding " + j+ "wood to your city"; 
        }
        
      }
    }
  }
  
}
  
  
  
  
  
  
  
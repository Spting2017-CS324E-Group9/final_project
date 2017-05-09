class Character {

  float[] skills = new float[5];
  String[] names = {"Njal", "Hrafenkel", "Aelid", "Snorri", "Thorbjorn", "Jacob", "Dennis", "Chris"};
  String name;
  int x, y;
  Tile location;
  boolean tired;
  Animation anim;

  Character(Tile loc) {
    anim = new Animation ("axman", 8);
    location = loc;
    x = location.x;
    y = location.y;

    for (int i= 0; i< 5; i++) {
      skills[i] = round(5-sqrt(random(25)));
    }
    int j = floor(random(5));
    name = names[j];
    this.tired =false;
  }

  // moves a character
  void locate() {
    Tile dest = gm.tiles[x+59+gm.x][y+44+gm.y]; 
    if (dest.pop <2 && dest.captured == true) {
      print("huzzah");
      this.location.pop -= 1;
      this.location = dest;
      this.location.pop +=1;
      this.tired = true;
    }
    if (dest.captured == false) {
      if (gm.tiles[x+60+gm.x][y +44+gm.y].captured == true | gm.tiles[x+58+gm.x][y+44+gm.y].captured == true |gm.tiles[x+59+gm.x][y+45+gm.y].captured == true |gm.tiles[x+59+gm.x][y+43+gm.y].captured == true) {
        dest.captured = true;
        gm.control +=1;
        this.tired = true;
        float j = random(100);
        if (j >= 50) {
          Character r = new Character(dest);
          gm.charcount +=1;
          gm.population[gm.charcount] = r;
        }
        if (j >= 75) {
          Character r = new Character(dest);
          gm.charcount +=1;
          gm.population[gm.charcount] = r;
        }
      }
    }
  }

  void display () {
    println (name, ": ", x, y);
    this.anim.display (this.x, this.y);
  }
}
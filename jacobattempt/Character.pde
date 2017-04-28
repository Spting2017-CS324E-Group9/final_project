class Character{
  float[] skills = new float[5];
  String[] names = {"Njal","Hrafenkel","Aelid","Snorri","Thorbjorn"};
  String name;
  
  Character() {
    for(int i= 0; i< 5; i++){skills[i] = round(random(5));}
    int j = floor(random(5));
    name = names[j];
  }
  
}
  
  
  
  
  
  
  
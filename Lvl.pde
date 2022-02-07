class Lvl {
  int seed = 0, lvlX, lvlY, enemsKilled = 0;
  boolean unlocked = false;
  color col = (200);
  
  Bob enems[] = new Bob[0];
  Sprite obs[] = new Sprite[0];
  
   Lvl(int lvlX, int lvlY){
    this.lvlX = lvlX;
    this.lvlY = lvlY;
    
    //sets seed based off level distance from origin, seed determines level difficulty
    this.seed = ((int) sqrt((pow(lvlX, 2)) + pow(lvlY, 2)));
    
    //sets color based off seed to indicate level position and difficulty
    this.col -= abs((seed * 10));
    
    updateLvl();
  }
  
  void updateLvl(){
    //initializes level enemies based off seed 
    enems = new Bob[seed - enemsKilled];
    for(int i = 0; i < enems.length; i++){
      Bob bob = new Bob((int)(Math.random() * width), (int)(Math.random() * height), 50, 50);
      enems[i] = bob;
    }
  }
}

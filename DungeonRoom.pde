class DungeonRoom {
  
  int seed = 0, lvlX, lvlY, enemsKilled = 0;
  boolean unlocked = false;
  color col = color(0, 250, 0);
  PFont difficultyIndicator; //loadFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf");
  
  AbstractSprite enems[] = new Bob[0];
  
   DungeonRoom(int lvlX, int lvlY){
    this.lvlX = lvlX;
    this.lvlY = lvlY;
    
    //sets seed based off level distance from origin, seed determines level difficulty
    this.seed = ((int) sqrt((pow(lvlX, 2)) + pow(lvlY, 2)));
    
    //sets color based off seed to indicate level position and difficulty
    this.col = color(abs(seed * 20), 250 - abs(seed * 20), 0);
    
    updateLvl();
  }
  
  void updateLvl(){
    enems = new Bob[seed - enemsKilled];
    for(int i = 0; i < enems.length; i++){
      Bob bob = new Bob((int)(Math.random() * width), (int)(Math.random() * height), 100, 100);
      enems[i] = bob;
    }
  }
  
  void iterateEnems(int iterate){
    enemsKilled += iterate;
    if(enemsKilled == enems.length){
      game.dungeon.updateSymbols();
    }
  }
  
  void decorateLvl(){
    //sets level decorations
    push();
    fill(col);
    textAlign(CENTER);
    difficultyIndicator = createFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf", 160);
    textFont(difficultyIndicator);
    text(seed, width/2, height/2 + 80); 
    pop();
  }
}

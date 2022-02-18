class DungeonRoom implements SpriteObserver {
  
  int seed = 0, lvlX, lvlY, enemsKilled = 0;
  boolean unlocked = false;
  color col = color(0, 250, 0);
  PFont difficultyIndicator; //loadFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf");
  
  AbstractSprite enems[] = new Jim[0];

  DungeonRoom(int lvlX, int lvlY){
    this.lvlX = lvlX;
    this.lvlY = lvlY;
    
    //sets seed based off level distance from origin, seed determines level difficulty
    this.seed = ((int) sqrt((pow(lvlX, 2)) + pow(lvlY, 2)));
    
    //sets color based off seed to indicate level position and difficulty
    this.col = color(abs(seed * 20), 250 - abs(seed * 20), 0);
    
    difficultyIndicator = createFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf", 160);
    updateLvl();
  }
  
  void updateLvl(){
    enems = new AbstractSprite[constrain(seed - enemsKilled, 0, seed)];
    for(int i = 0; i < enems.length; i++) {
      Bob bob = new Bob((int)(Math.random() * width), (int)(Math.random() * height), 100, 100);
      enems[i] = bob;
    }
  }
  
  void observeDeath(AbstractSprite sprite) {
    if(!(sprite instanceof Projectile)) {
      enemsKilled += 1;    
    }
  }
    
  void decorateLvl(){
    //sets level decorations
    push();
    fill(col);
    textAlign(CENTER);
    textFont(difficultyIndicator);
    text(seed, width/2, height/2 + 80); 
    pop();
  }
}

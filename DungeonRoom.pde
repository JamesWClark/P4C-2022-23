class DungeonRoom {
  
  int seed = 0, lvlX, lvlY, enemsKilled = 0;
  boolean unlocked = false;
  color col = color(0, 250, 0);
  PFont difficultyIndicator; //loadFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf");
  
  AbstractSprite enems[] = new AbstractSprite[0];
  
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
    enems = new AbstractSprite[seed - enemsKilled];
    for(int i = 0; i < enems.length; i++){
      if(i % 3 == 0){
        Zombie z = new Zombie(generateRandSpawnX(), generateRandSpawnY(), 100, 100);
        enems[i] = z;
      } else{
        Bob b = new Bob(generateRandSpawnX(), generateRandSpawnY(), 100, 100);
        enems[i] = b;
      }
    }
  }
  // enemies kept spawning on the player, so I changed the random spawn position 
  // to be within bounds that could not be on top of a player in any doorway (i.e. center-ish of the screen)
  int generateRandSpawnX(){
    return (int)(random(width/3, width/1.5));
  }
  int generateRandSpawnY(){
    return (int)(random(height/3, height/1.5));
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
    //this is just here to show the area where enemies can spawn
    /*
    rectMode(CORNERS);
    rect(width/3, height/3, width/1.5, height/1.5);
    rectMode(CENTER);
    */
    pop();
  }
}

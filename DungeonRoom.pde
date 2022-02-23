class DungeonRoom implements SpriteObserver {
  
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
    
    difficultyIndicator = createFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf", 160);
    updateLvl();
  }
  
  void updateLvl(){
    enems = new AbstractSprite[seed - enemsKilled];
    for(int i = 0; i < enems.length; i++){
      if(i % 4 == 0 && i != 0){
        enems[i] = new ArmorBoi(generateRandSpawnX(), generateRandSpawnY());
      } else if(i % 6 == 0 && i != 0) {
        enems[i] = new Redneck(generateRandSpawnX(), generateRandSpawnY(), 100, 100);
      } else if(i % 5 == 0 && i != 0) {
        enems[i] = new Bill(generateRandSpawnX(), generateRandSpawnY(), 100, 100);
      } else if(i % 3 == 0  && i != 0){
        enems[i] = new Jim(generateRandSpawnX(), generateRandSpawnY(), 100, 100);
      } else if(i % 2 == 0  && i != 0){
        enems[i] = new Zombie(generateRandSpawnX(), generateRandSpawnY(), 100, 100);
      }else{
        enems[i] = new Bob(generateRandSpawnX(), generateRandSpawnY(), 100, 100);
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
    //this is just here to show the area where enemies can spawn
    /*
    rectMode(CORNERS);
    rect(width/3, height/3, width/1.5, height/1.5);
    rectMode(CENTER);
    */
    pop();
  }
}

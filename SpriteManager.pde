class SpriteManager {

  ArrayList<AbstractSprite> deleteQueue = new ArrayList<AbstractSprite>();
  ArrayList<AbstractSprite> sprites = new ArrayList<AbstractSprite>();

  
  void spawn(AbstractSprite sprite){
    sprites.add(sprite);
  }
  
  void killEnemies(){
    int i = 0;
    // loop through sprite array
    while(i < sprites.size()) {
      // if the sprite is a Projectile
      if(sprites.get(i) instanceof Projectile){
        // loop through the sprite array again
        for(int j = 0; j < game.sprites.size(); j++){
          // check if there's an enemy colliding with the projectile
          if(sprites.get(j) instanceof Bob && sprites.get(i).collide(sprites.get(j))){
            // updates enemies killed in current level
            lvlManager.currentLvl.iterateEnems(1);
            
            // add the sprite to the delete queue
            pendDelete(sprites.get(j));
            pendDelete(sprites.get(i));
            game.ammo.addAmmo(3); 
            Stats.enemiesKilled++; 
          }
        }
      }
      if(sprites.get(i) instanceof Player){
        // loop through the sprite array again
        for(int j = 0; j < game.sprites.size(); j++){
          // check if there's an enemy colliding with the player
          if(sprites.get(j) instanceof Bob && sprites.get(i).collide(sprites.get(j))){
            // updates enemies killed in current level
            lvlManager.currentLvl.iterateEnems(1);
            
            // add the sprite to the delete queue
            pendDelete(sprites.get(j));
            hearts.loseHeart();
          }
        }
      }
      i++;
    }
  }
  
  void removeProjectiles(){
    for(AbstractSprite s: sprites) {
      if(s instanceof Projectile){
        //the second Y and X numbers are the size of the play window
        //will handle larger/smaller windows universal later
        if(s.y <= 0 || s.y >= height  || s.x <= 0 || s.x >= width){
          pendDelete(s);
        }
      }
    }
  }
  
  void delete(){
    for(Sprite s: deleteQueue){
      sprites.remove(s);
    }
    deleteQueue.clear();
  }
  
  void pendDelete(AbstractSprite s){
    deleteQueue.add(s);
  }
}

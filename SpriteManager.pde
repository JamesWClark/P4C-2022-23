class SpriteManager {

  ArrayList<AbstractSprite> dead = new ArrayList<AbstractSprite>();
  ArrayList<AbstractSprite> alive = new ArrayList<AbstractSprite>();

  void manage() {
    for(Sprite s: alive){
      s.move();
      s.render();
    } 
    removeProjectiles();
    killEnemies();
    delete();
  }
  
  void removeProjectiles(){
    for(AbstractSprite s: alive) {
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
    for(Sprite s: dead){
      alive.remove(s);
    }
    dead.clear();
  }
  
  void pendDelete(AbstractSprite s){
    dead.add(s);
  }
  
  void killEnemies(){
    // loop through sprite array
    for(int i = 0; i < alive.size(); i++) {
      for(int j = i+1; j < alive.size(); j++) {
        AbstractSprite a = alive.get(i);
        AbstractSprite b = alive.get(j);
        if(a.team != b.team && a.collide(b)) {
          // updates enemies killed in current level
          game.dungeon.currentLvl.iterateEnems(1);
          
          // add the sprite to the delete queue
          //pendDelete(a);
          //pendDelete(b);
          a.handleCollision(b);
          b.handleCollision(a);
          game.player.ammo.addAmmo(3); 
          Stats.enemiesKilled++;           
        }
      }
    }
  }
  
  void spawn(AbstractSprite sprite){
    alive.add(sprite);
  }
}

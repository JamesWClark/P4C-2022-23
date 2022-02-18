class SpriteManager {

  ArrayList<SpriteObserver> observers = new ArrayList<SpriteObserver>();
  ArrayList<AbstractSprite> dead = new ArrayList<AbstractSprite>();
  ArrayList<AbstractSprite> alive = new ArrayList<AbstractSprite>();

  void manage() {
    moveThePieces();
    detectCollisions();
    cleanupTheDead();
  }
    
  void moveThePieces() {
    // standard for loop fixes concurent modification exception in foreach style loop caused by Jim
    for(int i = alive.size() - 1; i >= 0; i--) {
      alive.get(i).move();
      alive.get(i).render();
    }
  }
  
  void detectCollisions(){
    for(int i = 0; i < alive.size(); i++) {
      for(int j = i+1; j < alive.size(); j++) {
        AbstractSprite a = alive.get(i);
        AbstractSprite b = alive.get(j);
        if(a.team != b.team && a.collide(b)) {
          
          // assumes a kill has occurred?
          // game.player.ammo.addAmmo(3);
          Stats.enemiesKilled++;
          
          // this technique does not guarantee a kill (maybe a collision or aquisition instead)
          a.handleCollision(b);
          b.handleCollision(a);
        }
      }
    }
  }
  
  void cleanupTheDead(){
    for(AbstractSprite sprite: dead){
      alive.remove(sprite);
      for(SpriteObserver observer : observers) {
        observer.observeDeath(sprite);
      }
    }
    dead.clear();
  }
  
  void pendDelete(AbstractSprite s){
    dead.add(s);
  }
  
  void registerObserver(SpriteObserver observer) {
    observers.add(observer);
  }
  
  void deregisterObserver(SpriteObserver observer) {
    observers.remove(observer);
  }
  
}

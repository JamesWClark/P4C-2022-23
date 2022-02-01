import java.util.*;

class Game {
  
  ArrayList<Sprite> deleteQueue = new ArrayList<Sprite>();
  ArrayList<Sprite> sprites = new ArrayList<Sprite>();
  ArrayList<UIComponent> ui = new ArrayList<UIComponent>();
  Player player;
  
  //UI
  Hearts hearts;
  Ammo ammo; 
  
  void config() {
    noStroke();
    rectMode(CENTER);
  }
  
  void spawn(Sprite sprite){
    sprites.add(sprite);
  }
  
  void load() {
    config();
    player = new Player(width/2, height-100, 50, 50, "assets/spaceship.png");
    sprites.add(player); 
    
    hearts = new Hearts(3);
    ammo = new Ammo(10); 
    ui.add(ammo); 
    ui.add(hearts);
    
    
    for(int x = 150; x <= 750; x += 60){
      spawn(new Bob(x-25, 100, 50, 50));
    }
  }
  
  void play() {
    println(sprites.size());
    background(#fef9ef);
    for(Sprite s: sprites){
      s.move();
      s.render();
    }
    for(UIComponent c: ui){
      c.render();
    }
    removeProjectiles();
    killEnemies();
    delete();
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
            // add the sprite to the delete queue
            pendDelete(sprites.get(j));
            pendDelete(sprites.get(i));
            game.ammo.addAmmo(3); 
          }
        }
      }
      if(sprites.get(i) instanceof Player){
        // loop through the sprite array again
        for(int j = 0; j < game.sprites.size(); j++){
          // check if there's an enemy colliding with the player
          if(sprites.get(j) instanceof Bob && sprites.get(i).collide(sprites.get(j))){
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
    for(Sprite s: sprites) {
      if(s instanceof Projectile){
        //the second Y and X numbers are the size of the play window
        //will handle larger/smaller windows universal later
        if(s.getY() <= 0 || s.getY() >= 600 || s.getX() <=0 || s.getX() >= 800){
          pendDelete(s);
        }
      }
    }
  }
  
  void pendDelete(Sprite s){
    deleteQueue.add(s);
  }
  
  void delete(){
    for(Sprite s: deleteQueue){
      sprites.remove(s);
    }
    deleteQueue.clear();
  }
}

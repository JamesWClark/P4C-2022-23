import java.util.*;

class Game {
  
  ArrayList<Sprite> deleteQueue = new ArrayList<Sprite>();
  ArrayList<Sprite> sprites = new ArrayList<Sprite>();
  ArrayList<UIComponent> ui = new ArrayList<UIComponent>();
  Player player;
  
  //UI
  Hearts hearts;
  Ammo ammo; 
  
  //Stats
  Stats statistics; 
  
  
  
  void config() {
    noStroke();
  }
  
  void spawn(Sprite sprite){
    sprites.add(sprite);
  }
  
  void load() {
    config();
    player = new Player(width/2, height-100, 50, 50, "assets/spaceship.png");
    sprites.add(player); 
    
    Stats stats = new Stats(); 
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
  
  //checks if game has been paused from keypress
  void checkPause(){
    if ( key == 'p' ) {
      paused = !paused;
      if (paused) {
        noLoop();
        game.pauseMenu(true);
      } else {
        loop();
        game.pauseMenu(false);
      }
    }
  }
  

  
  //creates pause menu if whenever checkPause() is true
  void pauseMenu(boolean p){
    if(p){
      fill(225, 0, 0);
      rect(width/10, (height/15), (width - (width/5)), 100, 28);
      textAlign(CENTER);
      fill(0, 0, 225);
      textSize(100);
      text("Game Paused", width/2, height/5);
      textSize(30);
      text("Shots Fired: " + Stats.shotsFired, width/5, height/3);
      text("Enemies Killed: " + Stats.enemiesKilled, 4*width/5, height/3);
    }
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
            Stats.enemiesKilled++; 
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

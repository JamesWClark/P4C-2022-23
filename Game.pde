import java.util.*;

class Game {
  
  ArrayList<Sprite> deleteQueue = new ArrayList<Sprite>();
  ArrayList<Sprite> sprites = new ArrayList<Sprite>();
  //ArrayList<Sprite> lvlSprites = new ArrayList<Sprite>();
  ArrayList<UIComponent> ui = new ArrayList<UIComponent>();
  Player player;
  
  //UI
  Hearts hearts;
  
  LvlManager lvlManager = new LvlManager();
  
  void config() {
    noStroke();
  }
  
  void spawn(Sprite sprite){
    sprites.add(sprite);
  }
  
  void levelLoad(){
    //clears sprites to make room for new level sprites
    if(sprites.size() > 0){
     try{
       ArrayList<Sprite> sprites = new ArrayList<Sprite>(this.sprites);
       for(Sprite s: sprites){
         pendDelete(s);
       }
       this.sprites = sprites;
      } catch (NullPointerException e){
        e.printStackTrace();
      }      
    }

    config();
    
    lvlManager.addSymbols();
    
    player = new Player(width/2, height-100, 50, 50, color(#17c3b2));
    sprites.add(player); 
    
    hearts = new Hearts(3);
    ui.add(hearts);
    
    //spawns in enemies based on currentlevel enemy count and arbitrary enemy positions
    if(lvlManager.currentLvl.enems.length > 0){
      try{
        for(int x = 0; x < lvlManager.currentLvl.enems.length; x++){
          spawn(new Bob(lvlManager.currentLvl.enems[x].x, lvlManager.currentLvl.enems[x].y, 50, 50));
        }
      } catch (NullPointerException e) {
       e.printStackTrace();
      }    
    }
  }
  
  void load() {
    config();
    
    lvlManager.addSymbols();
    
    player = new Player(width/2, height-100, 50, 50, color(#17c3b2));
    sprites.add(player); 
    
    hearts = new Hearts(3);
 
    ui.add(hearts);
  }
  
  void play() {
    //println(sprites.size());
    
    //sets background color to current level color
    background(lvlManager.currentLvl.col);
    
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
            // updates enemies killed in current level
            lvlManager.currentLvl.enemsKilled++;
            
            // add the sprite to the delete queue
            pendDelete(sprites.get(j));
            pendDelete(sprites.get(i));
          }
        }
      }
      if(sprites.get(i) instanceof Player){
        // loop through the sprite array again
        for(int j = 0; j < game.sprites.size(); j++){
          // check if there's an enemy colliding with the player
          if(sprites.get(j) instanceof Bob && sprites.get(i).collide(sprites.get(j))){
            // updates enemies killed in current level
            lvlManager.currentLvl.enemsKilled++;
            
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
        if(s.getY() <= 0 || s.getY() >= height  || s.getX() <= 0 || s.getX() >= width){
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

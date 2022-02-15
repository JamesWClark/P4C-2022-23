import java.util.*;

class Game {
  
  Player player;
  UIManager ui = new UIManager();
  SpriteManager sprites = new SpriteManager();
  DungeonCoordinator dungeon = new DungeonCoordinator();
  
  PImage BG;
  boolean paused = false;   
  
  void config() {
    BG = loadImage("assets/background.png");
    BG.resize(width, height);
    background(BG);
    noStroke();
    rectMode(CENTER);
    imageMode(CENTER);
  }
  
  void destroy(AbstractSprite target) {
    this.sprites.pendDelete(target);
  }
  
  void spawn(AbstractSprite target) {
    this.sprites.spawn(target);
  }
  
  void hud(UIComponent component) {
    this.ui.hud.add(component); 
  }
  
  void levelLoad(){
    //clears sprites to make room for new level sprites
    if(sprites.alive.size() > 0){
     try{
       ArrayList<AbstractSprite> sprites = new ArrayList<AbstractSprite>(this.sprites.alive);
       for(AbstractSprite s: this.sprites.alive){
         this.sprites.pendDelete(s);
       }
       this.sprites.alive = sprites;
      } catch (NullPointerException e){
        e.printStackTrace();
      }      
    }

    config();
    
    dungeon.addSymbols();
    
    player = new Player(width/2, height-100, 50, 50, color(#17c3b2));
    sprites.alive.add(player); 
    
    
    //spawns in enemies based on currentlevel enemy count and arbitrary enemy positions
    if(dungeon.currentLvl.enems.length > 0){
      try{
        for(int x = 0; x < dungeon.currentLvl.enems.length; x++){
          sprites.spawn(new Bob(dungeon.currentLvl.enems[x].x, dungeon.currentLvl.enems[x].y, dungeon.currentLvl.enems[x].w, dungeon.currentLvl.enems[x].h));
        }
      } catch (NullPointerException e) {
       e.printStackTrace();
      }    
    }
  }
  
  void load() {
    config();
    dungeon.addSymbols();
    player = new Player(width/2, height-100, 50, 50, color(#17c3b2));
    sprites.spawn(player); 
  }
  
  
  
  void play() {
    background(BG);
    dungeon.coordinate();
    sprites.manage();
    ui.manage();
  }
  
  void keyDown() {
    this.player.setMovement(key, keyCode, true);
    this.ui.checkPause(key);    
  }

  void keyUp() {
    this.player.setMovement(key, keyCode, false);
  }
}

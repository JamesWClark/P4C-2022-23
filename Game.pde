import java.util.*;

class Game {
  
  // treat as public
  Player player;
  
  // treat as private
  UIManager ui;
  SpriteManager sprites;
  DungeonCoordinator dungeon;
  
  PImage BG;
  boolean paused = false;   
  
  void config() {
    BG = loadImage("assets/background.png");
    BG.resize(width, height);
    background(BG);
    noStroke();
    rectMode(CENTER);
    imageMode(CENTER);
    
    ui = new UIManager();
    dungeon = new DungeonCoordinator();
    sprites = new SpriteManager();

  }
  
  // sprite proxy
  void destroy(AbstractSprite target) {
    this.sprites.pendDelete(target);
  }
  
  // sprite proxy
  void spawn(AbstractSprite target) {
    this.sprites.alive.add(target);
  }
  
  // ui proxy
  void hud(UIComponent component) {
    this.ui.hud.add(component); 
  }
  
  // setup
  void load() {
    config();
    dungeon.addSymbols();
    player = new Player(width/2, height-100, 50, 50, color(#17c3b2));
    this.spawn(player); 
  }
  
  // draw
  void play() {
    background(BG);
    dungeon.coordinate();
    sprites.manage();
    ui.manage();
  }
  
  // keyPressed
  void keyDown() {
    this.player.setMovement(key, keyCode, true);
    this.ui.checkPause(key);    
  }
   
  // keyReleased
  void keyUp() {
    this.player.setMovement(key, keyCode, false);
  }  
}

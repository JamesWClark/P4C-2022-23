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
  
    // main setup
  void config() {
    BG = loadImage("assets/background.png");
    BG.resize(width, height);
    background(BG);
    noStroke();
    rectMode(CENTER);
    imageMode(CENTER);
    
    // delayed b/c loading assets cannot occur before setup
    // (and game is instantiated in main above setup)
    ui = new UIManager();
    dungeon = new DungeonCoordinator();
    sprites = new SpriteManager();
  }
  
  // main setup
  void load() {
    config();
    dungeon.addSymbols();
    player = new Player(width/2, height-100, 50, 50, color(#17c3b2));
    this.spawn(player); 
  }
  
  // main draw
  void play() {
    background(BG);


    dungeon.coordinate();
    sprites.manage();
    ui.manage();
  }
  
  // main keyPressed
  void keyDown() {
    this.player.setMovement(key, keyCode, true);
    this.ui.checkPause(key);    
  }
   
  // main keyReleased
  void keyUp() {
    this.player.setMovement(key, keyCode, false);
  }  
}

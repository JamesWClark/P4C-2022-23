import java.util.*;

class Game {
  
  SpriteManager sprites = new SpriteManager();
  UIManager ui = new UIManager();

  
  PImage BG;
  Player player;
  boolean paused = false; 
  
  //UI
  Hearts hearts;
  Ammo ammo; 
  
  //Stats
  Stats statistics; 
  
  
  LvlManager lvlManager = new LvlManager();
  
  void config() {
    BG = loadImage("assets/background.png");
    BG.resize(width, height);
    background(BG);
    noStroke();
    rectMode(CENTER);
    imageMode(CENTER);
  }
  

  
  void levelLoad(){
    //clears sprites to make room for new level sprites
    if(sprites.size() > 0){
     try{
       ArrayList<AbstractSprite> sprites = new ArrayList<AbstractSprite>(this.sprites);
       for(AbstractSprite s: sprites){
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
    
    ammo = new Ammo(10); 
    
    
    ui.add(ammo); 
    ui.add(hearts);
    
    //spawns in enemies based on currentlevel enemy count and arbitrary enemy positions
    if(lvlManager.currentLvl.enems.length > 0){
      try{
        for(int x = 0; x < lvlManager.currentLvl.enems.length; x++){
          spawn(new Bob(lvlManager.currentLvl.enems[x].x, lvlManager.currentLvl.enems[x].y, lvlManager.currentLvl.enems[x].w, lvlManager.currentLvl.enems[x].h));
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
    //bg.resize(width, height);
    background(BG);
    lvlManager.currentLvl.decorateLvl();

    sprites.manage();
    ui.manage();

  }
  
  //checks if game has been paused from keypress
  void checkPause(char c){
    if ( c == 'p' ) {
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
      textAlign(CENTER);
      fill(0, 0, 225);
      textSize(100);
      text("Game Paused", width/2, height/5);
      textSize(30);
      text("Shots Fired: " + Stats.shotsFired, width/5, height/3);
      text("Enemies Killed: " + Stats.enemiesKilled, 4*width/5, height/3);
    }
  }
  

}

import java.util.*;

class Game {
  
  ArrayList<Sprite> sprites = new ArrayList<>();
  Player player;
  
  void config() {
    noStroke();
  }
  
  void load() {
    config();
    player = new Player(width/2, height-100, 50, 50, color(255, 0, 255));
    sprites.add(player); 
    sprites.add(new Bob(100, 100, 10, 10));
  }
  
  void play() {
    background(100);
    for(Sprite s : sprites) {
      s.move();
      s.render();
    }
  }
  
  void keyUp(char key) {
    player.keyUp(key);
  }
  
  void keyDown(char key) {
    player.keyDown(key);
  }
}

import java.util.*;
ArrayList<Sprite> sprites = new ArrayList<>();

Player player;

void config() {
  noStroke();
  player = new Player(width/2, height-100, 50, 50, color(255, 0, 255));
}

void setup() {
  size(800, 600);
  config();  
  sprites.add(player); 
  for(int i = 50; i < width; i += 50) {
    sprites.add(new Bob(i, 100, 10, 10));
  }
}

void draw() {
  background(100);
  for(Sprite s : sprites) {
    s.move();
    s.render();
  }
}

void keyPressed() {
  player.keyDown(key);
}

void keyReleased() {
  player.keyUp(key);
}

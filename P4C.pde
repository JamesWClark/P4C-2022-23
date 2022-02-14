Game game = new Game();
boolean paused = false; 

void setup() {
  size(800, 700);
  game.load();
}

void draw() {
  game.play();
  cursor(CROSS); 
  game.checkEnemy(); 
}

void keyPressed() {
  game.player.setMovement(key, keyCode, true);
  game.checkPause();
}
void keyReleased() {
  game.player.setMovement(key, keyCode, false);
}

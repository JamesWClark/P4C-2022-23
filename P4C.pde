Game game = new Game();
boolean paused = false; 

void setup() {
  size(1200, 1000);
  game.load();
}

void draw() {
  game.play();
}

void keyPressed() {
  game.player.setMovement(key, keyCode, true);
  game.checkPause();
}
void keyReleased() {
  game.player.setMovement(key, keyCode, false);
}

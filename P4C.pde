Game game = new Game();

void setup() {
  size(1200, 1000);
  game.load();
}

void draw() {
  game.play();
  rect(width - width/10, height - height/10, 75, 75, 28);
}

void keyPressed() {
  game.player.setMovement(key, keyCode, true);
  game.checkPause(key);
}
void keyReleased() {
  game.player.setMovement(key, keyCode, false);
}

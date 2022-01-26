Game game = new Game();

void setup() {
  size(800, 600);
  game.load();
}

void draw() {
  game.play();
}

void keyPressed() {
  game.player.setMovement(key, true);
}

void keyReleased() {
  game.player.setMovement(key, false);
}

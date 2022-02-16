Game game = new Game();

void setup() {
  size(900, 700, P2D);
  game.load();
}

void draw() {
  game.play();
}

void keyPressed() {
  game.keyDown();
}

void keyReleased() {
  game.keyUp();
}

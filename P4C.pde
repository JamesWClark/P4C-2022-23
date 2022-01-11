// global
Game game = new Game();

void setup() {
  size(800, 600);
  game.load();
}

void draw() {
  game.play();
}

void keyPressed() {
  game.keyDown(key);
}

void keyReleased() {
  game.keyUp(key);
}

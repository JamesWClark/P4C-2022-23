Game game = new Game();

void setup() {
  size(900, 700);
  game.load();
}

void draw() {
  game.play();
  println("Alive: " + game.sprites.alive.size());
  println("Dead: " + game.sprites.dead.size());
}

void keyPressed() {
  game.keyDown();
}

void keyReleased() {
  game.keyUp();
}

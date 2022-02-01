Game game = new Game();
boolean paused = false; 

void setup() {
  size(800, 600);
  game.load();
}

void draw() {
  game.play();
}

void keyPressed() {
  game.player.setMovement(key, true);
  if ( key == 'p' ) {

    paused = !paused;

    if (paused) {
      noLoop();
    } else {
      loop();
    }
  }
}
void keyReleased() {
  game.player.setMovement(key, false);
}

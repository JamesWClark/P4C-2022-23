class Player extends AbstractSprite {
  
  Player(int x, int y, int w, int h, color col) {
    super(x, y, w, h, col);
  }
  void move() {
    
  }
  
  void keyDown(char key) {
    println("Player key down: " + key);
  }
  
  void keyUp(char key) {
    println("Player key up: " + key);
  }
}

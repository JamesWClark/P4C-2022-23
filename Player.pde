class Player extends AbstractSprite {
  boolean[] moveKeys;
  
  Player(int x, int y, int w, int h, color col) {
    super(x, y, w, h, col);
    moveKeys = new boolean[5];
  }
  
  void move() {
    if(moveKeys[0]){
        y -= 3;
    }
    if(moveKeys[1]){
        x -= 3;
    }
    if(moveKeys[2]){
        y += 3;
    }
    if(moveKeys[3]){
        x += 3;
    }
  }
  
  
  
  void setMovement(int k, boolean b) {
    switch (k) {
      case 'w':
        moveKeys[0] = b;
        break;
      case 'a':
        moveKeys[1] = b;
        break;
      case 's':
        moveKeys[2] = b;
        break;
      case 'd':
        moveKeys[3] = b;
        break;   
      case 'W':
        moveKeys[0] = b;
        break;
      case 'A':
        moveKeys[1] = b;
        break;
      case 'S':
        moveKeys[2] = b;
        break;
      case 'D':
        moveKeys[3] = b;
        break;  
      case ' ':
        if(b == false){
          game.spawn(new Projectile(this.x, this.y - this.w/2 - 10));
      }
    }
  }
}

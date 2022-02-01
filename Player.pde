class Player extends AbstractSprite {
  boolean[] moveKeys;
  PImage sprite;
  
  Player(int x, int y, int w, int h, String spr) {
    super(x, y, w, h, spr);
    moveKeys = new boolean[5];
  }
  
  
  void move() {
    if(moveKeys[0] && canMove("up")){
        y -= 3;
    }
    if(moveKeys[1] && canMove("left")){
        x -= 3;
    }
    if(moveKeys[2] && canMove("down")){
        y += 3;
    }
    if(moveKeys[3] && canMove("right")){
        x += 3;
    }
  }
  
  //tests if player is on the border of the screen, and if not, is allowed to move
  boolean canMove(String direction){
    switch(direction){
      case "up":
        if(this.getY() <= 0) return false;
        break;
      case "down":
        if(this.getY() >= height) return false;
        break;
      case "left":
        if(this.getX() <= 0) return false;
        break;
      case "right":
        if(this.getX() >= width) return false;
        break;
    }
    return true;
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
        if(b == false && game.ammo.canShoot()){
          game.spawn(new Projectile(this.x, this.y - this.w/2 - 10));
          game.ammo.loseAmmo(); 
      }
    }
  }
}

class Player extends AbstractSprite {
  boolean[] moveKeys;
  
  
  Player(int x, int y, int w, int h, color col) {
    super(x, y, w, h, col);
    moveKeys = new boolean[5];
  }
  
  
  void render(){
   noStroke();
   fill(150);
   ellipse(x, y, w/2, h);
   fill(200, 50, 50);
   //yeah its not proportional/scalable, cry about it 
   triangle(x-18,y+41, x-12, y+11, x-2, y+25);
   triangle(x+9,y-18, x+0, y+-40, x-9, y-18);
   triangle(x+18,y+41, x+12, y+11, x+2, y+25);
   fill(150, 255, 255);
   strokeWeight(1);
   stroke(0);
   ellipse(x,y-10, w/6, h/6);
   ellipse(x,y, w/6, h/6);
   ellipse(x,y+10, w/6, h/6);
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

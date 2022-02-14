class Player extends AbstractSprite {
  boolean[] moveKeys;
  int speed = 3;
  
  Player(int x, int y, int w, int h, color col) {
    super(x, y, w, h, col);
    super.team = 2;
    moveKeys = new boolean[5];
  }


  void render(){
   //player
   ellipse(x, y, 50, 50);
   
   //appendages
    //arms
    pushMatrix();
     fill(225);
     rectMode(CENTER);
     translate(x, y);
     rotate(atan2(mouseY - y, mouseX - x));
     
       //left arm
       pushMatrix();
         rotate(radians(30));
         rect(7, -10, 30, 15);
       popMatrix();
       
       //right arm
       pushMatrix();
         rotate(radians(-30));
         rect(7, 10, 30, 15);
       popMatrix();      
       
     popMatrix();
     
   //gun
   pushMatrix();
     rectMode(CENTER);
     translate(x, y);
     rotate(atan2(mouseY - y, mouseX - x));
     fill(0);
     rect(25, 0, 30, 15);
   popMatrix();
  }

 
  void move() {
    //increases speed if sprinting
    if(moveKeys[4]){
      speed *= 3;
    }
    
    if(moveKeys[0] && canMove("up")){
        y -= speed;
    }
    if(moveKeys[1] && canMove("left")){
        x -= speed;
    }
    if(moveKeys[2] && canMove("down")){
        y += speed;
    }
    if(moveKeys[3] && canMove("right")){
        x += speed;
    }
    
    //resets speed modifiers (mainly to account for sprinting)
    speed = 3;
  }
    
  //tests if player is on the border of the screen, and if not, is allowed to move
  boolean canMove(String direction){
    switch(direction){
      case "up":
        if(this.getY() <= 0){
          game.lvlManager.changeLevels(direction);
          return false;
        }
        break;
      case "down":
        if(this.getY() >= height){
          game.lvlManager.changeLevels(direction);
          return false;
        }
        break;
      case "left":
        if(this.getX() <= 0){
          game.lvlManager.changeLevels(direction);
          return false;
        }
        break;
      case "right":
        if(this.getX() >= width){
          game.lvlManager.changeLevels(direction);
          return false;
        }
        break;
    }
    return true;
  }
 
  void setMovement(char k, int kc, boolean b) {
      switch (k) {
        //main movement keys
        case 'w': case 'W':
          moveKeys[0] = b;
          break;
        case 'a': case 'A':
          moveKeys[1] = b;
          break;
        case 's': case 'S':
          moveKeys[2] = b;
          break;
        case 'd': case 'D':
          moveKeys[3] = b;
          break;   
          
        //misc. keys
          //fire
        case ' ':
          if(b == false){
           fire();
          }
          break;
      }
      
      //handles keycodes
      switch (kc){
        case 0x10:
        moveKeys[4] = b;
        break;
    }
  }
  
  void fire(){
   Projectile bullet = new Projectile(x, y, mouseX, mouseY, 25, 25, (100), this);
   game.spawn(bullet);
 }
}

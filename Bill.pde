import java.lang.Math;

class Bill extends AbstractSprite {
  
  long wait = 1000; 
  long mark = 0; 
  
  Bill(int x, int y, int w, int h) {
    super(x, y, w, h, "assets/bill.png");
  }
  
  void changeSpeed(){
  }
  
  int getXSpeed(){
   return xspeed; 
  }
  
  int getYSpeed(){
   return yspeed; 
  }
  
  void setXSpeed(int xspeed){
    this.xspeed = xspeed; 
  }
  
  void setYSpeed(int yspeed){
    this.yspeed = yspeed; 
  }
  
  void move() {
    x += xspeed;
    y += yspeed;
    
    if(xspeed == 0){
     xspeed += 1; 
    }
    
    if(yspeed == 0){
     yspeed += 1; 
    }
    
    if(millis() - mark > wait) {
      mark = millis();
      
      if(this.x > game.player.x && xspeed > 0){
         xspeed *= -1; 
      } 
      if(this.x < game.player.x && xspeed < 0) {
       xspeed = abs(xspeed); 
      }
    
      if(this.y > game.player.y && yspeed > 0){
         yspeed *= -1; 
      } 
      if(this.y < game.player.y && yspeed < 0) {
       yspeed = abs(xspeed); 
      }
    }
    
    if(x > width || x < 0){
      xspeed *= -1;
    }
    if(y > height || y < 0){  
      yspeed *= -1;
    }
  }
  
 
  
 
}

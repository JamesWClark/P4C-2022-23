import java.lang.Math;

class Bob extends AbstractSprite {
  
  Bob(int x, int y, int w, int h) {
    super(x, y, w, h, "assets/ufo.png");
    changeSpeed();    
  }
  
  void changeSpeed(){
    xspeed = (int)random(1, 12)-6;
    yspeed = (int)random(1, 3); 
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
    
    if(x > width || x < 0){
      xspeed *= -1;
    }
    if(y > height || y < 0){  
      yspeed *= -1;
    }
  }
  
  @Override
  boolean collide(AbstractSprite other) {
    if(other instanceof Bob) {
      collision((Bob)other);
    }
    return super.collide(other);
  }
  
  void collision(Bob other){
    int finalXspeed = (abs(xspeed)+abs(other.getXSpeed()))/2;
    int finalYspeed = (abs(yspeed)+abs(other.getYSpeed()))/2;
  
    if(xspeed < 0 && other.getXSpeed() < 0){
      setXSpeed(-(finalXspeed));
      other.setXSpeed(-(finalXspeed));
    }
    else if(xspeed >0 && other.getXSpeed() > 0){
      setXSpeed(finalXspeed);
      other.setXSpeed(finalXspeed);
    }
    else if(xspeed < 0  && other.getXSpeed() > 0){
      setXSpeed(finalXspeed);
      other.setXSpeed(finalXspeed*-1);    
    }
    else if(xspeed > 0  && other.getXSpeed() < 0){
      setXSpeed(finalXspeed*-1);
      other.setXSpeed(finalXspeed);
    }
    else if(xspeed == 0 && other.getXSpeed() < 0){
      setXSpeed(-(finalXspeed));
      other.setXSpeed(finalXspeed);
    }
    else if(xspeed == 0 && other.getXSpeed() > 0){
      setXSpeed(finalXspeed);
      other.setXSpeed(-(finalXspeed));
    }
    else if(xspeed > 0 && other.getXSpeed() == 0){
      setXSpeed(-(finalXspeed));
      other.setXSpeed(finalXspeed);
    } 
    else {
      setXSpeed(finalXspeed);
      other.setXSpeed(-(finalXspeed));
    }
    
    
    if(yspeed < 0 && other.getYSpeed() < 0){
      setXSpeed(-(finalYspeed));
      other.setYSpeed(-(finalYspeed));
    }
    else if(yspeed >0 && other.getYSpeed() > 0){
      setYSpeed(finalYspeed);
      other.setYSpeed(finalYspeed);
    }
    else if(yspeed < 0  && other.getYSpeed() > 0){
      setYSpeed(finalYspeed);
      other.setYSpeed(finalYspeed*-1);    
    }
    else if(yspeed > 0  && other.getYSpeed() < 0){
      setYSpeed(finalYspeed*-1);
      other.setYSpeed(finalYspeed);
    }
    else if(yspeed == 0 && other.getYSpeed() < 0){
      setYSpeed(-(finalYspeed));
      other.setYSpeed(finalYspeed);
    }
    else if(yspeed == 0 && other.getYSpeed() > 0){
      setYSpeed(finalYspeed);
      other.setYSpeed(-(finalYspeed));
    }
    else if(xspeed > 0 && other.getYSpeed() == 0){
      setYSpeed(-(finalYspeed));
      other.setYSpeed(finalYspeed);
    } 
    else {
      setYSpeed(finalYspeed);
      other.setYSpeed(-(finalYspeed));
    }        
  } 
}

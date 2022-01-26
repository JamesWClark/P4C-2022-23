import java.lang.Math;

abstract class AbstractSprite implements Sprite {
  int x = 0, y = 0, w = 50, h = 50;
  int xspeed = 0, yspeed = 0;
  color col = color(255);
  
  int getX(){return x;}
  int getY(){return y;}
  int getW(){return w;}
  int getH(){return h;}
  
  AbstractSprite() { }
  AbstractSprite(int x, int y) {
    this.x = x;
    this.y = y;
  }
  AbstractSprite(int x, int y, int w, int h) {
    this(x, y);
    this.w = w;
    this.h = h;
  }
  
  AbstractSprite(int x, int y, int w, int h, color col) {
    this(x, y, w, h);
    this.col = col;
  }
  
  abstract void move();
  
  void render() {
    fill(col);
    ellipse(x, y, w, h);
  }
  
  boolean collide(Sprite spr){
    //check the x axis
    int dx = (spr.getX() - x);
    int dy = (spr.getY() - y);
    double distance = Math.sqrt(dx * dx + dy * dy);
    
    if(distance < (spr.getW()/2) + (w/2)){
      return true;
    }
   
    return false;
  }
}

import java.lang.Math;

abstract class AbstractSprite implements Sprite {
  int team = 1;
  int x = 0, y = 0, w = 50, h = 50;
  int xspeed = 0, yspeed = 0;
  color col = color(255);
  PImage sprite;
  
  int getX(){return x;}
  int getY(){return y;}
  int getW(){return w;}
  int getH(){return h;}
  PImage getImage(){return sprite;}
  
  AbstractSprite() { }
  AbstractSprite(int x, int y, String path) {
    this.x = x;
    this.y = y;
    sprite = loadImage(path);
    
  }
  AbstractSprite(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  AbstractSprite(int x, int y, int w, int h, String path) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    sprite = loadImage(path);
  }
  AbstractSprite(int x, int y, int w, int h, color col) {
    this(x, y, w, h);
    this.col = col;
  }
  
  abstract void move();
  
  void render() {
    image(sprite,x-(w/2),y-(h/2));
  }
  
  boolean collide(Sprite spr){
    // check the x axis
    // this is circle collision and that is cringe, I am epic and will make
    // hit boxes -R
    /*
    int dx = (spr.getX() - x);
    int dy = (spr.getY() - y);
    double distance = Math.sqrt(dx * dx + dy * dy);
    
    if(distance < (spr.getW()/2) + (w/2)){
      return true;
    }
    return false;
    */
    boolean sprInTL = (spr.getX()+spr.getW()/2 > x-w/2 && spr.getY()+spr.getH()/2 > y-h/2); 
    boolean sprInTR = (spr.getX()-spr.getW()/2 < x+w/2 && spr.getY()+spr.getH()/2 > y-h/2); 
    boolean sprInBL = (spr.getX()+spr.getW()/2 > x-w/2 && spr.getY()-spr.getH()/2 < y+h/2); 
    boolean sprInBR = (spr.getX()-spr.getW()/2 < x+w/2 && spr.getY()-spr.getH()/2 < y+h/2); 
    /* this will be pixel perfect eventually
    PImage sprImg = spr.getImage();
    sprImg.loadPixels();
    if(sprInTL && sprInTR && sprInBL && sprInBR){
      for(int i = 0; i < (sprImg.height * sprImg.width); i++){
       print(sprImg.pixels[i] + ", "); 
      }
      return true;
      
    }
    return false;
    */
    return sprInTL && sprInTR && sprInBL && sprInBR;
  }
}

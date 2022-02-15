abstract class AbstractSprite implements Sprite {
  int team = 1;
  int x = 0, y = 0, w, h;
  int xspeed = 0, yspeed = 0;
  color col = color(255);
  PImage sprite = loadImage("assets/ufo.png");  // default
  
  AbstractSprite() { }
  
  AbstractSprite(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  AbstractSprite(int x, int y, String path) {
    this(x, y);
    sprite = loadImage(path);
  }
  
  AbstractSprite(int x, int y, int w, int h) {
    this(x, y);
    this.w = w;
    this.h = h;
  }
  
  AbstractSprite(int x, int y, int w, int h, String path) {
    this(x, y, w, h);
    sprite = loadImage(path);
    sprite.resize(w, h);
  }
  
  AbstractSprite(int x, int y, int w, int h, color col) {
    this(x, y, w, h);
    this.col = col;
  }
  
  abstract void move();
  
  void render() {
    image(sprite,x,y);
  }
  
  void handleCollision(AbstractSprite other) {
    game.destroy(this);
  }
  
  boolean collide(AbstractSprite spr){
    boolean sprInTL = (spr.x + spr.w/2 > x-w/2 && spr.y + spr.h/2 > y-h/2); 
    boolean sprInTR = (spr.x - spr.w/2 < x+w/2 && spr.y + spr.h/2 > y-h/2); 
    boolean sprInBL = (spr.x + spr.w/2 > x-w/2 && spr.y - spr.h/2 < y+h/2); 
    boolean sprInBR = (spr.x - spr.w/2 < x+w/2 && spr.y - spr.h/2 < y+h/2); 
    return sprInTL && sprInTR && sprInBL && sprInBR;
  }
}

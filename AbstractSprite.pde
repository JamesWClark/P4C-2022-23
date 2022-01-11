abstract class AbstractSprite implements Sprite {
  int x = 0, y = 0, w = 50, h = 50;
  int xspeed = 0, yspeed = 0;
  color col = color(255);
  
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
    ellipse(x, y, 50, 50);
  }
}

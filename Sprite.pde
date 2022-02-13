interface Sprite {
  int getX();
  int getY();
  int getW();
  int getH();
  int getXSpeed();
  int getYSpeed();
  void setXSpeed(int xspeed);
  void setYSpeed(int yspeed);
  void collision(Sprite other);
  PImage getImage();
  void move();
  void render();
  boolean collide(Sprite spr);
}

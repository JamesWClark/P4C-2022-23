interface Sprite {
  int getX();
  int getY();
  int getW();
  int getH();
  void move();
  void render();
  boolean collide(Sprite spr);
}

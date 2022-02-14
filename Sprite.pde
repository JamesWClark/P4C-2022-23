interface Sprite {
  int getX();
  int getY();
  int getW();
  int getH();
  int getTeam(); 
  PImage getImage();
  void move();
  void render();
  boolean collide(Sprite spr);
}

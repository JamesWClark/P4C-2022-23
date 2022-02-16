class DungeonGate implements UIComponent {
  int x, y;
  PImage sprite;
  
  DungeonGate(int x, int y, String path) {
    this.x = x;
    this.y = y;
    sprite = loadImage(path);
  }

  void render(){
     image(sprite, x, y, 50, 50);
  }
}

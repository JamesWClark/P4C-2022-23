class Teleporter extends AbstractSprite {
  
  long wait = 5000;
  long mark = 0;
  
  Teleporter(int x, int y, int w, int h) {
    super(x, y, w, h);
    mark = millis() + wait;
  }

  void move() {
    // every 5 seconds
    if(millis() - mark > wait) {
      mark = millis();
      x = (int)(random(x + w, width-w));
      y = (int)(random(y + h, height-h));
    }
  }
  
  void render() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  
  void fire() {
    
  }
}

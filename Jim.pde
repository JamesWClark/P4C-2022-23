class Jim extends AbstractSprite{
  long wait = 1000; 
  long mark = 0; 
  
  Jim(int x, int y, int w, int h) {
    super(x, y, w, h, "assets/station.png");
    changeSpeed(); 
    mark = millis();
  }
  
  void changeSpeed() {
    xspeed = (int)random(1,12)-6;
    yspeed = (int)random(1,3);
  }
  
  void fire() {
    if(millis() - mark > wait) {
      mark = millis();
      Projectile bullet = new Projectile(x, y, game.player.x, game.player.y, 25, 25, color(100), this); 
      game.spawn(bullet);
    }
  }
  
  void move() {
    x += xspeed;
    y += yspeed; 
    fire();
    if(x > width || x < 0) {
      xspeed *= -1; 
    }
    if(y > height || y < 0) {
      yspeed *= -1; 
    }
  }
}

class Redneck extends AbstractSprite{
  long wait = 1000; 
  long mark = 0;
  
  Redneck(int x, int y, int w, int h) {
    super(x, y, w, h, "assets/cowboy.png");
    mark = millis();
    xspeed = 3;
    yspeed = 3;
  }
  
  void fire() {
    if(millis() - mark > wait) {
      mark = millis();
      Projectile bullet1 = new Projectile(x, y, game.player.x, game.player.y, 25, 25, color(100), this); 
      Projectile bullet2 = new Projectile(x, y, game.player.x+50, game.player.y+50, 25, 25, color(100), this);
      Projectile bullet3 = new Projectile(x, y, game.player.x-50, game.player.y-50, 25, 25, color(100), this);
      game.spawn(bullet1);
      game.spawn(bullet2);
      game.spawn(bullet3);
    }
  }
  
  void move(){
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

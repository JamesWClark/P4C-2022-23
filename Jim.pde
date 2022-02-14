class Jim extends AbstractSprite {
  Jim(int x, int y, int w, int h) {
    super(x, y, w, h, "assets/ufo.png");
    changeSpeed();
  }
  
  void changeSpeed(){
    xspeed = (int)random(1, 12)-6;
    yspeed = (int)random(1, 3); 
  }
  
  void fire(){
   Projectile bullet = new Projectile(x, y, game.player.getX(), game.player.getY(), 25, 25, (100), this);
   game.spawn(bullet);
 }
  
  void move() {
    x += xspeed;
    y += yspeed;
    
    if(x > width || x < 0){
      xspeed *= -1;
    }
    if(y > height || y < 0){  
      yspeed *= -1;
    }
  }
}

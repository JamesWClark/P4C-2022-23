class Zombie extends AbstractSprite{
  private int targetX, targetY;
  double rise, run, slope, degree, speed;
  Zombie(int x, int y, int w, int h){
    super(x,y,w,h,"assets/zombie.png");
    xspeed = 0;
    yspeed = 0;
    speed = 3;
  }
  
  void calculateTarget(){
   // I stole this from Projectile
   targetX = game.player.x;
   targetY = game.player.y;
   rise = (double)(targetY - y)/20;
   run = (double)(targetX - x)/20;
   degree = (speed / (Math.abs(rise) + Math.abs(run)));
  }
  
  void move(){
    calculateTarget();
    y += rise * degree;
    x += run * degree;
  }
}

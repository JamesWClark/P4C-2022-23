class Projectile extends AbstractSprite {
  
  int finalX, finalY, projectileSpeed = 30;
  double rise, run, slope, degree;
  double theta, vx, vy;
  

  public Projectile(int x, int y, int finalX, int finalY, int w, int h, color col, AbstractSprite owner) {
    super(x, y, w, h, col); 
    rise = finalY - y;
    run = finalX - x;
    this.finalX = finalX;
    this.finalY = finalY;
    rise = (double)(finalY - y)/20;
    run = (double)(finalX - x)/20;
    double speed = 25;
    degree = (speed / (Math.abs(rise) + Math.abs(run)));
    rise = (double)(finalY - y);
    run = (double)(finalX - x);
    degree = (speed / (Math.abs(rise) + Math.abs(run)));
    team = owner.team;
  }  
  
  void move() {
    y += rise * degree;
    x += run * degree;
    if((x > width) || (x < 0) || (y > height) || (y < 0)){
      game.destroy(this);
    }
  }
  
  void render() {
    fill(col);
    ellipse(x, y, w, h);
  }
}

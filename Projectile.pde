class Projectile extends AbstractSprite {
  boolean render = true;
  int finalX, finalY, projectileSpeed = 30;
  double rise, run, slope, degree;
  
  public Projectile(int x, int y, int finalX, int finalY, int w, int h, color col){
   super(x, y, w, h, col); 
   this.finalX = finalX;
   this.finalY = finalY;
   rise = (double)(finalY - y);
   run = (double)(finalX - x);
   
   degree = (10 / (Math.abs(rise) + Math.abs(run)));
   
  }
  
  void move(){
   y += rise * degree;
   x += run * degree;
   if((x > width) || (x < 0) || (y > height) || (y < 0)){
     render = false;
   }
  }
  
  void render(){
    if(render){
     ellipse(x, y, w, h);
    }
  }
}

class Projectile extends AbstractSprite {
  boolean render = true;
  int finalX, finalY, projectileSpeed = 30;
  double rise, run, slope;
  
  double theta, vx, vy;
  
  public Projectile(int x, int y, int finalX, int finalY, int w, int h, color col){
   super(x, y, w, h, col); 
   this.finalX = finalX; //mouseX at fire
   this.finalY = finalY; //mouseY at fire
   rise = finalY - y;
   run = finalX - x;
   
   /*
    slope = Math.abs(rise/run); //slope-rise-run == v-vy-vx, respectively;
    theta = Math.toDegrees(Math.atan(slope)); //inverse tangent of rise/run (vy/vx)
    System.out.println("Theta: " + theta);
    vx = Math.abs(slope*Math.toDegrees(Math.cos(theta)));
    vy = Math.abs(slope*Math.toDegrees(Math.sin(theta)));
    */
  }
  
  
  void move(){
   y += rise/20;
   x += run/20;
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

class Projectile extends AbstractSprite {
  boolean render = true;
  int finalX, finalY, projectileSpeed = 30;
  double rise, run, slope, degree;
  
  double theta, vx, vy;
  
  public Projectile(int x, int y, int finalX, int finalY, int w, int h, color col){
   super(x, y, w, h, col); 
<<<<<<< HEAD
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
=======
   this.finalX = finalX;
   this.finalY = finalY;
   rise = (double)(finalY - y)/20;
   run = (double)(finalX - x)/20;
   double speed = 1;
   degree = (speed / (Math.abs(rise) + Math.abs(run)));
   println(degree + " = " + speed + " / (" + Math.abs(rise) + " * " + Math.abs(run) + ")");
>>>>>>> 619edbdf8f53e7ae9957769c0cb48607eb1894c9
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

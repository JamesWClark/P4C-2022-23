class Projectile extends AbstractSprite {
  boolean render = true;
  int finalX, finalY, projectileSpeed = 30;
  double rise, run, slope, degree;
  
  double theta, vx, vy;
  
  
  int getXSpeed(){
   return xspeed; 
  }
  
  int getYSpeed(){
   return yspeed; 
  }
  
    void setXSpeed(int xspeed){
    this.xspeed = xspeed; 
  }
  
  void setYSpeed(int yspeed){
    this.yspeed = yspeed; 
  }
  
 void collision(Sprite other){
     
   }
  
  public Projectile(int x, int y, int finalX, int finalY, int w, int h, color col){
   super(x, y, w, h, col); 
   team = 0;
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
   this.finalX = finalX;
   this.finalY = finalY;
   rise = (double)(finalY - y)/20;
   run = (double)(finalX - x)/20;
   double speed = 25;
   degree = (speed / (Math.abs(rise) + Math.abs(run)));
   println(degree + " = " + speed + " / (" + Math.abs(rise) + " * " + Math.abs(run) + ")");
   rise = (double)(finalY - y);
   run = (double)(finalX - x);
   
   degree = (speed / (Math.abs(rise) + Math.abs(run)));
   
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

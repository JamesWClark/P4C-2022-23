class Projectile extends AbstractSprite {
  boolean render = true;
  int finalX, finalY, projectileSpeed = 30;
  double rise, run, slope;
  Sprite base; 
  
  public Projectile(int x, int y, int finalX, int finalY, int w, int h, color col, Sprite base){
   super(x, y, w, h, col); 
   this.finalX = finalX;
   this.finalY = finalY;
   rise = finalY - y;
   run = finalX - x;
   this.base = base; 
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
  
  @Override 
  boolean collide(Sprite spr){
    // check the x axis
    // this is circle collision and that is cringe, I am epic and will make
    // hit boxes -R
    /*
    int dx = (spr.getX() - x);
    int dy = (spr.getY() - y);
    double distance = Math.sqrt(dx * dx + dy * dy);
    
    if(distance < (spr.getW()/2) + (w/2)){
      return true;
    }
    return false;
    */
    boolean sprInTL = (spr.getX()+spr.getW()/2 > x-w/2 && spr.getY()+spr.getH()/2 > y-h/2); 
    boolean sprInTR = (spr.getX()-spr.getW()/2 < x+w/2 && spr.getY()+spr.getH()/2 > y-h/2); 
    boolean sprInBL = (spr.getX()+spr.getW()/2 > x-w/2 && spr.getY()-spr.getH()/2 < y+h/2); 
    boolean sprInBR = (spr.getX()-spr.getW()/2 < x+w/2 && spr.getY()-spr.getH()/2 < y+h/2); 
    /* this will be pixel perfect eventually
    PImage sprImg = spr.getImage();
    sprImg.loadPixels();
    if(sprInTL && sprInTR && sprInBL && sprInBR){
      for(int i = 0; i < (sprImg.height * sprImg.width); i++){
       print(sprImg.pixels[i] + ", "); 
      }
      return true;
      
    }
    return false;
    */
   
    if (spr.getTeam() == base.getTeam()) {
      return false; 
    }
    return sprInTL && sprInTR && sprInBL && sprInBR;
  }
  
  
  
}

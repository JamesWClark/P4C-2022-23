class Projectile extends AbstractSprite{
  
  public Projectile(int x, int y){
    super(x, y, 20, 20, color(#227c9d));
  }
  
  void move(){
    y -= 10;
  }
}

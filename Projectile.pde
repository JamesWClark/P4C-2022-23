class Projectile extends AbstractSprite{
  
  public Projectile(int x, int y){
    super(x, y, 5, 5, "assets/laser.png");
  }
  
  void move(){
    y -= 10;
  }
}

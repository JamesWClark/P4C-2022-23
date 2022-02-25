class Drops extends AbstractSprite{

  Drops(){
    //spawns at random position
    super((int)(Math.random()*width), (int)(Math.random()*height), 100, 100, "assets/ChugJug.png");
  }
  
  
  void move(){
  }
}

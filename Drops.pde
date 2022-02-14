class Drops extends AbstractSprite{
  boolean pickUp;
  
  Drops(boolean healthBox, boolean ammoBox){
    //spawns at random position
    super((int)Math.random()*width, (int)Math.random()*height, 50, 50);
    
    //determines what type "loot" will be dropped
    if(healthBox){
      render(0);
    }else if(ammoBox){
      render(1);
    }   
  }
  
  void render(int num){
    rectMode(CENTER);
    switch(num){
      //healthBox
      case 0:
        rect(x, y, w, h, 28);
        rect(x, y, w*2/3, h/4);
        rect(x, y, w/4, h*2/3);
        break;
      //ammoBox
      case 1:
        break;
    }
  }
  
  void move(){
  }
}

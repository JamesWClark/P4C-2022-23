class Bob extends AbstractSprite {
  Bob(int x, int y, int w, int h) {
    super(x, y, w, h, color(#fe6d73));
    changeSpeed();
  }
  
  void changeSpeed(){
    xspeed = (int)random(1, 12)-6;
    yspeed = (int)random(1, 3); 
  }
  
  void move() {
    x += xspeed;
    y += yspeed;
    
    if(x > width || x < 0){
      xspeed *= -1;
    }
    if(y > height || y < 0){  
      yspeed *= -1;
    }
  }
}

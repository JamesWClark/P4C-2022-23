class ArmorBoi extends AbstractSprite{
  int xspeed = 2, yspeed = 2;
  
  public ArmorBoi(int x, int y){
    super(x, y, 125, 125);
    hp = 10;
  }
  
  void render() {
    stroke(0);
    strokeWeight(hp);
    rect(x, y, w, h);
    noStroke();
  }
  
  void move(){
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

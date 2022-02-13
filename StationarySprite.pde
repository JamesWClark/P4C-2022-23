class StationarySprite extends AbstractSprite {
  StationarySprite(int x, int y, String path){
    super(x, y, path);
  }
  StationarySprite(int x, int y, color col){
    
  }
  
  void collision(Sprite other){
     
   }
  
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
  
  
  void move(){
    
  }
  
  void render(){
     image(sprite, x, y, 50, 50);
  }
}

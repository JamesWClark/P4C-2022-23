class StationarySprite extends AbstractSprite {
  StationarySprite(int x, int y, String path){
    super(x, y, path);
  }
  StationarySprite(int x, int y, color col){
    
  }
  
  void move(){
    
  }
  
  void render(){
     image(sprite, x, y, 50, 50);
  }
}

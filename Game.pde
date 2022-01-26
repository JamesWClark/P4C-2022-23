import java.util.*;

class Game {
  
  ArrayList<Sprite> sprites = new ArrayList<>();
  Player player;
  
  
  
  void config() {
    noStroke();
  }
  
  void spawn(Sprite sprite){
    sprites.add(sprite);
  }
  
  void load() {
    config();
    player = new Player(width/2, height-100, 50, 50, color(#17c3b2));
    sprites.add(player); 
    for(int x = 150; x <= 750; x += 60){
      spawn(new Bob(x-25, 100, 50, 50));
    }
  }
  
  void play() {
    println(sprites.size());
    background(#fef9ef);
  }
  
  void killEnemies(){
    int i = 0;
    while(i < sprites.size()) {
      if(sprites.get(i) instanceof Projectile){
        for(int j = 0; j < game.sprites.size(); j++){
          if(sprites.get(j) instanceof Bob && sprites.get(i).collide(sprites.get(j))){
            if(j > i){ 
              sprites.remove(j);
              sprites.remove(i);
            }else{
              sprites.remove(i);
              sprites.remove(j);
            }
            i--;
            break;
          }
          if(j == sprites.size()-1){
            sprites.get(i).move();
            sprites.get(i).render();
            i++;
          }
        }
      }else{
        sprites.get(i).move();
        sprites.get(i).render();
        i++;
      }
    }
}

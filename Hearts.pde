class Hearts implements UIComponent{
  int heartsLeft;
  
  Hearts(int lives){
    this.heartsLeft = lives;
  }
  
  void loseHeart(){
    heartsLeft--;
    if(heartsLeft <= 0){
       game.pendDelete(game.player);
       game.ammo.canShoot = false; 
    }
  }
  
  void render(){
    for(int i = 0; i < heartsLeft;i++){
      fill(#fe6d73);
      ellipse(18 + (30 * i), 582, 25, 25);
    }
  }
}

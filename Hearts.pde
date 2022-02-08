class Hearts implements UIComponent{
  int heartsLeft;
  PImage sprite;
  
  Hearts(int lives){
    this.heartsLeft = lives;
    sprite = loadImage("assets/heart.png");
    sprite.resize(25, 25);
  }
  
  void loseHeart(){
    heartsLeft--;
    //Addes a delete request eachtime loseHearts is called
    game.pendDeleteUI(game.hearts);
    game.deleteUI();
    if(heartsLeft <= 0){
       game.pendDelete(game.player);
       game.ammo.canShoot = false; 
    }
  }
  
  void render(){
    for(int i = 0; i < heartsLeft;i++){
      image(sprite, 6 + (30 * i),582 - 12);
    }
  }
}

class Hearts implements UIComponent{
  int heartsLeft;
  PImage sprite;
  
  Hearts(int lives){
    this.heartsLeft = lives;
    sprite = loadImage("assets/heart.png");
    sprite.resize(50, 50);
  }
  
  void loseHeart(){
    heartsLeft--;
    //Addes a delete request eachtime loseHearts is called
    game.ui.pendDeleteUI(game.player.hearts);
    // game.ui.deleteUI();
    if(heartsLeft <= 0){
       game.sprites.pendDelete(game.player);
       game.player.ammo.canShoot = false; 
       game.load();
    }
  }
  
  void render(){
    for(int i = 0; i < heartsLeft;i++){
      //Always moves to bottom of screen
      image(sprite, 24 + (60 * i), height - 60);
    }
  }
}

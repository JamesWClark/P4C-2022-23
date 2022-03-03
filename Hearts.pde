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
    //deletes all hearts from hud
    game.ui.pendDeleteUI(game.player.hearts);
    //adds new amount of hearts to hud
    game.ui.activate(this);
    // game.ui.deleteUI();
    if(heartsLeft <= 0){
       game.sprites.pendDelete(game.player);
       game.player.ammo.canShoot = false; 
    PFont font = createFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf", 50);
       push();
    fill(0,0,0);
    textAlign(CENTER);
    textFont(font);
    text("Press R to restart", width/2, height/2 + 80); 
    pop();
    }
  }

  void gainHeart(){
    heartsLeft++;
    //deletes all hearts from hud then re-adds them with the new amount
    game.ui.pendDeleteUI(game.player.hearts);
    game.ui.activate(this);
  }
  
  void render(){
    for(int i = 0; i < heartsLeft;i++){
      //Always moves to bottom of screen
      image(sprite, 24 + (60 * i), height - 60);
    }
  }
}

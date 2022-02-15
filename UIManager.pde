class UIManager {
  ArrayList<UIComponent> hud = new ArrayList<UIComponent>();
  ArrayList<UIComponent> inactive = new ArrayList<UIComponent>();
  
  void activate(UIComponent component) {
    hud.add(component);
  }
  
  //creates a pendDelete for the UI components
  void pendDeleteUI(UIComponent c){
    inactive.add(c);
  }  

  //allows the UI to be deleted
  void clearInactiveComponents(){
    for(UIComponent c: inactive){
      hud.remove(c);
    }
    inactive.clear();
  }
  
  void manage() {
    for(UIComponent c: hud){
      c.render();
    } 
    clearInactiveComponents();
  }
  
  //checks if game has been paused from keypress
  void checkPause(char c){
    if ( c == 'p' ) {
      game.paused = !game.paused;
      if (game.paused) {
        noLoop();
        this.pauseMenu(true);
      } else {
        loop();
        this.pauseMenu(false);
      }
    }
  }

  //creates pause menu if whenever checkPause() is true
  void pauseMenu(boolean p){
    if(p){
      fill(225, 0, 0);
      textAlign(CENTER);
      fill(0, 0, 225);
      textSize(100);
      text("Game Paused", width/2, height/5);
      textSize(30);
      text("Shots Fired: " + Stats.shotsFired, width/5, height/3);
      text("Enemies Killed: " + Stats.enemiesKilled, 4*width/5, height/3);
    }
  }
}

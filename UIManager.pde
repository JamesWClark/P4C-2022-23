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
}

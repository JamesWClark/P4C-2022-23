class UIManager {
  ArrayList<UIComponent> hud = new ArrayList<UIComponent>();
  ArrayList<UIComponent> deleteQueueUI = new ArrayList<UIComponent>();
  
  //creates a pendDelete for the UI components
  void pendDeleteUI(UIComponent c){
    deleteQueueUI.add(c);
  }  

  //allows the UI to be deleted
  void deleteUI(){
    for(UIComponent c: deleteQueueUI){
      hud.remove(c);
    }
    deleteQueueUI.clear();
  }
  
  void manage() {
    for(UIComponent c: hud){
      c.render();
    } 
    deleteUI();
  }
}

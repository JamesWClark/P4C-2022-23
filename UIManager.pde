class UIManager {
  ArrayList<UIComponent> ui = new ArrayList<UIComponent>();
  ArrayList<UIComponent> deleteQueueUI = new ArrayList<UIComponent>();
  
  //creates a pendDelete for the UI components
  void pendDeleteUI(UIComponent c){
    deleteQueueUI.add(c);
  }  

  //allows the UI to be deleted
  void deleteUI(){
    for(UIComponent c: deleteQueueUI){
      ui.remove(c);
    }
    deleteQueueUI.clear();
  }
  
  void manage() {
    for(UIComponent c: ui){
      c.render();
    } 
    deleteUI();
  }
}

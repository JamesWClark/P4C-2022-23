class Weapon implements UIComponent{
  int maxAmmo;
  int magSize;
  int bulletDamage;
  int ammoCount;
  int loadedAmmo;
  boolean selected;
  //player.inventory.loop through whole aresenal if (selected), run reload 
  
  
  Weapon(int maxAmmo, int bulletDamage, int ammoCount, int magSize){
    this.maxAmmo = maxAmmo;
    this.bulletDamage = bulletDamage;
    this.ammoCount = ammoCount; 
    this.magSize = magSize; 
    this.loadedAmmo = magSize; 
    this.ammoCount = ammoCount - loadedAmmo;
    selected = false;
  }
  
  void reload(){
    if(ammoCount > 0) {
        while((loadedAmmo < magSize) && (ammoCount > 0)) {
          loadedAmmo++; 
          ammoCount--;
      }
    }
  }
  
  boolean getSelected(){
    return selected;
  }
  
  void setSelected(boolean selected){
    this.selected = selected;
  }
  
  void render() {
  }
}

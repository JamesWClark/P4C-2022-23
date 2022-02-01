class Ammo implements UIComponent{
  int ammoLeft;
  boolean canShoot = true; 
  
  
  Ammo(int ammo){
    this.ammoLeft = ammo;
  }
  
  
  boolean canShoot() {
    return canShoot; 
  }
  
  void loseAmmo(){
    ammoLeft--;
    if(ammoLeft <= 0){
      canShoot = false; 
    }
  }
  
  void render(){
    for(int i = 0; i < ammoLeft;i++){
      fill(#000000);
      ellipse(25,20+(25*i), 25, 25);
    }
  }
}

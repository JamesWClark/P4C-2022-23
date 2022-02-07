class Ammo implements UIComponent{
  int ammoLeft;
  boolean canShoot = true; 
  
  
  Ammo(int ammo){
    this.ammoLeft = ammo;
  }
  
  void addAmmo(int a) {
    ammoLeft += a; 
    if(ammoLeft >= 10) {
      ammoLeft = 10; 
    }

    if(ammoLeft > 0){
      canShoot = true;
    }
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
      //ellipse(25,20+(25*i), 25, 25);
      rect(25, 20+(25*i), 25, 25);
    }
  }
}

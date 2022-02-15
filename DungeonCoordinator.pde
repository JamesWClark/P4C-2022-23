class DungeonCoordinator {

  int playerLevelX = 0, 
      playerLevelY = 0;
  
  int symbolIndexList[] = new int[4];
  ArrayList<DungeonRoom> lvls = new ArrayList<DungeonRoom>();
  
  DungeonRoom currentLvl;
  DungeonRoom adjacentLvls[] = new DungeonRoom[4];

  DungeonCoordinator() {
    currentLvl = new DungeonRoom(0, 0);
    currentLvl.unlocked = true;
    lvls.add(currentLvl);
  }
  
  void coordinate() {
    currentLvl.decorateLvl();
  }
  
  void levelLoad(){
    this.addSymbols();    
    
    //spawns in enemies based on currentlevel enemy count 
    for(int i = 0; i < this.currentLvl.enems.length; i++){
      game.spawn(currentLvl.enems[i]);
    } 
  }

  void changeLevels(String direction) {
    //allows the player to move to a new level if they've killed every enemy in the current level
    if(currentLvl.enemsKilled >= currentLvl.enems.length){
      currentLvl.unlocked = true;
    }
   
    //executes meat of the method if player is able to switch levels 
    if(!currentLvl.unlocked){
      switch(direction){
        case "up":     if(adjacentLvls[0] == null) return;
        case "down":   if(adjacentLvls[1] == null) return;
        case "left":   if(adjacentLvls[2] == null) return;
        case "right":  if(adjacentLvls[3] == null) return;
      }
    }
    
    //moves levels
    switch(direction) {
      case  "up":   playerLevelY++; break;
      case "down":  playerLevelY--; break;
      case "left":  playerLevelX--; break;
      case "right": playerLevelX++; break;
    }

    //queues up next lvl
    int originalIndex = 0;
    boolean hasBeenMade = false;
    for(int i = 0; i < lvls.size(); i++){
      if(lvls.get(i).lvlX == playerLevelX && lvls.get(i).lvlY == playerLevelY){
        hasBeenMade = true;
        originalIndex = i;
      }
    }
    
    if(hasBeenMade){
      currentLvl = lvls.get(originalIndex);
      currentLvl.updateLvl();
      game.sprites.registerObserver(currentLvl);
    } else{
      game.sprites.deregisterObserver(currentLvl);
      currentLvl = new DungeonRoom(playerLevelX, playerLevelY);
      lvls.add(currentLvl);
      game.sprites.registerObserver(currentLvl);
    }
      
    // store previous location of player
    int playerX = game.player.x;
    int playerY = game.player.y;
    
    //load new level
    levelLoad();
      
    //change location of player to "transition" between levels
    switch(direction){
      case "up":
        game.player.y = height;
        game.player.x = playerX;
        break;
      case "down":
        game.player.y = 0;
        game.player.x = playerX;
        break;
      case "left":
        game.player.x = width;
        game.player.y = playerY;
        break;
      case "right":
        game.player.x = 0;
        game.player.y = playerY;
        break;
    }
  } 
  
  // place all adjacent levels into an array 
  void setAdjacent(){
    Arrays.fill(adjacentLvls, null);
    for(int i = 0; i < lvls.size(); i++){
      // check above level
      if(lvls.get(i).lvlX == currentLvl.lvlX && lvls.get(i).lvlY == currentLvl.lvlY + 1){
        adjacentLvls[0] = lvls.get(i);
      }
      // check below level
      if(lvls.get(i).lvlX == currentLvl.lvlX && lvls.get(i).lvlY == currentLvl.lvlY - 1){
        adjacentLvls[1] = lvls.get(i);
      }
      // check left level
      if(lvls.get(i).lvlX == currentLvl.lvlX - 1 && lvls.get(i).lvlY == currentLvl.lvlY){
        adjacentLvls[2] = lvls.get(i);
      }
      // check right level
      if(lvls.get(i).lvlX == currentLvl.lvlX + 1 && lvls.get(i).lvlY == currentLvl.lvlY){
        adjacentLvls[3] = lvls.get(i);
      }
    }
  }
  
  // place visual queues showing which levels are cleared/accessible
  void addSymbols(){
    setAdjacent();
    //place a symbol based on the status of adjacent rooms 
    for(int i = 0; i < adjacentLvls.length; i++){
      if(currentLvl.unlocked){
        if(adjacentLvls[i] == null || !(adjacentLvls[i].unlocked)){
          spawnSymbols(i, "danger");
        } else {
          spawnSymbols(i, "unlocked");
        }
      } else {
        if(adjacentLvls[i] == null || !(adjacentLvls[i].unlocked)){
          spawnSymbols(i, "locked");
        } else {
          spawnSymbols(i, "unlocked");
        }
      }
    }
  }
  
  void updateSymbols(){
    for(int i = 0; i < symbolIndexList.length; i++){
      if(adjacentLvls[i] == null || !(adjacentLvls[i].unlocked)){
        spawnSymbols(i, "danger");
      } else {
        spawnSymbols(i, "unlocked");
      }
    }
  }
  
  //method to assist addSymbols
  void spawnSymbols(int i, String name){
    switch(i){
      case 0: game.hud(new DungeonGate(width/2 - 25, 15, "assets/" + name + ".png")); break;
      case 1: game.hud(new DungeonGate(width/2 - 25, height - 65, "assets/" + name + ".png")); break;
      case 2: game.hud(new DungeonGate(15, height/2, "assets/" + name + ".png")); break;
      case 3: game.hud(new DungeonGate(width - 65, height/2, "assets/" + name + ".png")); break;
    }
  }
}

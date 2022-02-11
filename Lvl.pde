class Lvl {
  int seed = 0, lvlX, lvlY, enemsKilled = 0;
  boolean unlocked = false;
  color col = color(0, 250, 0);
  PFont difficultyIndicator; //loadFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf");
  
  Bob enems[] = new Bob[0];
  Sprite obs[] = new Sprite[0];
  
   Lvl(int lvlX, int lvlY){
    this.lvlX = lvlX;
    this.lvlY = lvlY;
    
    //sets seed based off level distance from origin, seed determines level difficulty
    this.seed = ((int) sqrt((pow(lvlX, 2)) + pow(lvlY, 2)));
    
    //sets color based off seed to indicate level position and difficulty
    this.col = color(abs(seed * 20), 250 - abs(seed * 20), 0);
    
    updateLvl();
  }
  
  void updateLvl(){
    //initializes level enemies based off seed 5
    
    //something breaks with "Array index out of bound: -1" I cannot replicate it consistently
    //I'm guessing enemsKilled can be more than seed and break it
    println("Seed: " + seed + " enemsKilled: :" + enemsKilled);
    enems = new Bob[seed - enemsKilled];
    for(int i = 0; i < enems.length; i++){
      Bob bob = new Bob((int)(Math.random() * width), (int)(Math.random() * height), 100, 100);
      enems[i] = bob;
    }
  }
  
  void iterateEnems(int iterate){
    enemsKilled += iterate;
    if(enemsKilled == enems.length){
      game.lvlManager.updateSymbols();
    }
  }
  
  void decorateLvl(){
    //sets level decorations
    push();
    fill(col);
    
      //text deco
    textAlign(CENTER);
    difficultyIndicator = createFont("assets/futurefont/MADE Future X Bold PERSONAL USE.otf", 160);
    textFont(difficultyIndicator);
    text(seed, width/2, height/2 + 80); 
    
      //sci-fi rect deco
    // this is cool, except probably dont want to draw the background, leave it up to an image -R
    /*
    rectMode(CENTER);
    for(int i = 1; i <= 10; i++){
      if(i <= 5){
        pushMatrix();
        translate(0, (height - (height * i/5)) + height/5/2);
        rotate(45);
        rect(0, 0, 50, 100); //height - (height * (i/4)), 0, 50, 100);
        popMatrix();
      } else if(i <= 10){
        pushMatrix();
        translate(width, (height - (height * (i-5)/5)) + height/5/2);
        rotate(45);
        rect(0, 0, 50, 100); //height - (height * (i/4)), 0, 50, 100);
        popMatrix();
      }
    }
    */
    pop();
  }
}

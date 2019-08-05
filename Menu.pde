class Menu{
  Map menuMap;
  Snake menuSnake;
  Cherry menuCherry;
  Game menuGame;
  Button startButton;
  int col, row;
  
  Menu(){
    menuGame = new Game(0, 0, int(width/tileSize), int(height/tileSize), false);;    startButton = new Button(width/2, height/2, 200, 60, "START");
  }
  
  void display(){
    // Background ---
    menuGame.display(true);
    noStroke();
    fill(150, 80);
    rect(0, 0, width, height);
    
    // Foreground ---
    //Title
    fill(0, 200);
    rect(width/2-300, height/2 - 300, 600, 100);
    textAlign(CENTER, CENTER);
    textFont(veryBigFont);
    fill(255);
    text("Snake Clone", width/2, height/2 - 250);
    
    //Button
    if(startButton.mouseInside()){
      startButton.setColor(6, color(20, 20, 80), color(50, 150, 250), color(20, 20, 80));
    }else{
      startButton.setColor(6, color(20, 20, 80), color(50, 100, 200), color(20, 20, 80));
    }
    startButton.display();
    
    //Controls
    textAlign(CENTER, CENTER);
    textFont(mediumFont);
    fill(5);
    text("Controls:", width/2, height/2 + 100);
    text("W + A + S + D", width/2, height/2 + 140);
    fill(255);
    text("Controls:", width/2-2, height/2 + 100-2);
    text("W + A + S + D", width/2-2, height/2 + 140-2);
    
    fill(5);
    text("Pause: P", width/2, height/2 + 200);
    fill(255);
    text("Pause: P", width/2-2, height/2 + 200-2);
    fill(5);
    text("Menu:  M", width/2, height/2 + 240);
    fill(255);
    text("Menu:  M", width/2-2, height/2 + 240-2);
  }
  
  void updateBackground(){ menuGame.update(true); }
}

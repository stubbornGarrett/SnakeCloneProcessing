class GUI{
  PVector position;
  
  GUI(float x, float y){
    position = new PVector(x, y);
  }
  
  void displayScore(int score, int mult){
    textAlign(LEFT, CENTER);
    textFont(smallFont);
    fill(50,250, 50);
    text("Score:", position.x, position.y);
    textAlign(LEFT, CENTER);
    text(score*mult, position.x+90, position.y);
  }
  
  void displayGameOver(float x, float y){
    noStroke();
    fill(150, 80);
    rect(x, y, game.col*tileSize, game.row*tileSize);
    fill(150, 150, 250);
    stroke(100, 100, 200);
    rect(x + game.col/2*tileSize-245, y + game.row/2*tileSize-30, 480, 70);
    textAlign(CENTER, CENTER);
    textFont(veryBigFont);
    fill(0);
    text("GAME OVER", x + game.col/2*tileSize-2, y + game.row/2*tileSize-2);
    fill(255, 50, 50);
    text("GAME OVER", x + game.col/2*tileSize, y + game.row/2*tileSize);
    
    fill(0);
    noStroke();
    rect(x + game.col/2*tileSize-245, y + game.row/2*tileSize+60, 480, 50);
    fill(255);
    textFont(mediumFont);
    text("Press 'R' to restart!", x + game.col/2*tileSize, y + game.row/2*tileSize+85);
  }
}

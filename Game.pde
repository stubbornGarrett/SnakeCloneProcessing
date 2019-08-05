class Game{
  Snake snake;
  Map map;
  Cherry cherry;
  GUI gui;
  PVector position;
  boolean guiActive, gameOver, pickedCherry;
  float gameSpeed;
  int cherryCount =  0;
  int cherryValue = 10;
  int col, row;
  float lastTime = millis();
  
  Game(float x, float y, int c, int r, boolean guiAct){
    col = c;
    row = r;
    position = new PVector(x, y);
    guiActive = guiAct;
    gameOver = false;
    gameSpeed = 200;
    gui    = new GUI(350, 20);
    map    = new Map(position.x, position.y, col, row, tileSize);
    snake  = new Snake(int(col/2)*tileSize, int(row/2)*tileSize, tileSize, tileSize);
    snake.pieces.get(0).snakeColor = color(150,250, 50);
    cherry = createCherry();
  }
  
  boolean update(boolean bot){
    if(snake.isAlive){
      if(!cherry.isAlive){
        pickedCherry = true;
        cherryCount++;
        cherry = createCherry();
        while(snake.isSnake(cherry.position.x, cherry.position.y)){
          cherry = createCherry();
        }
      }
      
      if(millis() - lastTime > gameSpeed){
        if(bot){ snake.updateBot(cherry); }
        snake.moveForward();
        lastTime = millis();
        directionUpdated = false;
      }
        
      snake.checkHead(map, cherry);
      
      if(pickedCherry){ updateGameSpeed(); }
      return true;
    }else{
      gameOver = true;
      return false;
    }
  }

  void display(boolean bot){
    map.display();
    snake.display();
    if(cherry.isAlive){ cherry.display(); }
    if(guiActive){ gui.displayScore(cherryCount, cherryValue); }
    if(gameOver && !bot){  gui.displayGameOver(position.x, position.y); }
  }
  
  void pause(){
    display(false);
    noStroke();
    fill(10, 200);
    rect(position.x, position.y, col*tileSize, row*tileSize);
    textAlign(CENTER, CENTER);
    textFont(veryBigFont);
    fill(255);
    text("PAUSE", col*tileSize/2, row*tileSize/2);
  }
  
  void updateGameSpeed(){
    if(cherryCount%5 == 0 && gameSpeed > 50){ 
      gameSpeed -= 25;
      pickedCherry = false;
    }
  }
  
  Cherry createCherry(){
    cherry = new Cherry(position.x+int(random(col))*tileSize, position.y+int(random(row))*tileSize, tileSize);
    while(snake.isSnake(cherry.position.x, cherry.position.y)){
      cherry = new Cherry(position.x+int(random(col))*tileSize, position.y+int(random(row))*tileSize, tileSize);
    }
    return cherry;
  }
}

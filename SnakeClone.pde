// Objects
Game game;
Menu menu;

// Settings
float tileSize  = 20;

// Variables
boolean directionUpdated = false;
enum GameState{
  MENU, START, PLAY, GAMEOVER, PAUSE
}
GameState activeState;

// Fonts
PFont smallFont, mediumFont, bigFont, veryBigFont;

void setup(){
  smallFont   = createFont("Lucida Console", 24);
  mediumFont  = createFont("Lucida Console", 32);
  bigFont     = createFont("Lucida Console", 42);
  veryBigFont = createFont("Lucida Console", 84);
  size(900, 900);
  menu = new Menu();
  
  activeState = GameState.MENU;
}

void draw(){
  background(50, 50, 200);
  switch(activeState){
    case MENU:
      menu.display();
      menu.updateBackground();
      break;
    case START:
      game = new Game(0, 40, int(width/tileSize), int((height-40)/tileSize), true);
      activeState = GameState.PLAY;
      break;
    case PLAY:
      game.display(false);
      if(!game.update(false)){ activeState = GameState.GAMEOVER; }
      break;
    case GAMEOVER:
      game.display(false);
      break;
    case PAUSE:
      game.pause();
    default:
      break;
  }
}

void keyPressed(){
  if(activeState == GameState.PLAY){
    if(game.snake.isAlive && !directionUpdated){
      switch(key){
        case 'w':
          if(!game.snake.down && !game.snake.up){    game.snake.switchDirection(0); }
          directionUpdated = true;
          break;
        case 's':
          if(!game.snake.up && !game.snake.down){    game.snake.switchDirection(2); }
          directionUpdated = true;
          break;
        case 'd':
          if(!game.snake.left && !game.snake.right){ game.snake.switchDirection(1); }
          directionUpdated = true;
          break;
        case 'a':
          if(!game.snake.right && !game.snake.left){ game.snake.switchDirection(3); }
          directionUpdated = true;
          break;
        case 'p':
          activeState = GameState.PAUSE;
          break;
        default:
          break;
      }
    }
  }else if(activeState == GameState.PAUSE){
    switch(key){
      case 'p':
        activeState = GameState.PLAY;
        break;
    }
  }else if(activeState == GameState.GAMEOVER){
    switch(key){
      case 'r':
        activeState = GameState.START;
        break;
    }
  }else if(activeState == GameState.MENU){
    switch(key){
      case ENTER:
        activeState = GameState.START;
        break;
    }
  }
  switch(key){
      case 'm':
        activeState = GameState.MENU;
        break;
  }
}

void mouseClicked(){
  switch(activeState){
    case MENU:
      if(menu.startButton.mouseInside()){ activeState = GameState.START; }
      break;
    case START:
      break;
    case PLAY:
      break;
    case GAMEOVER:
      break;
    case PAUSE:
      break;
    default:
      break;
  }
}

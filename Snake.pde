class Snake{
  ArrayList<SnakePiece> pieces;
  float size, speed;
  boolean up, right, down, left, isAlive, isHead;
  
 Snake(float x, float y, float si, float sp){
   pieces = new ArrayList<SnakePiece>();
   size  = si;
   speed = sp;
   up    = true;
   right = false;
   down  = false;
   left  = false;
   isAlive = true;
   for (int i = 0; i < 10; i++){
     SnakePiece tempPiece = new SnakePiece(size);
     pieces.add(tempPiece);
     pieces.get(i).setPosition(x, y + i* size);
   }
 }
 
 void display(){ for (SnakePiece p : pieces){ p.display(); } }
 
 void moveUp(){
   switchDirection(0);
   pushPieces();
   pieces.get(0).move(0, -speed);
 }
 
 void moveDown(){
   switchDirection(2);
   pushPieces();
   pieces.get(0).move(0, speed);
 }
 
 void moveRight(){
   switchDirection(1);
   pushPieces();
   pieces.get(0).move(speed, 0);
 }
 
 void moveLeft(){
   switchDirection(3);
   pushPieces();
   pieces.get(0).move(-speed, 0);
 }
 
 void moveForward(){
    if(up){
      moveUp();
    }else if(right){
      moveRight();
    }else if(down){
      moveDown();
    }else if(left){
      moveLeft();
    }
 }
 
 void pushPieces(){
   float tempX1;
   float tempY1;
   float tempX2 = pieces.get(0).position.x;
   float tempY2 = pieces.get(0).position.y;
   for (int i = 1; i < pieces.size(); i++){
     tempX1 = pieces.get(i).position.x;
     tempY1 = pieces.get(i).position.y;
     pieces.get(i).setPosition(tempX2, tempY2); 
     tempX2 = tempX1;
     tempY2 = tempY1;
   } 
 }
 
 void switchDirection(int direction){
   switch(direction){
     case 0:
       up    = true;
       right = false;
       down  = false;
       left  = false;
       break;
     case 1:
       up    = false;
       right = true;
       down  = false;
       left  = false;
       break;
     case 2:
       up    = false;
       right = false;
       down  = true;
       left  = false;
       break;
     case 3:
       up    = false;
       right = false;
       down  = false;
       left  = true;
       break;
     default:
       println("Invalid direction! - Snake class");
   }
 }
 
 void addPiece(){
   SnakePiece tempPiece = new SnakePiece(size);
   float tempX = pieces.get(pieces.size()-1).position.x+(pieces.get(pieces.size()-1).position.x - pieces.get(pieces.size()-1).position.x);
   float tempY = pieces.get(pieces.size()-1).position.y+(pieces.get(pieces.size()-1).position.y - pieces.get(pieces.size()-1).position.y);
   tempPiece.setPosition(tempX, tempY);
   pieces.add(tempPiece);
 }
 
 void checkHead(Map m, Cherry c){
   SnakePiece head = pieces.get(0);
   
   // Port head on other side of map, if crossing border
   if(head.position.x < m.position.x){
     head.position.x = m.position.x + (m.columns * m.size) - m.size;
   }else if(head.position.x >= m.columns * m.size){
     head.position.x = m.position.x;
   }else if(head.position.y < m.position.y){
     head.position.y = m.position.y + (m.rows * m.size) - m.size;
   }else if(head.position.y >= m.position.y + m.rows * m.size){
     head.position.y = m.position.y;
   }
   
   // Kill snake, if head hits body
   for(int p = 1; p < pieces.size(); p++){
     if(pieces.get(p).position.x == head.position.x && pieces.get(p).position.y == head.position.y){
       isAlive = false;
     }
   }
   
   // Eat cherry and grow body, if head hits cherry
   if(c.position.x == head.position.x && c.position.y == head.position.y){
     c.isAlive = false;
     addPiece();
   }
 }
 
 void updateBot(Cherry c){
   if(up || down){
     if(c.position.x > pieces.get(0).position.x){
       switchDirection(1);
     }else if(c.position.x < pieces.get(0).position.x){
       switchDirection(3);
     }
   }else if(right || left){
     if(c.position.y > pieces.get(0).position.y){
       switchDirection(2);
     }else if(c.position.y < pieces.get(0).position.y){
       switchDirection(0);
     }
   }
 }
 
 boolean isSnake(float x, float y){
   for(SnakePiece p : pieces){
     if(p.position.x == x && p.position.y == y){
       return true;
     }
   }
   return false;
 }
}

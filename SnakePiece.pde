class SnakePiece{
  PVector position;
  float size;
  color snakeColor = color(0, 200, 0);

  SnakePiece(float s){
    position = new PVector();
    size = s;
  }
  
  void setPosition(float x, float y){
    position.x = x;
    position.y = y;
  }
  
  void move(float x, float y){
    position.x += x;
    position.y += y;
  }
  
  void display(){
    strokeWeight(1.5);
    stroke(0);
    fill(snakeColor);
    rect(position.x, position.y, size, size);
    //ellipse(position.x+size/2, position.y+size/2, size, size);
  }
}

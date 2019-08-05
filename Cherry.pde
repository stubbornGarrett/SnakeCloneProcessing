class Cherry{
  PVector position;
  color cherryColor = color(200, 0, 50);
  boolean isAlive;
  float size;
  
  Cherry(float x, float y, float s){
    position = new PVector(x, y);
    isAlive = true;
    size = s;
  }
  
  void display(){
    noStroke();
    fill(cherryColor);
    rect(position.x+1, position.y+1, size-1, size-1);
  }
}

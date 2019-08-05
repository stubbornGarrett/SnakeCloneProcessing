class Map{
  PVector position;
  int rows, columns;
  float size;
  color gridColor, fillColor;
  
  Map(float x, float y, int c, int r, float s){
    position = new PVector(x, y);
    rows    = r;
    columns = c;
    size    = s;
    gridColor = color(10, 55, 10);
    fillColor = color(0);
  }
  
  void display(){
    for(int y = 0; y < rows; y++){
      for(int x = 0; x < columns; x++){
        strokeWeight(1);
        stroke(gridColor);
        fill(fillColor);
        rect(position.x + x*size, position.y + y*size, size, size);
      }
    }
  }
}

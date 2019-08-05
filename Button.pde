class Button{
  PVector position;
  float wid, hei;
  int outlineThickness;
  String text;
  color borderColor, fillColor, textColor;
  
  Button(float x, float y, float w, float h, String t){
    position = new PVector(x, y);
    wid  = w;
    hei  = h;
    text = t;
    outlineThickness = 5;
    borderColor = color(  0,   0,   0);
    fillColor   = color(255, 255, 255);
    textColor   = color(  0,   0,   0);
  }
  
  void display(){
    stroke(borderColor);
    strokeWeight(outlineThickness);
    fill(fillColor);
    rect(position.x-wid/2, position.y-hei/2, wid, hei);
    textAlign(CENTER, CENTER);
    textFont(bigFont);
    fill(textColor);
    text(text, position.x, position.y);
  }
  
  void setColor(int thk, color stk, color fil, color txt){
    outlineThickness = thk;
    borderColor = stk;
    fillColor   = fil;
    textColor   = txt;
  }
  
  boolean mouseInside(){
    return mouseX > leftEdge() && mouseX < rightEdge() && mouseY > topEdge() && mouseY < bottomEdge();
  }
  
  float topEdge(){    return position.y - hei/2 - outlineThickness/2; }
  
  float bottomEdge(){ return position.y + hei/2 + outlineThickness/2; }
  
  float leftEdge(){   return position.x - wid/2 - outlineThickness/2; }
  
  float rightEdge(){  return position.x + wid/2 + outlineThickness/2; }
}

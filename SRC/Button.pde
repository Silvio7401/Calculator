class Button {
  // member variables
  int x, y, w, h, v; //Position and Dimmentions
  char o;
  boolean hov, num; //Hover

  //Constructor
  Button(int x, int y, int w, int h) {    
    this.x  = x;   
    this.y  = y;   
    this.w  = w;   
    this.h  = h;
  } 
  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }

  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }

  void display() {
    if(!hov){
      fill(250, 255, 0);  
    } else {
      fill(255,151,32);
    }
    
    noStroke();
    ellipse(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(15);
    if (num) {
      text(v, x, y-3);
    } else {
      if (o == 'n') {
        textSize(12);
        text("ON", x, y-3);
      } else if (o == 'C'){
        textSize(12);
        text("AC",x,y-3);
      } else if (o == 'o'){
        textSize(12);
        text("OFF",x,y-3);
      } else if (o == '?'){
        textSize(12);
        text("+/-",x,y-3);
        } else if (o == 'b'){
        textSize(12);
        text("X",x-2,y);
        textSize(10);
        text("2",x+5,y-5);
      } else {
        text(o, x, y-3);
      } 
      }  
   }

  //Click
  void over() {
    hov = mouseX>x-(w/2) && mouseX<x+(w/2) && mouseY>y-h/2 && mouseY<y+h/2;
  }
}

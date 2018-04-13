Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];

String ls, rs;
String displayVal = "0";
String valToCompute = ""; //string value left of the operator
String valToCompute2 = ""; //string right of the operator 
float valToComputeI = 0; //float value left iof the operator
float valToComputeII = 0; //float value right of the operator 
float result = 0;
char opVal;
boolean firstNum; 
float ans; //answer
char op; //operator
boolean left, eq; // left of operator after the = is hit

void setup() {
  size(500, 500);

  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;

  //number buttons
  numButtons[0] = new Button(174, 218, 25, 25) .asNumber(7);
  numButtons[1] = new Button(211, 218, 25, 25) .asNumber(8);
  numButtons[2] = new Button(248, 218, 25, 25) .asNumber(9);
  numButtons[3] = new Button(174, 251, 25, 25) .asNumber(4);
  numButtons[4] = new Button(211, 251, 25, 25) .asNumber(5);
  numButtons[5] = new Button(248, 251, 25, 25) .asNumber(6);
  numButtons[6] = new Button(174, 283, 25, 25) .asNumber(1);
  numButtons[7] = new Button(211, 283, 25, 25) .asNumber(2);
  numButtons[8] = new Button(248, 283, 25, 25) .asNumber(3);
  numButtons[9] = new Button(174, 315, 25, 25) .asNumber(0);

  //operator buttons
  opButtons[0] = new Button(284, 218, 25, 25) .asOperator('÷');
  opButtons[1] = new Button(284, 251, 25, 25) .asOperator('x');
  opButtons[2] = new Button(284, 283, 25, 25) .asOperator('-');
  opButtons[3] = new Button(284, 315, 25, 25) .asOperator('+');
  opButtons[4] = new Button(248, 315, 25, 25) .asOperator('=');
  opButtons[5] = new Button(211, 315, 25, 25) .asOperator('.');
  opButtons[6] = new Button(319, 283, 25, 25) .asOperator('b');
  opButtons[7] = new Button(139, 283, 25, 25) .asOperator('C');
  opButtons[8] = new Button(319, 315, 25, 25) .asOperator('%');
  opButtons[9] = new Button(352, 251, 25, 25) .asOperator('n');
  opButtons[10] = new Button(139, 251, 25, 25) .asOperator('o');
  opButtons[11] = new Button(319, 218, 25, 25) .asOperator('?');
  opButtons[12] = new Button(319, 251, 25, 25) .asOperator('√');
}

void draw() {
  background(150, 0, 0); 
  strokeWeight(2);
  stroke(3, 54, 109);
  fill(10, 204, 204);
  ellipse(250, 250, 300, 300);
  ellipse(250, 250, 290, 290);
  strokeWeight(1);
  stroke(0);
  fill(200);
  rect(164, 154, 170, 28, 5);
  stroke(3, 54, 109);
  fill(0, 169, 255);
  rect(342,270, 20,5,15);

  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over();
  }
  updateDisplay();
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs += numButtons[i].v;
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '+') { 
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '-') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'x') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '÷') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalculation();
    } else if (opButtons[i].hov && opButtons[i].o == 'b') {
      if (left) {
        ans = sq(float(ls));
        ls = str((float)ans);
      } else {
        ans = sq(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '√') {
      if (left) {
        ans = sqrt(float(ls));
        ls = str((float)ans);
      } else {
        ans = sqrt(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '?') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    }
  }
}

void performClear() {
  ls = "";
  rs = "";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
}

void updateDisplay() {
  textAlign(LEFT, CENTER);
  textSize(19);
  text(ls, 175, 165);
}

void performCalculation() {
  switch(op) {
  case '+': 
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '-': 
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case 'x': 
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '÷': 
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  }
}

// Isaac Williamson | Nov 2022 | Calculator Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left = true;

void setup () {
  size(345, 580);
  textSize(30);
  numButtons[0] = new Button(50, 540, 60, 60, '0', color(#62605C), color(#C4BEB6), color(255));
  numButtons[1] = new Button(50, 460, 60, 60, '1', color(#62605C), color(#C4BEB6), color(255));
  numButtons[2] = new Button(130, 460, 60, 60, '2', color(#62605C), color(#C4BEB6), color(255));
  numButtons[3] = new Button(210, 460, 60, 60, '3', color(#62605C), color(#C4BEB6), color(255));
  numButtons[4] = new Button(50, 380, 60, 60, '4', color(#62605C), color(#C4BEB6), color(255));
  numButtons[5] = new Button(130, 380, 60, 60, '5', color(#62605C), color(#C4BEB6), color(255));
  numButtons[6] = new Button(210, 380, 60, 60, '6', color(#62605C), color(#C4BEB6), color(255));
  numButtons[7] = new Button(50, 300, 60, 60, '7', color(#62605C), color(#C4BEB6), color(255));
  numButtons[8] = new Button(130, 300, 60, 60, '8', color(#62605C), color(#C4BEB6), color(255));
  numButtons[9] = new Button(210, 300, 60, 60, '9', color(#62605C), color(#C4BEB6), color(255));
  opButtons[0] = new Button(130, 540, 60, 60, 'π', color(#62605C), color(#C4BEB6), color(255));
  opButtons[1] = new Button(210, 540, 60, 60, '.', color(#62605C), color(#C4BEB6), color(255));
  opButtons[2] = new Button(290, 540, 60, 60, '=', color(#FA9908), color(#FAF7F2), color(255));
  opButtons[3] = new Button(290, 460, 60, 60, '+', color(#FA9908), color(#FAF7F2), color(255));
  opButtons[4] = new Button(290, 380, 60, 60, '-', color(#FA9908), color(#FAF7F2), color(255));
  opButtons[5] = new Button(290, 300, 60, 60, 'X', color(#FA9908), color(#FAF7F2), color(255));
  opButtons[6] = new Button(50, 220, 60, 60, 'C', color(#B7B3AE), color(#F2EEE8), color(0));
  opButtons[7] = new Button(130, 220, 60, 60, '±', color(#B7B3AE), color(#F2EEE8), color(0));
  opButtons[8] = new Button(210, 220, 60, 60, '%', color(#B7B3AE), color(#F2EEE8), color(0));
  opButtons[9] = new Button(290, 220, 60, 60, '÷', color(#FA9908), color(#FAF7F2), color(255));
  opButtons[10] = new Button(50, 140, 60, 60, '√', color(#B7B3AE), color(#F2EEE8), color(0));
  opButtons[11] = new Button(130, 140, 60, 60, 'S', color(#B7B3AE), color(#F2EEE8), color(0));
}

void draw() {
  background(20);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("key" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", false);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", false);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", false);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", false);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", false);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", false);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", false);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", false);
  } else if (keyCode == 96 || keyCode == 48) {
    handleEvent(".", false);
  } else if (keyCode == 67) {
    handleEvent("C", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 32) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l  = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) { // All opButtons here
    dVal = "0.0";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
  } else if (val.equals("π")) {
    if (left) {
      l = PI;
      dVal = str(l);
    } else {
      r = PI;
      dVal = str(r);
  }
  
  } else if(val.equals(".")) {
    if(!dVal.contains(".")) {
      dVal += ".";
    } 
  }
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
     handleEvent("C",false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      left = false;
      dVal = " ";
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      preformCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = " ";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'X') {
      op = 'X';
      dVal = " ";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal = " ";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      op = '%';
      dVal = " ";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      op = '√';
      dVal = " ";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'S') {
      op = 'S';
      dVal = " ";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      op = 'π';
      dVal = " ";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    }
    println(" l:" + l + " r:" + r + " op:" + op + " Left:" + left + " Result:" + result);
  }
}
void updateDisplay() {
  textSize(30);
  fill(20);
  noStroke();
  rect(172, 51, 300, 70);
  fill(255);
  textAlign(RIGHT);
  if (dVal.length()<19) {
    textSize(32);
  } else if (dVal.length()<21) {
    textSize(28);
  } else if (dVal.length()<23) {
    textSize(26);
  } else if (dVal.length()<25) {
    textSize(24);
  } else if (dVal.length()<28) {
    textSize(22);
  } else if (dVal.length()<30) {
    textSize(20);
  } else if (dVal.length()<32) {
    textSize(18);
  } else if (dVal.length()<33) {
    textSize(18);
  }

  text(dVal, width-50, 60);
}


void preformCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'X') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '%') {
    result = l / 100;
  } else if (op == '±') {
    result = l * -1;
  } else if (op == '√') {
    result = sqrt(l);
  } else if (op == 'S') {
    result = sq(l);
  } else if (op == 'π') {
    result = l * PI;
  }
  dVal = str(result);
  l = result;
  left = true;
}

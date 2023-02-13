class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2, c3;
  boolean on;
  // Constructor
  Button(int x, int y, int w, int h, char val, color c1, color c2, color c3) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    this.c1=c1;
    this.c2=c2;
    this.c3=c3;
    on = false;
  }
  // Member Methods
  void display () {
    rectMode(CENTER);
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 30);
    fill(c3);
    rect(172, 51, 300, 70);
    textAlign(CENTER);
    if (val == 'S') {
      text("x²", x, y);
    } else {
      text(val, x, y);
    }
  }


void hover(int mx, int my) {
  on = (mx > x - w/2  && mx < x + w/2 && my >y-h/2 && my<y+h/2);
}
}

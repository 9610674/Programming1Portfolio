class Star {
  int x, y, speed, diam, c1, c2, c3;

  // Constructor
  Star() {
    x = int(random(width));
    y = int(random(height));
    speed = int(random(1, 6));
    diam = int(random(1, 6));
    c1 = int(random(255));
    c2 = int(random(255));
    c3 = int(random(255));
  }

  void display() {
    fill(c1, c2, c3);
    ellipse(x, y, diam, diam);
  }

  void move() {
    if (y>height+5) {
      y = -5;
    } else {
      y += speed;
    }
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}

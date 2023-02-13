class Rock {
  int x, y, speed, diam;
  PImage rock;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 15));
    diam = 50;
    rock = loadImage("Rock.png");
  }

  void display() {
    imageMode(CENTER);
    image(rock, x, y);
    rock.resize(100, 100);
  }

  void move() {
    y += speed;
  }



  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}

class SpaceShip {
  int x, y, w, ammo, turretCount, health;


  SpaceShip() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 1000;
    turretCount = 2;
    health = 1000;
  }

  void display(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    fill(255);
    noStroke();
    triangle(x, y-50, x+20, y+30, x-20, y+30);
    fill(135);
    triangle(x, y-70, x
      +10, y+20, x-10, y+20);
    triangle(x, y-5, x+20, y+30, x-20, y+30);
    fill(120);
    triangle(x, y-5, x+40, y+30, x-40, y+30);
    fill(0, 3, 150);
    rect(x-20, y+18, -10, 25);
    rect(x+21, y+18, -10, 25);
    strokeWeight(3);
    stroke(145, 50, 0);
    line(x-21, y-30, x-21, y+13);
    line(x+21, y+13, x+21, y-30);
  }

  void move() {
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}

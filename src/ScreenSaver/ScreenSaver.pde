// Isaac Williamson | 10 OCt 2022 | ScreenSaver
float xpos, ypos, strokeW, pointCount;

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  xpos = random(width);
  ypos = random(height);
}

void draw() {
  strokeW = random(1,10);
  pointCount = random(30,70);
  stroke(random(0), random(255), random(0));
  strokeWeight(strokeW);
  //moveRight(xpos,ypos,pointCount);
  if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
  }
  if (random(100)>70) {
    moveRight(xpos, ypos, pointCount);
  }  else if (random(100)>65) {
    moveLeft(xpos, ypos, pointCount);
  } else if (random(100)>65) {
    moveUp(xpos, ypos, pointCount);
  } else if (random(100)<65) {
    moveDown(xpos, ypos, pointCount);
  }
}




void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX +i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX-i;
    ypos = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY-i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY+i;
  }
}

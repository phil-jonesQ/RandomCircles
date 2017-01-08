class Circle {
  float x;
  float y;
  float r1;
  float r2;
  float colR;
  float colG;
  float colB;
  int speed;
  boolean bottom = false;
  boolean top = true;

  Circle () {

    x = random (0, width);
    y = random (0, height);
    r1 = random (5, 15);
    r2 = r1;
    colR = random (10, 255);
    colG = random (10, 255);
    colB = random (10, 255);
    speed = 3;
  }

  void show () {
    fill(colR, colG, colB);
    noStroke();
    ellipse (x, y, r1, r2);
  }

  void move () {

    if (bottom) {
      y = y - speed;
      r1=r2;
    }

    if (top) {
      y = y + speed;
    } 

    if ( y > height) {
      bottom=true;
      top=false;
      r1=r2*2;
    }

    if ( y < 20 ) {
      top=true;
      bottom=false;
    }
  }
}
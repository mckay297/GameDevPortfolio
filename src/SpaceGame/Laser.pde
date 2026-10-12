class Laser {
  // Member Variables
  int x, y, w, h, speed;

  Laser( int x, int y) {
    this.x = x;
    this.y = y;
    w = 6;
    h = 10;
    speed = 6;
  }

  void display () {
    fill(44, 222, 22);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }

  boolean isOffScreen() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
  
  // add isHit()
}

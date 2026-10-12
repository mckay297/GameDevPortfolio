class Ship {
  // Member Variables
  int x, y, health, turretCount;
  PImage s1;

  // Constructor
  Ship (int x, int y) {
    this.x = x;
    this.y = y;
    health = 100;
    turretCount= 1;
    s1 = loadImage ("SpaceShip.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(s1, x, y);
    //fill(127);
    //quad(x, y-90, x+40, y, x, y+30, x-40, y);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean isHit(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}

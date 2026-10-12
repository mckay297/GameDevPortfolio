class Rock {
  // Member Variables
  int x, y, w, h, speed; //,damage,xp,currency;
  boolean isHit;
  PImage r1;

  // Constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    w = int(random(20, 100));
    h = int(random(20, 100));
    speed = int(random(1, 7));
    isHit = false;
    r1 = loadImage("");
  }

  // Member Methods
  void display() {
    fill(127);
    ellipse(x, y, w, h);
    textAlign(CENTER, CENTER);
  }

  void move() {
    y = y + speed;
  }

  boolean isOffScreen() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }

  boolean isHit(Laser l) {
    float d = dist(x, y, l.x, l.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
}

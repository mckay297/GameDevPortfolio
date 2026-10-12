class PowerUp {
  // Member Variables
  int x, y, size, speed; //,damage,xp,currency;
  char type;
  boolean isHit;
  PImage pu1;

  // Constructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    size = int(random(20, 100));
    speed = int(random(1, 5));
    if (random (2)>1.0) {
      type = 'h';
    } else {
      type = 't';
    }
    isHit = false;
    pu1 = loadImage("");
  }

  // Member Methods
  void display() {
    fill(55, 200, 44);
    ellipse(x, y, size, size);
    textAlign(CENTER, CENTER);
    fill (255);
    text(type, x, y);
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

  //add isHit()
  boolean isHit(Ship s ) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}

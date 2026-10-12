class Boss {
  int x, y, w, h, lvl, speed, health;
  PImage boss1;

  Boss(int x, int y, int lvl) {
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    w = 200;
    h = 200;
    speed = 1;
    health = 1000;
    if (lvl == 1) {
      boss1 = loadImage("boss01.png");
    }
  }

  void display() {
    fill(255, 3, 3);
    ellipse(x, y, w, h);
  }
  void move() {
    x = x + speed;
  }
}

// McKay Essig | 16 Sept 2026 | SpaceGame
//import gifAnimation.*;
import processing.sound.*;
SoundFile laser01, rock02;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powUps = new ArrayList<PowerUp>();
Ship ship01;
Boss b1;
Timer rDist, puDist, bossFreq;
int score, rockCount, rocksOffScreen, laserSpeed, level, rocksPassed;
boolean play;

void setup() {
  size(800, 900);
  laser01 = new SoundFile(this, "l2.mp3");
  rock02 = new SoundFile(this, "l3.mp3");
  //rocks.add(new Rock(int(random(width)), -60));
  //powUps.add(new PowerUp(int(random(width)), -60));
  ship01 = new Ship(width/2, height/2 );
  rDist = new Timer(2000);
  rDist.start();
  puDist = new Timer(5000);
  puDist.start();
  bossFreq = new Timer(30000);
  puDist.start();
  play = false;
  rocksPassed = 0;

  score=0;
  rockCount= 0;
}

void draw () {
  if (play == false) {
    startScreen();
  } else {
    background(20);

    // Add Rocks
    if (rDist.isFinished () == true) {
      //spawn new Rock
      rocks.add(new Rock(int(random(width)), -60));
      //Reset timer
      rDist.start();
      rockCount++;
    }

    // Add Power Ups
    if (puDist.isFinished() == true) {
      powUps.add(new PowerUp(int(random(width)), -60));
      puDist.start();
    }

    //Display and Move lasers and dectect rock collision
    for (int i = 0; i < lasers.size(); i++) {
      println("lasers" + lasers.size());
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.isHit(l)) {
          // increment score
          score = score + 100;
          // remove rock and laser
          lasers.remove(l);
          rocks.remove(r);
        }
      }
      l.display();
      l.move();

      if (l.isOffScreen() == true) {
        lasers.remove(l);
      }
    }

    ship01.display();
    ship01.move(mouseX, mouseY);

    // Displaying PowerUps and dectect ship collision
    for (int i = 0; i < powUps.size(); i++) {
      println("powerup" + powUps.size());
      PowerUp pu = powUps.get(i);
      pu.display();
      pu.move();
      // add isHit()
      if (pu.isHit(ship01)) {
        // Increase health of ship
        ship01.health += 100;
        powUps.remove(pu);
      }
      //find if off screen
      if (pu.isOffScreen() == true) {
        powUps.remove(pu);
      }
    }
    // Displaying and Moving Rocks and dectect ship collision
    for (int i = 0; i < rocks.size(); i++) {
      println("rocks" + rocks.size());
      Rock r = rocks.get(i);
      r.move();
      r.display();
      // add isHit()
      if (ship01.isHit(r)) {
        rocks.remove(r);
        score += 100;
        ship01.health -= 50;
      }
      if (r.isOffScreen() == true) {
        rocks.remove(r);
       rocksPassed +=1;
      }
      println(rocks.size());
    }
    infoPanel();
    if (ship01.health<1 || rocksPassed > 5) {
      gameOver();
    }
  }
}

void mousePressed() {
  laser01.play();
  lasers.add(new Laser(ship01.x, ship01.y));
}


// add infoPanel()
void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 40);
  fill(255);
  textSize(28);
  textAlign(CORNER, CORNER);
  text("Score:" + score, 20, 35);
  text("RockCount:" + rockCount, 180, 35);
  text("Health:" + ship01.health, 380, 35);
   text(" Rocks Passed:" + rocksPassed, 530, 35);
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over", width/2, height/2);
  noLoop();
}
void startScreen() {
  background(0);
  fill(255);
  text("Press Any Key to Start", width/2, height/2);
  if (keyPressed) {
    play = true;
  }
}

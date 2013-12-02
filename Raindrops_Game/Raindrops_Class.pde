//this is the code for the raindrops

class Raindrop {
  PVector loc, vel;
  int d;

  Raindrop() {
    loc = new PVector(random(width), random(0, 40));
    vel = new PVector (0, random(1,4));
    d = 20;
  }

  void display() {
    ellipse(loc.x, loc.y, d, d);
  }

  void move() {
    loc.add(vel);
  }
  void reset() {
    loc.set(random(width), 0);
    vel.set(0, random(1,4));
  }
}

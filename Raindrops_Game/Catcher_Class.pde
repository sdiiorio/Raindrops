//this will be the code for the catcher

class Catcher {
  PVector loc;
  int d;

  Catcher() {
    loc = new PVector(mouseX,height-d);
    d = 50;
  }

  void display() {
    fill(255);
    ellipse(loc.x, loc.y, d, d);
  }
  void update() {
    loc.set(mouseX, height-d);
  }
}

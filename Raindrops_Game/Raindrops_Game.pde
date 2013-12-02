//this will be the code for the game

Raindrop [] r1 = new Raindrop [20];
Catcher catcher1;

void setup() { 
  size(600,600);
  for (int i = 0; i < r1.length; i++) {
    r1[i] = new Raindrop();
  }
  catcher1 = new Catcher();
}

void draw() {
  background(0);
  for (int i = 0; i < r1.length; i++) {
    r1[i].display();
    r1[i].move();
    if ( r1[i].loc.y > height + r1[i].d) {
      r1[i].reset();
    }
    if (catcher1.recognize(r1[i]) == true) {
      r1[i].reset();
    }
  }
  catcher1.display();
  catcher1.update();
  

}

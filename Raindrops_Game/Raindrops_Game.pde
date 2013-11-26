//this will be the code for the game

Raindrop [] r1 = new Raindrop [10];
Catcher catcher1;

void setup() { 
  colorMode(HSB, 360, 100, 100);
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
  }
  catcher1.display();
  catcher1.update();
  

}

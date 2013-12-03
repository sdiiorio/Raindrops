int index = 50;
Raindrop [] drop = new Raindrop [100];

void setup() {
 size(600,600); 
 background(0);
 for (int i = 0; i < drop.length; i++) {
   drop[i] = new Raindrop();
 }
}

void draw() {
  background(0);
  for (int i = 0; i < index; i++) {
    drop[i].display();
    drop[i].move();
  }   
}

void mousePressed () {
  if (index < drop.length) {
  index++;
  }
}

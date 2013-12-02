color c = color(0);

void setup() {
  size (300,300);
  textSize(30);
  textAlign(CENTER);
}

void draw() {
  background(c);
  text(millis()/1000.0, width/2, height/2);
  if(millis()/1000 % 2 == 0) {
    c = color(random(255), random(255), random(255));
  }
}


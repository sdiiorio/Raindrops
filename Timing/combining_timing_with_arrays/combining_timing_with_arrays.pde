int index = 0;
Raindrop [] drop = new Raindrop [100];

int currentTime = 0;
int changeTime = 0;
int oldTime = 0;
color c = color(0);


void setup() {
 size(600,600); 
 for (int i = 0; i < drop.length; i++) {
   drop[i] = new Raindrop();
 }
}



void draw() {
  background(0);
  currentTime= millis();
  changeTime= currentTime-oldTime;
  if (changeTime > 2000) {
    ellipse(random(width),random(height), 20,20);
    oldTime = currentTime;
    index++;
  }
  for (int i = 0; i < index; i++) {
    drop[i].display();
    drop[i].move();
  }   
}

color c = color(0);
int changeTime = 0;
int currentTime = 0;
int oldTime = 0;

void setup() {
  size(300,300);
  textSize(30);
  textAlign(CENTER);
}

void draw() {
  background(c);
  currentTime = millis();
  changeTime = currentTime - oldTime;
  text(millis(), width/2, height/2);
  if(changeTime >= 2000) {
    c = color(random(255), random(255), random(255));
    oldTime = currentTime;
  }
  
}

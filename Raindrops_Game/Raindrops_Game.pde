//this will be the code for the game

int score = 0;
int index = 0;
int currentTime=0;
int changeTime = 0;
int oldTime = 0;
Raindrop [] r1 = new Raindrop [500];
Catcher catcher1;

void setup() { 
  size(600,600);
  textSize(30);
  textAlign(CENTER);
  for (int i = 0; i < r1.length; i++) {
    r1[i] = new Raindrop();
  }
  catcher1 = new Catcher();
}

void draw() {
  background(0);
  fill(255);
  rect(20,20,100,50);
  fill(0);
  text(score,70,55);
  currentTime= millis();
  changeTime= currentTime-oldTime;
  for (int i = 0; i < index; i++) {
    r1[i].display();
    r1[i].move();
    if (catcher1.recognize(r1[i]) == true) {
      r1[i].goAway();
      score++;
    }
  }
    if (changeTime > 2000) {
    ellipse(random(width),random(height), 20,20);
    oldTime = currentTime;
    index++;
  }
  catcher1.display();
  catcher1.update();
  
}

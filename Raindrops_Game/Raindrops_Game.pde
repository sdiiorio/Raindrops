//this will be the code for the game

//these are the variables necessary to create the raindrop game
int score = 0;
int index = 0;
int currentTime=0;
int changeTime = 0;
int oldTime = 0;
//this creates an array of 500 raindrops
Raindrop [] r1 = new Raindrop [500];
//this creates a catcher
Catcher catcher1;

//these are the initial parameters/settings for the game
void setup() { 
  size(600,600);
  textSize(30);
  textAlign(CENTER);
//this defines when a raindrop should be created as part of the array
  for (int i = 0; i < r1.length; i++) {
    r1[i] = new Raindrop();
  }
//this defines the catcher
  catcher1 = new Catcher();
}

void draw() {
  background(0);
//creating the score display in the top corner
  fill(255);
  rect(20,20,100,50);
  fill(0);
  text(score,70,55);
//assigning values to the variables needed for timing
  currentTime= millis();
  changeTime= currentTime-oldTime;
//this for loop allows for the raindrops to display and fall if the parameters are met
  for (int i = 0; i < index; i++) {
    r1[i].display();
    r1[i].move();
    //this code allows for the raindrops to go away when the catcher recognizes them as intersecting with the catcher
    //the score will increase when this happens    
    if (catcher1.recognize(r1[i]) == true) {
      r1[i].goAway();
      score++;
    }
  }
//this allows for raindrops to be dropped at a certain interval
    if (changeTime > 2000) {
    ellipse(random(width),random(height), 20,20);
    oldTime = currentTime;
    index++;
  }
//this calls the functions of the catcher
  catcher1.display();
  catcher1.update();
}

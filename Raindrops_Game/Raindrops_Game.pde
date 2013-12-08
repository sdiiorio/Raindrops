//this will be the code for the game

//these are the variables necessary to create the raindrop game
boolean startGame;
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
  textAlign(CENTER);
//this defines when a raindrop should be created as part of the array
  for (int i = 0; i < r1.length; i++) {
    r1[i] = new Raindrop();
  }
//this defines the catcher
  catcher1 = new Catcher();
  startGame = false;
}

void draw() {
  if(startGame == true) {
  background(0);
//creating the score display in the top corner and the timing to display in the top right corner
  textSize(30);
  fill(255);
  rect(20,30,100,50);
  rect(width-130,30,120,50);
  fill(0);
  text(score,70,65);
  text(millis()/1000.0, 530, 65);
  fill(255,0,0);
  textSize(20);
  text("Score",70,20);
  text("Time",530,20);
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
  else{
    background(0);
    fill(255);
    fill(0,255,0);
    rect(width/2-75,height/2-25,150,50);
    fill(0);
    textSize(30);
    text("Start",width/2,height/2+10);
  }
}

void mousePressed(){
  if(mouseX>255 && mouseX<375 && mouseY>275 && mouseY<325){
      startGame = true;
  }
}

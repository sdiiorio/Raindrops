//this will be the code for the game

//these are the variables necessary to create the raindrop game     
int score = 0;
int index = 0;
int currentTime=0;
int changeTime = 0;
int oldTime = 0;
int displayTime = 0;
int lives;
//these are the booleans necessary to create the raindrop game
boolean startGame;
boolean gameOver;
//defines images to be used as the background
PImage sky;
PImage background1;
PImage background2;
//this creates an array of 500 raindrops
Raindrop [] r1 = new Raindrop [500];
//this creates a catcher
Catcher catcher1;


//these are the initial parameters/settings for the game
void setup() { 
  lives = 3;
  //these next three lines load the images needed for the backgrounds
  sky = loadImage("sky.jpg");
  background1 = loadImage("raindrop_background.jpg");
  background2 = loadImage("clear_sky.jpg");
  size(sky.width, sky.height);
  textAlign(CENTER);
  noStroke();
  //this defines when a raindrop should be created as part of the array
  for (int i = 0; i < r1.length; i++) {
    r1[i] = new Raindrop();
  }
  //this defines the catcher
  catcher1 = new Catcher();
  //this defines the initial values for the booleans
  startGame = false;
  gameOver = false;
}

//this is the portion of the code that needs to be repeated
void draw() {
  //if the startGame boolean has a value of true, the game will run.
  //if not, the start screen will display (see below)
  if (startGame == true) {
    background(sky);
    //creating the score display in the top corner and the timing to display in the top right corner
    textSize(30);
    fill(255);
    rect(20, 30, 100, 50);
    rect(width-120, 30, 100, 50);
    fill(0);
    text(score, 70, 65);
    text(lives, 530, 65);
    fill(255, 0, 0);
    textSize(20);
    text("Score", 70, 20);
    text("Lives", 530, 20);
    //assigning values to the variables needed for timing
    currentTime= millis();
    changeTime= currentTime-oldTime; 
    //this for loop allows for the raindrops to display and fall if the parameters are met
    for (int i = 0; i < index; i++) {
      r1[i].display();
      r1[i].move();
      r1[i].die();
      //this code allows for the raindrops to go away when the catcher recognizes them as intersecting with the catcher
      //the score will increase when this happens    
      if (catcher1.recognize(r1[i]) == true) {
        r1[i].goAway();
        score++;
      }
    }
    //this allows for raindrops to be dropped at a certain interval (specifically a time interval of 2 seconds
    if (changeTime > 2000) {
      oldTime = currentTime;
      index++;
    }
    //this calls the functions of the catcher
    catcher1.display();
    catcher1.update();
  }
  //this creates a start screen which will display if the boolean startGame is false
  else {
    size(background1.width, background1.height);
    background(background1);
    fill(255);
    fill(0, 255, 0);
    rect(width/2-75, height/2-25, 150, 50);
    fill(0);
    textSize(30);
    text("Start", width/2, height/2+10);
    fill(255, 0, 0);
    text("Raindrops Game", width/2, 100);
  }

  //this will allow for the value of gameOver to change  
  if (lives == 0) {
    gameOver = true;
  }
  //this creates a game over screen
  if (gameOver == true) {
    background(background2);
    fill(255, 0, 0);
    rect(width/2-100, height/2-25, 170, 50);
    fill(0);
    textSize(30);
    text("Game Over", width/2-15, height/2+10);
    rect(0,0,100,50);
    fill(255,0,0);
    text("Reset",50,30);
  }
}


//this allows for the value of startGame to be changed to true if you click on the start button
void mousePressed() {
  if (mouseX>255 && mouseX<375 && mouseY>275 && mouseY<325) {
    startGame = true;
  }
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 50) {
     for (int i = 0; i < index; i++) {
    startGame = false;
     gameOver = false;
     lives = 3;  
     score = 0;
     r1[i].goAway();
   }
  }
}


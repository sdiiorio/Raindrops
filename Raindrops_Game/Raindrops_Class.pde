//this is the code for creating the raindrops class

class Raindrop {
//these are the variables used in creating the raindrop class
  PVector loc, vel;
  PImage raindrop;
  int d;

  Raindrop() {
//these variables will allow you to create a raindrop at at a random x value and at -d
//dropping from a y value of -d will allow the raindrops to fall instead of appearing
//this section of code also loads the image for the raindrop to be used in the class
    loc = new PVector(random(width), -d);
    vel = new PVector (0, random(1,4));
    raindrop = loadImage("raindrop.png");
    d = 20;
  }
//these are the functions that can be used in the regular code which allow the raindrops to perform various tasks
//this displays the raindrop image  
  void display() {
    image(raindrop,loc.x,loc.y,d,d);
  }
//this will allow the raindrop to fall
  void move() {
    loc.add(vel);
  }
//this will allow the raindrop to reset at the top of the screen (although this is not really needed)
  void reset() {
    loc.set(random(width), 0);
    vel.set(0, random(1,4));
  }
//this resets the location of a raindrop so that it is far off the screen
//this will be used when the catcher recognizes/intersects the raindrop
  void goAway() {
    loc.set(width*2,0);
    vel.set(0,0);
  }
//this will allow you to decrease the lives varible and lose the game
  void die() {
    if(loc.y > height) {
    lives--;
    goAway();
    }
  }
}


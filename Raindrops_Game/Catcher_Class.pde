//this will be the code creating the catcher class

class Catcher {
//these are the variables used in creating the catcher class 
  PVector loc;
  PImage bucket;
  int d;

  Catcher() {
//these variables will allow you to create a catcher (and defining it as an image) which follows your mouse in the x direction and stays in a fixed y position
    loc = new PVector(mouseX,height-d);
    bucket = loadImage("bucket.png");
    d = 100;
  }
//these are the functions that can be used in the regular code which allow the catcher to perform various tasks
//this displays the catcher with a white fill
  void display() {
    imageMode(CENTER);
    image(bucket,loc.x,loc.y,d,d);
  }
//this allows the catcher to be updated each frame to follow your mouse  
  void update() {
    loc.set(mouseX, height-d);
  }
//this a boolean which will tell the code if the catcher and the raindrop are intersecting
//if distance between the centers of the catcher and the raindrop are less than the sum of the diameters of the two, the value of the boolean will be true
//if not, the value will be returned as false
//a temporary raindrop is created to allow the boolean to function
//this temporary raindrop will allow the value of the raindrop to be returned to the regular code
  boolean recognize(Raindrop drop) {
    if (loc.dist(drop.loc) < d/4 + drop.d/2) {
      return true;
    }
    else {
      return false;
    }
  }
}

Raindrops Game Project
======================

This game will have an array of falling raindrops that will move down the screen one at a time. There will also be a catcher that will follow the mouse, and the game will check to see if the raindrop touches the catcher. If the raindrop touches the catcher, the score will increase and the raindrop that was touching the catcher will disappear. After a certain amount of time, a new raindrop will appear. There may be something added to that if the raindrop touches the ground, the game will be over.


Steps of Making the Game
========================

*Create a raindrop (by creating a raindrop Class)
*Create a catcher (by creating a catcher Class)
*The catcher will follow the mouse.
*If the catcher intersects a raindrop, this raindrop is caught.
*If a raindrop is caught, the raindrop will go away.
*If a raindrop is caught, the score of the game will be increased (the score should be displayed on the screen somewhere)


Glitches/Problems I encountered while making the game
=====================================================
*Mysterious Circle Issue- each time a circle was dropped,a new circle was created at a random place on the screen
*Resolved- the issue had been that I used an old code which made a raindrop appear every two seconds instead of dropping. Now, every time the changeTime variable is greater than two seconds, a new raindrop is dropped using the display and move functions by increasing the index.
*End screen issue- the game would just change to the game over screen after a certain amount of time, usually after about 9 seconds, without any visible sign that the game over screen should be triggered.
*Resolved- When a raindrop was caught, the game reset its x value to be off the display screen. However, the velocity was not reset, so the raindrop continued to the bottom. Eventually the y would be equal to the height and trigger the game over screen. I fixed this issue by resetting the velocity when a raindrop was caught.

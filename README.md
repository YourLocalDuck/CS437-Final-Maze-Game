# Game Design
This game that I made for my final project is a maze where you control a character and must find your way out. The sprites include the player sprite, every single tile, and the maze exit, or the win condition. Every sprite has collision detection with each other, thanks to the bump module, and will not be allowed to go through other sprites. This is including the maze exit, but this is unnoticable, since the maze exit will teleport the player when touched. 
The only sprite that can "die" is the tile sprites when switching mazes. However, in the current iteration, there is only one maze because the backtracking algorithm currenty does not work. More mazes can easily be added manually by creating another 2d table of 1's and 0's, and inserting it between the first maze and the win. More specifically, the maze exit can iterate and be repositioned on the first touch to the second maze's exit, and when it is touched for the second time, the win condition is fulfilled as normal.

# Software Engineering Plan
This project was created by only me, which is probably one of the reasons I could not get everything I wanted to done. The plan was to learn the new software on the first day, and use subsequent days to pick away at what my vision of the final project was. Originally, this game was supposed to be rogue-like type game with the main feature being the maze generation. However, in the first few days I quickly realized this was too ambitious for me personally due to the love framework being fairly low level and my inexperience in lua. Most of the time that I spent on this project was actually trying to get low level things work, such as sprites and classes. If I had used an actual engine like godot, maybe my original plan might have been possible, but on love, my biggest accomplishments were very low level, such as getting the camera to work and stay on the character, or animating the player sprite and flipping it when needed. Because of this, I thought a maze game would be a better fit for me, especially with generated mazes. The other half of my time went to trying different implementations of the recursive backtracking algorithm for maze generation, which was supposed to be the main focus of my project, but I had to deprioritize it since I wasn't getting anywhere with it and I decided to shift my focus to making at least a functional maze game.

Overall, I spent a lot of time on this project, but I don't have much to show for it, since most of the time was spent learning the new framework and the new language. I did find modules to be especially helpful in lua, however. After realizing how powerful they could be, I scrapped my collision detection and attempts at a camera and used some from modules. 

I think if I had another chance to use this framework, I would be able to make a much more competent product because of my experiences in this project. I was able to figure out most of the low level stuff and got a feel for the language, so I am confident I would be able to make a better product in half the time.

# State Transition Diagram
For the game in general, there are two states at the moment, and more if more mazes are added. There's the maze and the victory screen. More mazes can be added in between them, but in the current implementation, there is only the two states. The game starts on the maze state. When the player finds the finish and touches the finish sprite, the game switches to the victory state, where the player's speed is reduced to zero and they are taken to a screen saying that they win, with their character also on the screen.

The Player sprite also has two states, idle and moving. This state affects what animation is viewed. When any of the arrow keys are pressed down, the player sprite switches to the moving state. When no keys are pressed, the player switches to the idle state.

# User Instructions
If you are on windows, I have packaged the game into `mazeGameDistribution.zip`, no further installation is required other than extracting it and running the exe. 

If you are on anything else, you might have to compile the program yourself. This project is built using love2d, which can be found at `https://love2d.org/#download`

I have packaged the file in a different way for other platforms. If you run `mazeGame.love` using love, with some command like `love mazeGame.love`, you may be able to run it.

If it still doesn't work, you can run love in the game directory itself, and it will most likely run. Just run `love [dir]` with dir being the directory name.

To play: Once you load in, your player character will be in the middle of the screen and you will be surrounded by tiles. The tiles make up a maze that you must solve to get to the opening at the end and complete the game. Use the arrow keys to move and try to get out of the maze. There are some collision bugs, but every space on the maze is accessible, as I have tried it myself. So, if you are not able to get through an opening, try moving around a bit and you will.



Note: bump.lua, camera.lua, classic.lua, and signal.lua are libararies that I found on github, and are not created by me.
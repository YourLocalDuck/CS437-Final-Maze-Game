# Project Introduction

This is a maze game developed for a final project. The player controls a character and must navigate through a maze to find the exit. The game features sprites for the player, maze tiles, and the maze exit, all with collision detection enabled using the bump module. Currently, there is only one maze due to issues with the backtracking algorithm, but more mazes can be added manually by creating additional 2D tables of 1's and 0's.

# How to Compile

To compile the project, you will need the LOVE2D framework, which can be downloaded from [LOVE2D's official website](https://love2d.org/#download).

### Windows

1. Extract the contents of `mazeGameDistribution.zip`.
2. Run the executable `mazeGame.exe`.

### Other Platforms

1. Download and install LOVE2D.
2. Run the game using `mazeGame.love` with the command: `love mazeGame.love`.
3. Alternatively, you can run LOVE2D directly in the game directory using: `love [dir]` (replace `[dir]` with the directory name).

# How to Run

Once the game is loaded, your player character will be in the middle of the screen, surrounded by tiles forming a maze. Use the arrow keys to move the character and find the exit. Note that there are some collision bugs, but all maze spaces are accessible.

# Input/Output

### Input

The game uses the arrow keys for movement.

### Output

When the player touches the maze exit, the game transitions to a victory screen, indicating that the player has won.

# State Transition Diagram

### Game States

- **Maze State**: The initial state where the player navigates through the maze.
- **Victory State**: The state reached upon touching the maze exit, displaying a victory screen.

### Player States

- **Idle**: The state when no keys are pressed, showing the idle animation.
- **Moving**: The state when any arrow key is pressed, showing the moving animation.

# User Instructions

### Windows Users

1. Download `mazeGameDistribution.zip`.
2. Extract the contents.
3. Run `mazeGame.exe`.

### Other Platforms

1. Download LOVE2D from [LOVE2D's official website](https://love2d.org/#download).
2. Run `mazeGame.love` using the command: `love mazeGame.love`.
3. Alternatively, run LOVE2D in the game directory using: `love [dir]`.

### Gameplay

- Use the arrow keys to move the character.
- Navigate through the maze to find the exit.
- Touch the exit to win the game.

### Notes

- Some collision bugs may occur, but all maze spaces are accessible.
- Libraries used: `bump.lua`, `camera.lua`, `classic.lua`, and `signal.lua` (found on GitHub, not created by the developer).

# Team

This project was created as a final project by a single developer for CS437.

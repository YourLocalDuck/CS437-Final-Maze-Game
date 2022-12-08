if arg[2] == "debug" then
    require("lldebugger").start()
end

local gameState = "map1"

function love.load()
    Object = require "classic"
    Camera = require "camera"
    Bump = require 'bump'
    Signal = require 'signal'
    require "map"
    require "sprite"
    require "player"
    require "backtracking"
    require "finishSprite"
    
    map = Map()
    Player21 = Player();
    --testSprite = Sprite(love.graphics.newImage("panda.png"));
    --testSprite.x = 380
    --testSprite.y = 4200
    touchToWin = Finish()
    camera = Camera(Player21.x, Player21.y)
    
    currentFrame = 1
    love.graphics.setBackgroundColor(47/255, 49/255, 79/255, 1)
    font = love.graphics.newFont(100)
    love.graphics.setFont(font)

    Signal.register('win', function()
        Player21:tp(500, 500)
        Player21.speed = 50
    end
    )
    
end

function love.update(dt)
    currentFrame = currentFrame + .25

    Player21:update()

    local dx,dy = Player21.x - camera.x, Player21.y - camera.y
    camera:move(dx/2, dy/2)

    Signal.register('win', function()
        gameState = "gameWin"
    end
    )
end

function love.draw()
    camera:attach()
    Player21:draw()
    --testSprite:draw()
    map:draw()
    touchToWin:draw()
    --print (Player21.x .. ", ".. Player21.y)
    if (gameState == "gameWin") then
        love.graphics.setColor(255,0,0)
        love.graphics.print("You Win! You Win!\nYou Win! You Win!\nYou Win! You Win!\nYou Win! You Win!\nYou Win! You Win!\nYou Win! You Win!\n", 400, 400)
        love.graphics.setColor(255,255,255)
    end
    
    camera:detach()
end

local love_errorhandler = love.errhand
function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
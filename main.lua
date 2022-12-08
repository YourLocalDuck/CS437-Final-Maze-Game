if arg[2] == "debug" then require("lldebugger").start() end

local gameState = "map1"

function love.load()
    Object = require "classic"
    Camera = require "camera"
    Bump = require 'bump'
    Signal = require 'signal'
    require "map"
    require "sprite"
    require "player"
    --require "backtracking" --Procedurally generated maze, doesn't work
    require "finishSprite"

    map = Map()
    Player21 = Player()
    touchToWin = Finish()
    camera = Camera(Player21.x, Player21.y)

    currentFrame = 1
    love.graphics.setBackgroundColor(47 / 255, 49 / 255, 79 / 255, 1)
    font = love.graphics.newFont(100)
    love.graphics.setFont(font)

    Signal.register('win', function()
        Player21:tp(500, 500)
        Player21.speed = 2048
    end)

end

function love.update(dt)
    currentFrame = currentFrame + 15*dt

    Player21:update(dt)

    local dx, dy = Player21.x - camera.x, Player21.y - camera.y
    camera:move(dx / 2, dy / 2)

    Signal.register('win', function() gameState = "gameWin" end)
end

function love.draw()
    camera:attach()
    Player21:draw()

    map:draw()
    touchToWin:draw()

    if (gameState == "gameWin") then
        love.graphics.setColor(255, 0, 0)
        love.graphics.print(
            "You Win!\nYou Win!",
            600, 650)
        love.graphics.setColor(255, 255, 255)
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

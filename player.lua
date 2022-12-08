Player = Sprite:extend()
Signal = require 'signal'

local onlyOnceSignal = 0

function Player:new()
    self.x = 1000
    self.y = 1000
    self.dx = 0
    self.dy = 0
    self.ddx = 0
    self.ddy = 0
    self.Idleimage = love.graphics.newImage("playerIdle.png")
    self.movingImage = love.graphics.newImage("playerWalking.png")
    self.idleFrames = {}
    self.movingFrames = {}
    self.animationFrames = {12, 10}
    self.drag = 5
    self.speed = 512
    self.width = 1250
    self.height = 1141
    self.imageScale = .15
    self.currentState = "idle"
    local facing = 0

    for i = 0, 11 do
        table.insert(self.idleFrames,
                     love.graphics
                         .newQuad(i * self.width, 0, self.width, self.height,
                                  self.Idleimage:getWidth(),
                                  self.Idleimage:getHeight()))
    end
    for i = 0, 9 do
        table.insert(self.movingFrames,
                     love.graphics
                         .newQuad(i * self.width, 0, self.width, self.height,
                                  self.movingImage:getWidth(),
                                  self.movingImage:getHeight()))
    end
    map.world:add(self, self.x, self.y, self.width * self.imageScale * .8,
                  self.height * self.imageScale)
end

function Player:update(dt)
    self.ddx = math.floor(self.ddx / self.drag)
    self.ddy = math.floor(self.ddy / self.drag)
    local moving = 0
    if love.keyboard.isDown("left") then
        self.dx = -self.speed*dt
        moving = moving + 1
        facing = 0
    end
    if love.keyboard.isDown("right") then
        self.dx = self.speed*dt
        moving = moving + 1
        facing = 1
    end
    if love.keyboard.isDown("up") then
        self.dy = -self.speed*dt
        moving = moving + 1
    end
    if love.keyboard.isDown("down") then
        self.dy = self.speed*dt
        moving = moving + 1
    end
    if (moving == 0) then
        self.currentState = "idle"
    else
        self.currentState = "moving"
    end

    self:basicSpritePhysics()
    self.dx = 0
    self.dy = 0
end

function Player:basicSpritePhysics()
    self.dx = self.dx + self.ddx
    self.dy = self.dy + self.ddy
    self.x = self.x + self.dx
    self.y = self.y + self.dy
    local actualX, actualY, cols, len = map.world:move(self, self.x, self.y)
    self.x = actualX
    self.y = actualY
    for i = 1, len do
        if tostring(cols[i].other) == "finish" then Signal.emit('win') end
    end
end

function Player:draw()
    if (self.currentState == "idle") then
        if (facing == 0) then
            love.graphics.draw(self.Idleimage, self.idleFrames[math.floor(
                                   currentFrame % self.animationFrames[1] + 1)],
                               self.x, self.y, 0, self.imageScale,
                               self.imageScale)
        else
            love.graphics.draw(self.Idleimage, self.idleFrames[math.floor(
                                   currentFrame % self.animationFrames[1] + 1)],
                               self.x, self.y, 0, -self.imageScale,
                               self.imageScale, self.width, 0)
        end

    else
        if (facing == 0) then
            love.graphics.draw(self.movingImage, self.movingFrames[math.floor(
                                   currentFrame % self.animationFrames[2] + 1)],
                               self.x, self.y, 0, self.imageScale,
                               self.imageScale)
        else
            love.graphics.draw(self.movingImage, self.movingFrames[math.floor(
                                   currentFrame % self.animationFrames[2] + 1)],
                               self.x, self.y, 0, -self.imageScale,
                               self.imageScale, self.width, 0)
        end

    end
end

function Player:tp(num1, num2)
    self.x = num1
    self.y = num2
    map.world:update(self, num1, num2)
end

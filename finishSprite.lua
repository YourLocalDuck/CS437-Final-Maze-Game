Finish = Sprite:extend()

function Finish:new()
    self.x = 400
    self.y = 4200
    self.width = 200
    self.height = 200
    self.dx = 0
    self.dy = 0
    self.ddx = 0
    self.ddy = 0
    self.imageScale = 1
    map.world:add("finish", self.x, self.y, self.width*self.imageScale, self.height*self.imageScale)

    Signal.register('win', function()
        map.world:remove("finish")
    end
    )
end

function Finish:draw()
    love.graphics.setColor(47,49,79)
    love.graphics.rectangle("fill", self.x, self.y, 200, 200)
    love.graphics.setColor(255,255,255)
end
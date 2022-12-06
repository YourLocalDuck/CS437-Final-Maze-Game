Sprite = Object:extend()

function Sprite:new(image)
    self.image = image;
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.x = 100
    self.y = 100
    self.dx = 0
    self.dy = 0
    self.ddx = 0
    self.ddy = 0
    self.imageScale = 1
    map.world:add(self, self.x, self.y, self.width, self.height)
end

function Sprite:update(dt) -- Bound Checks
    self:basicSpritePhysics()
end

function Sprite:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Sprite:basicSpritePhysics()
    self.dx = self.dx + self.ddx
    self.dy = self.dy + self.ddy
    self.x = self.x + self.dx
    self.y = self.y + self.dy
end

function Sprite:bound_CheckX()
    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0

    elseif self.x > window_width - self.width*self.imageScale then
        self.x = window_width - self.width*self.imageScale
    end
end

function Sprite:bound_CheckY()
    local window_height = love.graphics.getHeight()

    if self.y > window_height - self.height*self.imageScale then
        self.y = window_height - self.height*self.imageScale

    elseif self.y < 0 then
        self.y = 0
    end
end

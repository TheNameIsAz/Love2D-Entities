local AnimatedSprite = require('animatedSprite')
local Entity = {}

function Entity.new(name, x, y, max_speed, animationSpeed, direction, state, spriteFormat)
    local obj = {}
    obj.name = name
    obj.x = x
    obj.y = y
    obj.vx = 0
    obj.vy = 0
    obj.max_speed = max_speed
    obj.animationSpeed = animationSpeed
    obj.direction = direction
    obj.state = state
    obj.tileID = 0
    obj.spriteFormat = spriteFormat
    obj.checkstate = state
    
    function obj:getTest()
        return self.test
    end

    function obj.loadSprite()
        obj.sprite = AnimatedSprite.new(obj.x, obj.y, 0, 1, 1, obj.name..'_'..obj.state..'.png', obj.spriteFormat[1], obj.spriteFormat[2], obj.animationSpeed)
    end

    obj.loadSprite()

    function obj:setSpriteFormat(nbCols, nbLines)
        self.spriteFormat = {nbCols, nbLines}
    end

    function obj:updateMove(dt)
        -- Prevents VX from exceeding value of 'max_speed'
        if self.vx >= self.max_speed then
            self.vx = self.max_speed
        end
        -- Prevents VY from exceeding value of 'max_speed'
        if self.vy >= self.max_speed then
            self.vy = self.max_speed
        end
        -- Moves the entity
        self.x = self.x + (self.vx * dt)
        self.y = self.y + (self.vy * dt)
    end

    function obj:updateState()
        if self.state ~= self.checkState then
            self.loadSprite()
            self.checkState = self.state
        end
    end

    function obj:update(dt)
        self:updateState()
        self:updateMove(dt)
        self.sprite:update(dt)
        self.sprite.x = self.x
        self.sprite.y = self.y
    end

    function obj:isMoving()
        return not self.vx == 0 or not self.vy == 0
    end

    function obj:setState(state)
        self.state = state
    end

    function obj:draw()
        self.sprite:draw()
    end

    function obj:keypressed(key)

    end
    
    return obj
end

return Entity
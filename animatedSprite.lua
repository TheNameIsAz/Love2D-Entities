local Sprite = require('sprite')
local AnimatedSprite = {}

function AnimatedSprite.new(x, y, rotation, scaleX, scaleY, srcImage, srcColumns, srcLines, animationSpeed)
    local sprite = Sprite.new(x, y, rotation, scaleX, scaleY, srcImage)
    sprite.srcColumns = srcColumns
    sprite.srcLines = srcLines
    sprite.animationSpeed = animationSpeed
    sprite.currentFrame = 1
    sprite.stopped = false
    
    function sprite.fillFrames(self)
        self.frames = {}
        -- Width of frame : Sprite Width / Num of Columns
        local frameWidth = self.srcImage:getWidth() / self.srcColumns
        -- Height of frame : Sprite Height / Num of Lines
        local frameHeight = self.srcImage:getHeight() / self.srcLines

        local i = 1
        local line, col
        for line = 1, self.srcLines do
            for col = 1, self.srcColumns do
                self.frames[i] = love.graphics.newQuad((col - 1) * frameWidth, (line - 1) * frameHeight, frameWidth, frameHeight, self.srcImage:getWidth(), self.srcImage:getHeight())
                i = i + 1
            end
        end
    end

    sprite.fillFrames(sprite)

    function sprite:update(dt)
        if not self.stopped then
            self.currentFrame = self.currentFrame + self.animationSpeed * dt
            if self.currentFrame >= #self.frames + 1 then
                self.currentFrame = 1
            end
        end
    end

    function sprite:stopAtFrame(frameID)
        if not self.stopped and self.currentFrame >= frameID + 1 then
            self.currentFrame = frameID
            self.stopped = true
        end
    end

    function sprite:draw()
        local roundedFrame = math.floor(self.currentFrame)
        love.graphics.draw(self.srcImage, self.frames[roundedFrame], self.x, self.y, self.rotation, self.scaleX, self.scaleY, (self.srcImage:getWidth() / self.srcColumns) / 2, (self.srcImage:getHeight() / self.srcLines) / 2)
    end

    return sprite
end

return AnimatedSprite
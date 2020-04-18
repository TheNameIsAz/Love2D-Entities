local Sprite = {}

function Sprite.new(x, y, rotation, scaleX, scaleY, srcImage)
    local sprite = {}
        sprite.x = x
        sprite.y = y
        sprite.rotation = rotation
        sprite.scaleX = scaleX
        sprite.scaleY = scaleY
        sprite.srcImage = love.graphics.newImage('images/'..srcImage)
        
    function sprite:draw()
        love.graphics.draw(self.srcImage, self.x, self.y, self.rotation, self.scaleX, self.scaleY, self.srcImage:getWidth()/2, self.srcImage:getHeight() / 2)
    end
    
    function sprite:rotate(degrees)
        self.rotate = math.rad(degrees)
    end

    function sprite:scale(scaleX, scaleY)
        self.scaleX = scaleX
        self.scaleY = scaleY
    end

    return sprite
end

return Sprite
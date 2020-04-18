local Entity = require('entity')
local myEntity, myEntity2 = {}
function love.load()
    myEntity = Entity.new('player', 150, 195, 10, 17.5, 1, 'walk', {8, 1})
    myEntity2 = Entity.new('enemy', 150, 305, 10, 17.5, 1, 'run', {12, 8})
end

function love.update(dt)
    myEntity:update(dt)
    myEntity2:update(dt)
end

function love.draw()
    myEntity:draw()
    myEntity2:draw()
end

-- @TODO : Keyboard controls
-- function love.keypressed(key)
--     myEntity.keypressed(key)
--     myEntity2.keypressed(key)
-- end
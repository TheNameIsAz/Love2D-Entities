local Map = {}

function Map.new(grid, tileSheet)
    local map = {}
    map.grid = grid or { {1,1,1,1,1,1,1,1,1,1 } }
    map.tileSheet = tileSheet
    map.tileWidth = 32 
    map.tileHeight = 32
    map.width = 32 -- In number of tiles
    map.height = 23 -- In number of tiles
    map.tileTextures = {}
    map.mousePosition = {}
    map.mouseTileID = 0 -- Default value

    local sheetCol = map.tileSheet:getWidth() / map.tileWidth
    local sheetLine = map.tileSheet:getHeight() / map.tileHeight
    local l, c
    local id = 1
    -- Set the texture at ID 0 to nil (blank)
    map.tileTextures[0] = nil

    for l = 1, sheetLine do
        for c = 1, sheetCol do
            map.tileTextures[id] = love.graphics.newQuad((c-1) * map.tileWidth, (l-1) * map.tileHeight, map.tileWidth, map.tileHeight, map.tileSheet:getWidth(), map.tileSheet:getHeight())
            id = id + 1
        end
    end

    function map:draw()
        local line
        local col

        for line = 1, self.height do
            for col = 1, self.width do
                local tileID = self.grid[line][col]
                local tileTexture = self.tileTextures[tileID]

                if tileTexture ~= nil then
                    love.graphics.draw(self.tileSheet, tileTexture, (col-1) * self.tileWidth, (line-1) * self.tileHeight)
                end
            end
        end

        self:drawMouse()
    end

    function map:drawMouse()
        love.graphics.print('ID du Tile : '..tostring(self.mouseTileID),15, 15)
    end

    function map:update(dt)
        self:updateMouse(dt)
    end

    function map:updateMouse(dt)
        self.mousePosition = {
            x = love.mouse.getX(),
            y = love.mouse.getY()
        }
        local line = math.floor(self.mousePosition.y / self.tileHeight) + 1
        local col = math.floor(self.mousePosition.x / self.tileWidth) + 1

        if line > 0 and line <= self.height and col > 0 and col <= self.width then
            self.mouseTileID = self.grid[line][col]
        else
            love.graphics.print('OUT OF MAP!!1!')
        end
    end


    return map
end

return Map
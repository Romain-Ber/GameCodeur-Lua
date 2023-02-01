local Game = {}

local Map_Width = 10
local Map_Height = 10
local Tile_Width = 70
local Tile_Height = 70

Game.Map = {}

Game.TileTextures = {}

function Game.Load()
    print("Game: loading textures...")
    Game.TileTextures[0] = nil
    Game.TileTextures[1] = love.graphics.newImage("images/grassCenter.png")
    Game.TileTextures[2] = love.graphics.newImage("images/liquidLava.png")
    Game.TileTextures[3] = love.graphics.newImage("images/liquidWater.png")
    Game.TileTextures[4] = love.graphics.newImage("images/snowCenter.png")
    Game.TileTextures[5] = love.graphics.newImage("images/stoneCenter.png")
    print("Game: textures loaded!")
end

function Game.Draw()
    local x, y
    for y = 1, Map_Height do
        for x = 1, Map_Width do
            local id = Game.Map[y][x]
            local tex = Game.TileTextures[id]
            if tex ~= nil then
                love.graphics.draw(tex, (x - 1) * Tile_Width, (y - 1) * Tile_Height)
            end
        end
    end
end

return Game
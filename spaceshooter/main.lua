--- console feedback during execution
io.stdout:setvbuf('no')

--- necessary for pixel art
love.graphics.setDefaultFilter("nearest")

local myGame = require("game")

function love.load()
    screenX = love.graphics.getWidth()
    screenY = love.graphics.getHeight()
    myGame.Load()
end

function love.update(dt)

end

function love.draw()
    myGame.Draw()
end

function love.keypressed(key)
    print(key)
end
Pad1 = {x = 1, y = 1, width = 20, height = 80}
Pad2 = {x = 1, y = 1, width = 20, height = 80}
Ball = {x = 0, y = 0, width = 20, height = 20, velocityX = 2, velocityY = 2}
screenX = 0
screenY = 0
ScoreP1 = 0
ScoreP2 = 0

function love.load()
    screenX = love.graphics.getWidth()
    screenY = love.graphics.getHeight()
    Pad2.x = screenX - Pad2.width
    Ball.x= screenX/2-Ball.width/2
    Ball.y= screenY/2-Ball.height/2
end

function love.update()
    if love.keyboard.isDown("s") and Pad1.y < screenY - 80 then
        Pad1.y = Pad1.y +3
    end
    if love.keyboard.isDown("w") and Pad1.y > 0 then
        Pad1.y = Pad1.y -3
    end
    if love.keyboard.isDown("down") and Pad2.y < screenY - 80 then
        Pad2.y = Pad2.y +3
    end
    if love.keyboard.isDown("up") and Pad2.y>0 then
        Pad2.y = Pad2.y -3
    end
    Ball.x = Ball.x + Ball.velocityX
    Ball.y = Ball.y + Ball.velocityY
    if Ball.x == screenX-Ball.width then
        Ball.velocityX = - Ball.velocityX
        ScoreP1 = ScoreP1 + 1
        Ball.x= screenX/2-Ball.width/2
        Ball.y= screenY/2-Ball.height/2
    end
    if Ball.x == 0 then
        Ball.velocityX = - Ball.velocityX
        ScoreP2 = ScoreP2 + 1
        Ball.x= screenX/2-Ball.width/2 
        Ball.y= screenY/2-Ball.height/2
    end
    if Ball.y == screenY - Ball.height then
        Ball.velocityY = - Ball.velocityY
    end
    if Ball.y == 0 then
        Ball.velocityY = - Ball.velocityY
    end
    if Ball.x == Pad1.width and Ball.y > Pad1.y - Ball.height and Ball.y < Pad1.y + Pad1.height then
        Ball.velocityX = -Ball.velocityX
    end
    if Ball.x == screenX - Pad2.width - Ball.width and Ball.y > Pad2.y - Ball.height and Ball.y < Pad2.y + Pad2.height then
        Ball.velocityX = -Ball.velocityX
    end
end

function love.draw()
    love.graphics.rectangle("fill",Pad1.x,Pad1.y,Pad1.width,Pad1.height)
    love.graphics.rectangle("fill",Pad2.x,Pad2.y,Pad2.width,Pad2.height)
    love.graphics.rectangle("fill",Ball.x,Ball.y,Ball.width,Ball.height)
    love.graphics.printf(ScoreP1.." - "..ScoreP2, screenX/2,20,200,center)
end
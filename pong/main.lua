pad1 = {x = 1, y = 1, width = 20, height = 80}
pad2 = {x = 1, y = 1, width = 20, height = 80}
ball = {x = 0, y = 0, width = 20, height = 20, velocityX = 3, velocityY = 3}
screenX = 0
screenY = 0
scoreP1 = 0
scoreP2 = 0

function love.load()
    screenX = love.graphics.getWidth()
    screenY = love.graphics.getHeight()
    pad2.x = screenX - pad2.width
    ball.x = screenX / 2 - ball.width / 2
    ball.y = screenY / 2 - ball.height / 2
end

function love.update()
    if love.keyboard.isDown("s") and pad1.y < screenY - 80 then
        pad1.y = pad1.y + 3
    end
    if love.keyboard.isDown("w") and pad1.y > 0 then
        pad1.y = pad1.y - 3
    end
    if love.keyboard.isDown("down") and pad2.y < screenY - 80 then
        pad2.y = pad2.y + 3
    end
    if love.keyboard.isDown("up") and pad2.y > 0 then
        pad2.y = pad2.y - 3
    end
    ball.x = ball.x + ball.velocityX
    ball.y = ball.y + ball.velocityY
    if ball.x > screenX-ball.width then
        ball.velocityX = - ball.velocityX
        scoreP1 = scoreP1 + 1
        ball.x = screenX / 2 - ball.width / 2
        ball.y = screenY / 2 - ball.height / 2
    end
    if ball.x < 0 then
        ball.velocityX = - ball.velocityX
        scoreP2 = scoreP2 + 1
        ball.x = screenX / 2 - ball.width / 2
        ball.y = screenY / 2 - ball.height / 2
    end
    if ball.y > screenY - ball.height then
        ball.velocityY = - ball.velocityY
    end
    if ball.y < 0 then
        ball.velocityY = - ball.velocityY
    end
    if ball.x == pad1.width and ball.y > pad1.y - ball.height and ball.y < pad1.y + pad1.height then
        ball.velocityX = - ball.velocityX
    end
    if ball.x == screenX - pad2.width - ball.width and ball.y > pad2.y - ball.height and ball.y < pad2.y + pad2.height then
        ball.velocityX = - ball.velocityX
    end
end

function love.draw()
    love.graphics.rectangle("fill", pad1.x, pad1.y, pad1.width, pad1.height)
    love.graphics.rectangle("fill", pad2.x, pad2.y, pad2.width, pad2.height)
    love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)
    love.graphics.printf(scoreP1.." - "..scoreP2, screenX / 2, 20, 200, center)
end

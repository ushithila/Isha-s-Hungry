function loadendScreen() 
end

function updateendScreen(dt)    
end

function drawendScreen()
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(font)
    love.graphics.setColor(0,0,0)
    love.graphics.print("TIMES UP!",love.graphics.getWidth()/2 - 120, love.graphics.getHeight()/2 - 70)
    love.graphics.setFont(font3)
    love.graphics.setColor(1,0,0)
    love.graphics.print("FINAL SCORE: " .. math.ceil(score), love.graphics.getWidth() / 2 - 120, love.graphics.getHeight() / 2 - 20)
    love.graphics.setColor(1,1,1)
end
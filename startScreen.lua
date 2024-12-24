function loadstartScreen()
    font = love.graphics.newFont('PixelGame-R9AZe.otf', 58)
    font1 = love.graphics.newFont('PixelGame-R9AZe.otf', 30)

end

function updatestartScreen(dt)
end

function drawstartScreen()
    love.graphics.setFont(font)
    love.graphics.setColor(0,0,0)
    love.graphics.print("Isha's Hungry!", love.graphics.getWidth()/2 - 145, love.graphics.getHeight()/2 - 50)
    font = love.graphics.newFont('PixelGame-R9AZe.otf', 58)
    love.graphics.setFont(font1)
    love.graphics.setColor(1,0,0)
    love.graphics.print("Press Space to Play!", love.graphics.getWidth()/2 - 120, love.graphics.getHeight()/2 + 10)
    love.graphics.setColor(1,1,1)
end
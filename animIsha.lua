function loadIsha()
    anim8 = require 'anim8'

    player = {}
        player.x = love.graphics.getWidth() / 2;
        player.y = love.graphics.getHeight() / 2 + 150;
        player.speed = 200;
        player.spriteSheet = love.graphics.newImage('isha_sheet.png');
        player.grid = anim8.newGrid(104, 104, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations = {}
    player.animations.right = anim8.newAnimation(player.grid('1-4', 2), 0.1)
    player.animations.left = anim8.newAnimation(player.grid('1-4', 1), 0.1)

    player.anim = player.animations.right
end

function updateIsha(dt)
    isMoving = false
    if love.keyboard.isDown("right") then 
        player.x = player.x + player.speed * dt
        player.anim = player.animations.right
        isMoving = true
    end
    
    if love.keyboard.isDown("left") then 
        player.x = player.x - player.speed * dt
        player.anim = player.animations.left
        isMoving = true
    end

    if player.x <= -8 then 
        player.x = player.x + player.speed * dt
    end

    if player.x + 96 >= love.graphics.getWidth() then 
        player.x = player.x - player.speed * dt
    end

    if isMoving == false then 
        player.anim:gotoFrame(1)
    end
    
    player.anim:update(dt)   
end
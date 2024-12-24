require 'animIsha'

function loadgameScreen()
    love.math.random(os.time())
    loadIsha()
    isRunning = false
    countDown = 3
    timer = 60
    time = 0 -- spawn timer
    score = 0
    font4 = love.graphics.newFont('PixelGame-R9AZe.otf', 60)
    font5 = love.graphics.newFont('PixelGame-R9AZe.otf', 30)

    --objects 
    randObjects = {}

    objectSpeed = {
        meat = 200,
        water = 200,
        sushi = 200,
        burger = 200,
        milk = 150, 
        taco = 150,
        dumpling = 150,
        pizza = 150,
        candy = 150,
        pepper = 151,
        pineapple = 151,
        tomato = 151,
        clock = 275,
    }

    images = loadImage()
end

function loadImage()
    local image = {}

    for name, speed in pairs(objectSpeed) do 
        image[name] = love.graphics.newImage(name .. ".png")
    end

    return image
end

function spawnObject()
    local names = {}

    for name in pairs(images) do
        table.insert(names, name)
    end

    local rand = names[love.math.random(1, #names)]

    local obj = {
        image = images[rand],
        x = love.math.random(0, love.graphics.getWidth() - images[rand]:getWidth()),
        y = -100,
        speed = objectSpeed[rand],
    }

    table.insert(randObjects, obj)
end


function updategameScreen(dt)
    updateIsha(dt)
    countDown = countDown - dt
    if countDown <= 0 then 
        countDown = 0
        isRunning = true
    end

    if isRunning then
        --timer
        timer = timer - dt

        if timer <= 0 then 
            timer = 0
            isRunning = false
            currentScreen = 'end'
        end

        --spawn timer
        time = time + dt             
        if time >= 0.7 then
            time = 0
            spawnObject()
        end

        --objects falling 
        for _, obj in ipairs(randObjects) do
            obj.y = obj.y + obj.speed* dt

            if checkCollision(obj) then

                if obj.speed ==  150 then
                    score = score + 1
                end
                if obj.speed ==  200 then
                    score = score + 2
                end
                if obj.speed == 151 then 
                    score = score - 2
                end
                if obj.speed == 275 then 
                    timer = timer + 5
                end
            end

        end
    end
end

function checkCollision(b)
    return player.x  - 15 < b.x and
           player.x + player.spriteSheet:getWidth() / 4 > b.x and
           player.y - 40 < b.y and
           player.y + player.spriteSheet:getHeight() / 4  - 40 > b.y
end

function drawgameScreen()
    player.anim:draw(player.spriteSheet, player.x, player.y)
    if not isRunning then 
        love.graphics.setFont(font4)
        love.graphics.print(math.ceil(countDown), love.graphics.getWidth()/2 - 30, love.graphics.getHeight()/2 - 50)
    end        

    --when countDown is done
    if isRunning then
        love.graphics.setColor(0,0,0)
        love.graphics.setFont(font5)
        love.graphics.print("Time Left:" .. math.ceil(timer), 10, 10)
        love.graphics.print("Current Score:" .. math.ceil(score), 600, 10)
        love.graphics.setColor(1,1,1)

        --drawing objects
        for i = #randObjects, 1, -1 do
            local obj = randObjects[i]
            love.graphics.draw(obj.image, obj.x, obj.y)
            
            --collision
            if checkCollision(obj) then
                table.remove(randObjects, i)
            end

            if obj.y > love.graphics.getHeight() then 
                table.remove(randObjects, i)
            end

        end

    end
end
require 'startScreen'
require 'ruleScreen'
require 'gameScreen'
require 'endScreen'

currentScreen = 'main'

function love.keypressed(key)
    if key == 'space' then 
        if currentScreen == 'main' then 
            currentScreen = 'rule'
        elseif currentScreen == 'rule' then 
            currentScreen = 'game'
        end
    end
end

function love.load()
    love.window.setMode(800, 600)   
    love.window.setTitle("Isha's Hungry!")
    background = love.graphics.newImage("background.png")
    loadstartScreen()
    loadruleScreen()
    loadgameScreen()
    loadendScreen()
end

function love.update(dt)
    if currentScreen == 'main' then 
        updatestartScreen(dt)
    elseif currentScreen == 'rule' then 
        updateruleScreen(dt)
    elseif currentScreen == 'game' then 
        updategameScreen(dt)
    elseif currentScreen == 'end' then 
        updateendScreen(dt)
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    if currentScreen == 'main' then 
        drawstartScreen()
    elseif currentScreen == 'rule' then 
        drawruleScreen()
    elseif currentScreen == 'game' then 
        drawgameScreen()
    elseif currentScreen == 'end' then 
        drawendScreen()
    end
end
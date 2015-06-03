local sti = require("lib/sti")
local anim8 = require("lib/anim8")

function love.load()
    map = sti.new("assets/maps/level")
    heroSprites = love.graphics.newImage("assets/spritesheets/pimple.gif")
    movementGrid = anim8.newGrid(58, 80, heroSprites:getWidth(), heroSprites:getHeight(), 0, 0, 3)
    stillGrid = anim8.newGrid(41, 70, heroSprites:getWidth(), heroSprites:getHeight(), 157, 0, 8)

    player = {
      spritesheet = heroSprites,
      x = 60,
      y = 382,
      speed = 80,
      animations = {
        still = anim8.newAnimation(stillGrid('1-2', 1), 1.0),
        right = anim8.newAnimation(movementGrid('1-5', 2), 0.1),
        left = anim8.newAnimation(movementGrid('1-5', 3), 0.1)
      },
    }
    player.animation = player.animations.still

    love.graphics.setBackgroundColor(127, 117, 137)
end

function love.draw()
    map:draw()
    player.animation:draw(player.spritesheet, player.x, player.y)
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + (player.speed * dt)
        player.animation = player.animations.right
    elseif love.keyboard.isDown("left") then
        player.x = player.x - (player.speed * dt)
        player.animation = player.animations.left
    else
        player.animation = player.animations.still
    end

    map:update(dt)
    player.animation:update(dt)
end

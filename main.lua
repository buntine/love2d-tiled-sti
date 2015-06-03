local sti = require("lib/sti")
local anim8 = require("lib/anim8")

function love.load()
    map = sti.new("assets/maps/level")
    heroSprites = love.graphics.newImage("assets/spritesheets/pimple.gif")
    movementGrid = anim8.newGrid(60, 85, heroSprites:getWidth(), heroSprites:getHeight())
    stillGrid = anim8.newGrid(41, 70, heroSprites:getWidth(), heroSprites:getHeight(), 157, 0, 8)

    player = {
      spritesheet = heroSprites,
      x = 60,
      y = 379,
      speed = 50,
      animations = {
        still = anim8.newAnimation(stillGrid('1-2', 1), 1.0),
        left = anim8.newAnimation(movementGrid('1-5', 2), 0.2),
        right = anim8.newAnimation(movementGrid('1-5', 3), 0.2)
      },
    }
    player.animation = player.animations.left

    love.graphics.setBackgroundColor(127, 117, 137)
end

function love.draw()
    map:draw()
    player.animation:draw(player.spritesheet, player.x, player.y)
end

function love.update(dt)
    map:update(dt)
    player.animation:update(dt)
end

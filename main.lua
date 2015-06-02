local sti = require("lib/sti")
local anim8 = require("lib/anim8")

function love.load()
    map = sti.new("assets/maps/level")
    heroSprites = love.graphics.newImage("assets/spritesheets/pimple.gif")
    heroGrid = anim8.newGrid(65, 70, 590, 85)

    player = {
      spritesheet = heroSprites,
      x = 60,
      y = 100,
      speed = 50,
      animations = {
        still = anim8.newAnimation(heroGrid(1, '1-4'), 0.5),
        left = anim8.newAnimation(heroGrid(2, '1-5'), 0.2),
        right = anim8.newAnimation(heroGrid(2, '1-5'), 0.2)
      },
    }
    player.animation = player.animations.still

    love.graphics.setBackgroundColor(127, 117, 137)
end

function love.draw()
    map:draw()
end

function love.update(dt)
    map:update(dt)
end

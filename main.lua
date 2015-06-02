local sti = require("lib/sti")
local anim8 = require("lib/anim8")

function love.load()
    map = sti.new("assets/maps/level")
    love.graphics.setBackgroundColor(127, 117, 137)
end

function love.draw()
    map:draw()
end

function love.update(dt)
    map:update(dt)
end

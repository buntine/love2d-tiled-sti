local sti = require("lib/sti")

function love.load()
    map = sti.new("assets/maps/level")
end

function love.draw()
    map:draw()
end

function love.update(dt)
    map:update(dt)
end

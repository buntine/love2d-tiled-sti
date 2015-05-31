function love.conf(t)
    t.modules.audio = true
    t.modules.sound = true
    t.modules.keyboard = true
    t.modules.event = true
    t.modules.image = true
    t.modules.graphics = true
    t.modules.timer = true
    t.modules.thread = true
    t.modules.physics = true

    t.title = "Platformer training"
    t.window.fullscreen = false
    t.window.vsync = false
    t.window.fsaa = false
    t.window.width = 900
    t.window.height = 500
end

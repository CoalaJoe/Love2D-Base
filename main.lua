platform = {}
require "lib/game/player"
require "lib/helper/input"

function love.load()
    -- Construct world
    platform.width = love.graphics.getWidth()
    platform.height = love.graphics.getHeight()
    platform.x = 0
    platform.y = platform.height / 2

    player.load()

    input.load()
    input.left = { 'a', 'left' }
    input.right = { 'd', 'right' }
    input.jump = {'space', 'w', 'up'}
end

function love.update(dt)
    player.update(dt)
end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)
    player.draw()
end

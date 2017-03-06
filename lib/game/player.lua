player = {}

function player.load()
    -- Construct Player
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2
    player.img = love.graphics.newImage('assets/images/player.png') --600x450
    player.speed = 200
    player.scale = 1 / 4
    player.ground = player.y
    player.y_velocity = 0
    player.jump_force = -300
    player.gravity = -700
end

function player.update(dt)
    -- Player movement
    if love.keyboard.isDown(input:get('left')) and love.keyboard.isDown(input:get('right')) then
        -- Don't move
    elseif player.x > 0 and love.keyboard.isDown(input:get('left')) then
        player.x = player.x - (player.speed * dt)
    elseif player.x < (love.graphics:getWidth() - player.img:getWidth() * player.scale) and love.keyboard.isDown(input:get('right')) then
        player.x = player.x + (player.speed * dt)
    end
    -- Player jump
    if love.keyboard.isDown(input:get('jump')) then
        if player.y_velocity == 0 then
            player.y_velocity = player.jump_force
        end
    end
    -- Player gravity
    if player.y_velocity ~= 0 then
        player.y = player.y + player.y_velocity * dt
        player.y_velocity = player.y_velocity - player.gravity * dt
    end

    -- Player stand on ground
    if player.y > player.ground then
        player.y_velocity = 0
        player.y = player.ground
    end
end

function player.draw()
    love.graphics.draw(player.img, player.x, player.y, 0, player.scale, player.scale, 0, player.img:getHeight())
end

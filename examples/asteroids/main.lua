local SCREEN_W = 800
local SCREEN_H = 600

local SHIP_SIZE = 14
local SHIP_ROT_SPEED = 3.5 -- radians/sec
local SHIP_THRUST = 220    -- px/sec^2
local SHIP_MAX_SPEED = 260 -- px/sec
local SHIP_DRAG = 0.6      -- fraction of velocity removed per second
local SHIP_COLLISION_RADIUS = 10
local INVINCIBLE_TIME = 2.0

local function wrap(v, max)
    if v < 0 then return v + max end
    if v >= max then return v - max end
    return v
end

local function clamp(v, lo, hi)
    if v < lo then return lo end
    if v > hi then return hi end
    return v
end

local function rotate_left_down()
    return ray.IsKeyDown(ray.KEY_LEFT) or ray.IsKeyDown(ray.KEY_A)
end

local function rotate_right_down()
    return ray.IsKeyDown(ray.KEY_RIGHT) or ray.IsKeyDown(ray.KEY_D)
end

local function thrust_down()
    return ray.IsKeyDown(ray.KEY_UP) or ray.IsKeyDown(ray.KEY_W)
end

local function reset_ship()
    State.ship = {
        x = SCREEN_W / 2,
        y = SCREEN_H / 2,
        angle = -math.pi / 2,
        vx = 0,
        vy = 0,
        invincible_timer = INVINCIBLE_TIME,
    }
end

local function update_ship(dt)
    local ship = State.ship

    if rotate_left_down() then ship.angle = ship.angle - SHIP_ROT_SPEED * dt end
    if rotate_right_down() then ship.angle = ship.angle + SHIP_ROT_SPEED * dt end

    if thrust_down() then
        ship.vx = ship.vx + math.cos(ship.angle) * SHIP_THRUST * dt
        ship.vy = ship.vy + math.sin(ship.angle) * SHIP_THRUST * dt
    end

    local drag = clamp(1 - SHIP_DRAG * dt, 0, 1)
    ship.vx = ship.vx * drag
    ship.vy = ship.vy * drag

    local speed = math.sqrt(ship.vx * ship.vx + ship.vy * ship.vy)
    if speed > SHIP_MAX_SPEED then
        local scale = SHIP_MAX_SPEED / speed
        ship.vx = ship.vx * scale
        ship.vy = ship.vy * scale
    end

    ship.x = wrap(ship.x + ship.vx * dt, SCREEN_W)
    ship.y = wrap(ship.y + ship.vy * dt, SCREEN_H)

    if ship.invincible_timer > 0 then
        ship.invincible_timer = ship.invincible_timer - dt
    end
end

local function draw_ship()
    local ship = State.ship

    if ship.invincible_timer > 0 and math.floor(ship.invincible_timer * 10) % 2 == 0 then
        return
    end

    local nose = {
        x = ship.x + math.cos(ship.angle) * SHIP_SIZE,
        y = ship.y + math.sin(ship.angle) * SHIP_SIZE,
    }
    local left = {
        x = ship.x + math.cos(ship.angle + 2.5) * SHIP_SIZE,
        y = ship.y + math.sin(ship.angle + 2.5) * SHIP_SIZE,
    }
    local right = {
        x = ship.x + math.cos(ship.angle - 2.5) * SHIP_SIZE,
        y = ship.y + math.sin(ship.angle - 2.5) * SHIP_SIZE,
    }

    ray.DrawTriangleLines(nose, right, left, ray.RAYWHITE)
end

local BULLET_SPEED = 480
local BULLET_TTL = 0.9
local BULLET_COOLDOWN = 0.01
local BULLET_RADIUS = 2
local MAX_BULLETS = 99

local function try_shoot()
    if not ray.IsKeyPressed(ray.KEY_SPACE) then return end
    if State.bullet_cooldown > 0 then return end
    if #State.bullets >= MAX_BULLETS then return end

    local ship = State.ship
    table.insert(State.bullets, {
        x = ship.x + math.cos(ship.angle) * SHIP_SIZE,
        y = ship.y + math.sin(ship.angle) * SHIP_SIZE,
        vx = math.cos(ship.angle) * BULLET_SPEED,
        vy = math.sin(ship.angle) * BULLET_SPEED,
        ttl = BULLET_TTL,
    })
    State.bullet_cooldown = BULLET_COOLDOWN
end

local function update_bullets(dt)
    if State.bullet_cooldown > 0 then
        State.bullet_cooldown = State.bullet_cooldown - dt
    end

    local alive = {}
    for _, bullet in ipairs(State.bullets) do
        bullet.x = bullet.x + bullet.vx * dt
        bullet.y = bullet.y + bullet.vy * dt
        bullet.ttl = bullet.ttl - dt
        if bullet.ttl > 0 then
            table.insert(alive, bullet)
        end
    end
    State.bullets = alive
end

local function draw_bullets()
    for _, bullet in ipairs(State.bullets) do
        ray.DrawCircle(bullet.x, bullet.y, BULLET_RADIUS, ray.RAYWHITE)
    end
end

local ASTEROID_SIZES = {
    large = { radius = 40, speed_min = 30, speed_max = 70, score = 20, child = "medium" },
    medium = { radius = 22, speed_min = 50, speed_max = 110, score = 50, child = "small" },
    small = { radius = 12, speed_min = 80, speed_max = 160, score = 100, child = nil },
}
local ASTEROID_SEGMENTS = 10

local function make_asteroid_shape(base_radius)
    local points = {}
    for i = 1, ASTEROID_SEGMENTS do
        local angle = (i - 1) * (2 * math.pi / ASTEROID_SEGMENTS)
        local radius = base_radius * (0.75 + math.random() * 0.5)
        table.insert(points, { angle = angle, radius = radius })
    end
    return points
end

local function spawn_asteroid(size, x, y)
    local def = ASTEROID_SIZES[size]
    local angle = math.random() * 2 * math.pi
    local speed = def.speed_min + math.random() * (def.speed_max - def.speed_min)

    return {
        x = x,
        y = y,
        vx = math.cos(angle) * speed,
        vy = math.sin(angle) * speed,
        size = size,
        rotation = 0,
        rotation_speed = (math.random() - 0.5) * 1.5,
        shape = make_asteroid_shape(def.radius),
    }
end

-- Spawning at a screen edge keeps new asteroids far from the ship, which
-- starts at screen center, without needing a separate distance check.
local function random_edge_position()
    local side = math.random(1, 4)
    if side == 1 then return math.random(0, SCREEN_W), 0 end
    if side == 2 then return math.random(0, SCREEN_W), SCREEN_H end
    if side == 3 then return 0, math.random(0, SCREEN_H) end
    return SCREEN_W, math.random(0, SCREEN_H)
end

local function spawn_wave(wave)
    local count = 3 + wave
    local speed_mult = 1 + (wave - 1) * 0.15

    for _ = 1, count do
        local x, y = random_edge_position()
        local asteroid = spawn_asteroid("large", x, y)
        asteroid.vx = asteroid.vx * speed_mult
        asteroid.vy = asteroid.vy * speed_mult
        table.insert(State.asteroids, asteroid)
    end
end

local function update_asteroids(dt)
    for _, asteroid in ipairs(State.asteroids) do
        asteroid.x = wrap(asteroid.x + asteroid.vx * dt, SCREEN_W)
        asteroid.y = wrap(asteroid.y + asteroid.vy * dt, SCREEN_H)
        asteroid.rotation = asteroid.rotation + asteroid.rotation_speed * dt
    end
end

local function draw_asteroids()
    for _, asteroid in ipairs(State.asteroids) do
        local points = {}
        for _, p in ipairs(asteroid.shape) do
            local a = p.angle + asteroid.rotation
            table.insert(points, {
                x = asteroid.x + math.cos(a) * p.radius,
                y = asteroid.y + math.sin(a) * p.radius,
            })
        end
        table.insert(points, points[1])
        ray.DrawLineStrip(points, ray.RAYWHITE)
    end
end

local START_LIVES = 3

local function split_asteroid(asteroid)
    local def = ASTEROID_SIZES[asteroid.size]
    State.score = State.score + def.score

    if def.child then
        for _ = 1, 2 do
            table.insert(State.asteroids, spawn_asteroid(def.child, asteroid.x, asteroid.y))
        end
    end
end

local function check_bullet_collisions()
    local consumed_bullets = {}
    local remaining_asteroids = {}

    for _, asteroid in ipairs(State.asteroids) do
        local def = ASTEROID_SIZES[asteroid.size]
        local range = def.radius + BULLET_RADIUS
        local hit_index = nil

        for bi, bullet in ipairs(State.bullets) do
            if not consumed_bullets[bi] then
                local dx = bullet.x - asteroid.x
                local dy = bullet.y - asteroid.y
                if dx * dx + dy * dy <= range * range then
                    hit_index = bi
                    break
                end
            end
        end

        if hit_index then
            consumed_bullets[hit_index] = true
            split_asteroid(asteroid)
        else
            table.insert(remaining_asteroids, asteroid)
        end
    end

    local remaining_bullets = {}
    for bi, bullet in ipairs(State.bullets) do
        if not consumed_bullets[bi] then
            table.insert(remaining_bullets, bullet)
        end
    end

    State.asteroids = remaining_asteroids
    State.bullets = remaining_bullets
end

local function check_ship_collision()
    local ship = State.ship
    if ship.invincible_timer > 0 then return end

    for _, asteroid in ipairs(State.asteroids) do
        local def = ASTEROID_SIZES[asteroid.size]
        local dx = ship.x - asteroid.x
        local dy = ship.y - asteroid.y
        local range = def.radius + SHIP_COLLISION_RADIUS

        if dx * dx + dy * dy <= range * range then
            State.lives = State.lives - 1
            if State.lives <= 0 then
                State.mode = "gameover"
            else
                reset_ship()
            end
            return
        end
    end
end

local function check_wave_complete()
    if #State.asteroids == 0 then
        State.wave = State.wave + 1
        spawn_wave(State.wave)
    end
end

local function update_playing(dt)
    update_ship(dt)
    try_shoot()
    update_bullets(dt)
    update_asteroids(dt)
    check_bullet_collisions()
    check_ship_collision()
    if State.mode == "playing" then
        check_wave_complete()
    end
end

local function start_game()
    State.mode = "playing"
    State.score = 0
    State.lives = START_LIVES
    State.bullets = {}
    State.bullet_cooldown = 0
    State.asteroids = {}
    State.wave = 1
    reset_ship()
    spawn_wave(State.wave)
end

local function draw_menu()
    local title = "ASTEROIDS"
    local title_size = 40
    local title_width = ray.MeasureText(title, title_size)
    ray.DrawText(title, (SCREEN_W - title_width) / 2, SCREEN_H / 2 - 60, title_size, ray.RAYWHITE)

    local prompt = "Press ENTER to start"
    local prompt_size = 20
    local prompt_width = ray.MeasureText(prompt, prompt_size)
    ray.DrawText(prompt, (SCREEN_W - prompt_width) / 2, SCREEN_H / 2, prompt_size, ray.RAYWHITE)
end

local function draw_playing()
    draw_ship()
    draw_bullets()
    draw_asteroids()
    ray.DrawText("Score: " .. State.score, 10, 10, 20, ray.RAYWHITE)
    ray.DrawText("Lives: " .. State.lives, SCREEN_W - 120, 10, 20, ray.RAYWHITE)
    ray.DrawText("Wave: " .. State.wave, SCREEN_W / 2 - 40, 10, 20, ray.RAYWHITE)
end

local function draw_gameover()
    local title = "GAME OVER"
    local title_size = 40
    local title_width = ray.MeasureText(title, title_size)
    ray.DrawText(title, (SCREEN_W - title_width) / 2, SCREEN_H / 2 - 80, title_size, ray.RED)

    local score_text = "Final Score: " .. State.score
    local score_size = 24
    local score_width = ray.MeasureText(score_text, score_size)
    ray.DrawText(score_text, (SCREEN_W - score_width) / 2, SCREEN_H / 2 - 20, score_size, ray.RAYWHITE)

    local prompt = "Press ENTER for menu"
    local prompt_size = 20
    local prompt_width = ray.MeasureText(prompt, prompt_size)
    ray.DrawText(prompt, (SCREEN_W - prompt_width) / 2, SCREEN_H / 2 + 30, prompt_size, ray.RAYWHITE)
end

function _init()
    ray.SetConfigFlags(ray.FLAG_WINDOW_HIGHDPI)
    ray.InitWindow(SCREEN_W, SCREEN_H, "Asteroids")
    ray.SetTargetFPS(60)
    math.randomseed(os.time())

    State = {
        mode = "menu",
        score = 0,
    }
end

function _update()
    ray.BeginDrawing()
    ray.ClearBackground(ray.BLACK)

    if State.mode == "menu" then
        if ray.IsKeyPressed(ray.KEY_ENTER) then
            start_game()
        end
        draw_menu()
    elseif State.mode == "playing" then
        local dt = ray.GetFrameTime()
        update_playing(dt)
        draw_playing()
    elseif State.mode == "gameover" then
        if ray.IsKeyPressed(ray.KEY_ENTER) then
            State.mode = "menu"
        end
        draw_gameover()
    end

    ray.EndDrawing()
end

function _destroy()
    ray.CloseWindow()
end

function _init()
    ray.InitWindow(600, 400, "Stress test")

    State = {
        Balls = {},
        Width = 600,
        Height = 400,
        Radius = 4
    }

    for i = 1, 4000 do
        add_ball()
    end
end

function wrap(v, min, max)
    local dif = max - min
    while v > max do v = v - dif end
    while v < min do v = v + dif end
    return v
end

function _update()
    ray.BeginDrawing()

    ray.ClearBackground(ray.RAYWHITE)

    local speed = 100 * ray.GetFrameTime()

    for i, ball in ipairs(State.Balls) do
        ball.x = wrap(ball.x + ball.vx, -State.Radius, State.Width + State.Radius)
        ball.y = wrap(ball.y + ball.vy, -State.Radius, State.Height + State.Radius)
        ray.DrawCircleV(ball, State.Radius, ray.BLUE)

        State.Balls[i] = ball
    end

    if ray.IsKeyDown(ray.KEY_W) or ray.IsKeyDown(ray.KEY_UP) then
        for i = 1, 10 do
            add_ball()
        end
    end
    if ray.IsKeyDown(ray.KEY_S) or ray.IsKeyDown(ray.KEY_DOWN) then
        for i = 1, 10 do
            remove_ball()
        end
    end

    ray.DrawRectangle(5, 5, 170, 18, ray.RAYWHITE)
    ray.DrawText("FPS: " .. ray.GetFPS(), 10, 10, 10, ray.BLACK)
    ray.DrawText("Balls: " .. #State.Balls, 100, 10, 10, ray.BLACK)

    ray.EndDrawing()
end

function _destroy()
    ray.CloseWindow()
end

function add_ball()
    table.insert(State.Balls, {
        x = math.random(0, ray.GetScreenWidth()),
        y = math.random(0, ray.GetScreenHeight()),
        vx = math.random() * 0.5 * (math.random() > 0.5 and 1 or -1) + 0.5,
        vy = math.random() * 0.5 * (math.random() > 0.5 and 1 or -1) + 0.5,
    })
end

function remove_ball()
    if #State.Balls == 0 then
        return
    end
    table.remove(State.Balls, #State.Balls)
end

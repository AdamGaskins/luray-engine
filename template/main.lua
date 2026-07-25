function _init()
    ray.InitWindow(600, 400, "Luray Window")
    ray.SetTargetFPS(60)

    State = {
        px = 50,
        py = 100
    }
end

function _update()
    ray.BeginDrawing()

    ray.ClearBackground(ray.RAYWHITE)
    ray.DrawText("Hello World!", 20, 20, 20, ray.BLACK)

    local speed = 100 * ray.GetFrameTime()
    if ray.IsKeyDown(ray.KEY_A) then State.px = State.px - speed end
    if ray.IsKeyDown(ray.KEY_D) then State.px = State.px + speed end
    if ray.IsKeyDown(ray.KEY_W) then State.py = State.py - speed end
    if ray.IsKeyDown(ray.KEY_S) then State.py = State.py + speed end

    ray.DrawCircle(State.px, State.py, 27, ray.BLACK)
    ray.DrawCircle(State.px, State.py, 25, ray.BLUE)

    ray.EndDrawing()
end

function _destroy()
    ray.CloseWindow()
end

local character
---@type Raylib.Camera2D
local camera = {
    offset = { x = 0, y = 0 },
    target = { x = 0, y = 0 },
    rotation = 0,
    zoom = 1.0
}
function _init()
    ray.InitWindow(640, 480, "Odin Lua Raylib")
    ray.SetTargetFPS(60)

    character = ray.LoadTexture("sprites/character_green_front.png")
end

SPEED = 100
local x = 0
function _update()
    ray.BeginDrawing()

    ray.ClearBackground(ray.RAYWHITE)
    ray.DrawText("Hello Raylib", 20, 20, 20, ray.BLUE)

    if ray.IsKeyDown(ray.KEY_D) then
        camera.offset.x = camera.offset.x + ray.GetFrameTime() * SPEED
        -- x = x + ray.GetFrameTime() * SPEED
    elseif ray.IsKeyDown(ray.KEY_A) then
        camera.offset.x = camera.offset.x - ray.GetFrameTime() * SPEED
        -- x = x - ray.GetFrameTime() * SPEED
    end

    ray.BeginMode2D(camera)
    do
        ray.DrawRectangle(x, 10, 50, 50, ray.BLACK)
    end
    ray.EndMode2D()

    local mousePos = ray.GetMousePosition()
    ray.DrawTextureV(character, mousePos, ray.WHITE)

    ray.EndDrawing()
end

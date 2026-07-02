function _init()
    ray.InitWindow(640, 480, "Odin Lua Raylib")
    ray.SetTargetFPS(60)

    SprCharacter = ray.LoadTexture("sprites/character_green_front.png")

    Character = { x = 0, y = 100 }
end

function _update()
    ray.BeginDrawing()

    ray.ClearBackground(ray.RAYWHITE)
    ray.DrawText("Hello Raylib!", 20, 20, 20, ray.GREEN)

    local speed = 10
    if ray.IsKeyDown(ray.KEY_A) then Character.x = Character.x - speed end
    if ray.IsKeyDown(ray.KEY_D) then Character.x = Character.x + speed end
    if ray.IsKeyDown(ray.KEY_W) then Character.y = Character.y - speed end
    if ray.IsKeyDown(ray.KEY_S) then Character.y = Character.y + speed end

    ray.DrawTextureV(SprCharacter, Character, ray.WHITE)

    ray.EndDrawing()
end

function _destroy()
    ray.UnloadTexture(SprCharacter)
    ray.CloseWindow()
end

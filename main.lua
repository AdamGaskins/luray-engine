local character

function _init()
    ray.InitWindow(640, 480, "Odin Lua Raylib")
    ray.SetTargetFPS(60)

    local img = ray.LoadImage("sprites/character_green_front.png")
    ray.ImageFlipVertical(img)
    ray.ImageBlurGaussian(img, 2)
    character = ray.LoadTextureFromImage(img)


    print(ray.LoadFileText("odinfmt.json"))
end

function _update()
    ray.BeginDrawing()

    ray.ClearBackground(ray.RAYWHITE)
    ray.DrawText("Hello Raylib", 20, 20, 20, ray.BLUE)

    ray.DrawTextureV(character, ray.GetMousePosition(), ray.WHITE)
    ray.DrawLineStrip({
        { x = 100, y = 0 },
        { x = 200, y = 200 },
        { x = 0,   y = 200 },
        { x = 50,  y = 100 },
    }, ray.RED)

    ray.EndDrawing()
end

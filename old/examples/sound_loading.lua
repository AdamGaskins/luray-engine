local screenWidth = 800
local screenHeight = 450
local music
local fxWav
local fxOgg

function _init()
    ray.InitWindow(screenWidth, screenHeight, "raylib [audio] example - sound loading");

    ray.InitAudioDevice()
    ray.SetTargetFPS(60)

    music = ray.LoadMusicStream("sounds/country.mp3")
    fxWav = ray.LoadSound("sounds/sound.wav")
    fxOgg = ray.LoadSound("sounds/target.ogg")

    ray.PlayMusicStream(music)
end

function _update()
    ray.UpdateMusicStream(music)

    if (ray.IsKeyPressed(ray.KEY_SPACE)) then
        ray.PlaySound(fxWav)
    end
    if (ray.IsKeyPressed(ray.KEY_ENTER)) then
        ray.PlaySound(fxOgg)
    end

    ray.BeginDrawing()

    ray.ClearBackground(ray.RAYWHITE)

    ray.DrawText("Press SPACE to PLAY the WAV sound!", 200, 180, 20, ray.LIGHTGRAY)
    ray.DrawText("Press ENTER to PLAY the OGG sound!", 200, 220, 20, ray.LIGHTGRAY)

    ray.EndDrawing()
end

function _destroy()
    ray.StopMusicStream(music)
    ray.UnloadMusicStream(music)
    ray.UnloadSound(fxWav)
    ray.UnloadSound(fxOgg)

    ray.CloseAudioDevice()
    ray.CloseWindow()
end

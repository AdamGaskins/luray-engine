local screenWidth = 800
local screenHeight = 450

local fonts = {}
local messages = {}
local spacings = {}
local positions = {}
local colors = {}

function _init()
    ray.InitWindow(screenWidth, screenHeight, "raylib [text] example - sprite fonts")

    fonts = {
        ray.LoadFont("sprite_fonts/alagard.png"),
        ray.LoadFont("sprite_fonts/pixelplay.png"),
        ray.LoadFont("sprite_fonts/mecha.png"),
        ray.LoadFont("sprite_fonts/setback.png"),
        ray.LoadFont("sprite_fonts/romulus.png"),
        ray.LoadFont("sprite_fonts/pixantiqua.png"),
        ray.LoadFont("sprite_fonts/alpha_beta.png"),
        ray.LoadFont("sprite_fonts/jupiter_crash.png"),
    }

    print(fonts[1])

    messages = { "ALAGARD FONT designed by Hewett Tsoi",
        "PIXELPLAY FONT designed by Aleksander Shevchuk",
        "MECHA FONT designed by Captain Falcon",
        "SETBACK FONT designed by Brian Kent (AEnigma)",
        "ROMULUS FONT designed by Hewett Tsoi",
        "PIXANTIQUA FONT designed by Gerhard Grossmann",
        "ALPHA_BETA FONT designed by Brian Kent (AEnigma)",
        "JUPITER_CRASH FONT designed by Brian Kent (AEnigma)" }

    spacings = { 2, 4, 8, 4, 3, 4, 4, 1 };

    for i = 1, #fonts do
        table.insert(positions, {
            x = screenWidth / 2.0 - ray.MeasureTextEx(fonts[i], messages[i], fonts[i].baseSize * 2.0, spacings[i]).x /
                2.0,
            y = 60.0 + fonts[i].baseSize + 45.0 * (i - 1),
        })
    end

    -- Small Y position corrections
    positions[3].y = positions[3].y + 8;
    positions[4].y = positions[4].y + 2;
    positions[7].y = positions[7].y + 8;

    colors = { ray.MAROON, ray.ORANGE, ray.DARKGREEN, ray.DARKBLUE, ray.DARKPURPLE, ray.LIME, ray.GOLD, ray.RED };

    ray.SetTargetFPS(60); -- Set our game to run at 60 frames-per-second
end

function _update()
    ray.BeginDrawing();

    ray.ClearBackground(ray.RAYWHITE);

    ray.DrawText("free sprite fonts included with raylib", 220, 20, 20, ray.DARKGRAY);
    ray.DrawLine(220, 50, 600, 50, ray.DARKGRAY);

    for i = 1, #fonts do
        ray.DrawTextEx(
            fonts[i],
            messages[i],
            positions[i],
            fonts[i].baseSize * 2.0,
            spacings[i],
            colors[i]
        );
    end

    ray.EndDrawing();
end

function _destroy()
    for i = 1, #fonts do
        ray.UnloadFont(fonts[i]);
    end
    ray.CloseWindow()
end

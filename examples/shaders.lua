local screenWidth = 800
local screenHeight = 450

local fudesumi
local raysan
---@type Raylib.Shader
local shader

local resolutionLoc
local fontSizeLoc

local fontSize = 9.0

local resolution

local circlePos
local circleSpeed = 1.0

local target

function _init()
    ray.InitWindow(screenWidth, screenHeight, "raylib [shaders] example - ascii rendering")

    -- Texture to test static drawing
    fudesumi = ray.LoadTexture("shaders/fudesumi.png")
    -- Texture to test moving drawing
    raysan = ray.LoadTexture("shaders/raysan.png")

    -- Load shader to be used on postprocessing
    shader = ray.LoadShader("", "shaders/ascii_fs.glsl")

    -- These locations are used to send data to the GPU
    resolutionLoc = ray.GetShaderLocation(shader, "resolution")
    fontSizeLoc = ray.GetShaderLocation(shader, "fontSize")

    -- Set the character size for the ASCII effect
    -- Fontsize should be 9 or more
    fontSize = 9.0

    -- Send the updated values to the shader
    resolution = { screenWidth, screenHeight }
    ray.SetShaderValue(shader, resolutionLoc, resolution, ray.SHADER_UNIFORM_VEC2)

    circlePos = { x = 40.0, y = screenHeight * 0.5 }
    circleSpeed = 1.0

    -- RenderTexture to apply the postprocessing later
    target = ray.LoadRenderTexture(screenWidth, screenHeight)

    ray.SetTargetFPS(60) -- Set our game to run at 60 frames-per-second
end

function _update()
    -- Update
    ----------------------------------------------------------------------------------
    circlePos.x = circlePos.x + circleSpeed
    if (circlePos.x > 200.0) or (circlePos.x < 40.0) then
        circleSpeed = circleSpeed * -1 -- Revert speed
    end

    if ray.IsKeyPressed(ray.KEY_LEFT) and (fontSize > 9.0) then
        fontSize = fontSize - 1 -- Reduce fontSize
    end
    if ray.IsKeyPressed(ray.KEY_RIGHT) and (fontSize < 15.0) then
        fontSize = fontSize + 1 -- Increase fontSize
    end

    -- Set fontsize for the shader
    ray.SetShaderValue(shader, fontSizeLoc, fontSize, ray.SHADER_UNIFORM_FLOAT)

    -- Draw
    ----------------------------------------------------------------------------------
    ray.BeginTextureMode(target)
    do
        ray.ClearBackground(ray.WHITE)

        -- Draw scene in our render texture
        ray.DrawTexture(fudesumi, 500, -30, ray.WHITE)
        ray.DrawTextureV(raysan, circlePos, ray.WHITE)
    end
    ray.EndTextureMode()

    ray.BeginDrawing()
    do
        ray.ClearBackground(ray.RAYWHITE)

        ray.BeginShaderMode(shader)
        -- Draw the scene texture (that we rendered earlier) to the screen
        -- The shader will process every pixel of this texture
        ray.DrawTextureRec(target.texture,
            { x = 0, y = 0, width = target.texture.width, height = -target.texture.height },
            { x = 0, y = 0 }, ray.WHITE)
        ray.EndShaderMode()

        ray.DrawRectangle(0, 0, screenWidth, 40, ray.BLACK)
        -- ray.DrawText(ray.TextFormat("Ascii effect - FontSize:%2.0f - [Left] -1 [Right] +1 ", fontSize), 120, 10, 20,
        -- ray.LIGHTGRAY)
        ray.DrawFPS(10, 10)
    end
    ray.EndDrawing()
    ----------------------------------------------------------------------------------
end

function _destroy()
    ray.UnloadRenderTexture(target) -- Unload render texture

    ray.UnloadShader(shader)        -- Unload shader
    ray.UnloadTexture(fudesumi)     -- Unload texture
    ray.UnloadTexture(raysan)       -- Unload texture

    ray.CloseWindow()
end

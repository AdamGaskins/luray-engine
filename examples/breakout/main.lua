function _init()
    ray.SetConfigFlags(ray.FLAG_WINDOW_HIGHDPI)
    ray.InitWindow(500, 500, "Breakout")
    ray.SetTargetFPS(60)

    State = {
        px = 50,

        paddle = {
            x = 50,
            y = 450,
            w = 104,
            h = 24,
        },

        ball = {
            x = 50,
            y = 50,
            w = 22,
            h = 22,
            vx = 400,
            vy = -100,
        }
    }

    Tex_Paddle = ray.LoadTexture("sprites/paddleBlu.png")
    Tex_Ball = ray.LoadTexture("sprites/ballGrey.png")
    Tex_Elements = {
        ray.LoadTexture("sprites/element_blue_rectangle.png"),
        ray.LoadTexture("sprites/element_green_rectangle.png"),
        ray.LoadTexture("sprites/element_grey_rectangle.png"),
        ray.LoadTexture("sprites/element_purple_rectangle.png"),
        ray.LoadTexture("sprites/element_red_rectangle.png"),
        ray.LoadTexture("sprites/element_yellow_rectangle.png"),
    }
end

function _update()
    local W = ray.GetScreenWidth()
    local DT = ray.GetFrameTime()

    -- paddle
    local speed = 400 * DT
    if ray.IsKeyDown(ray.KEY_A) then State.paddle.x = State.paddle.x - speed end
    if ray.IsKeyDown(ray.KEY_D) then State.paddle.x = State.paddle.x + speed end
    if State.paddle.x < 0 then State.paddle.x = 0 end
    if State.paddle.x + State.paddle.w > W then
        State.paddle.x = W - State.paddle.w
    end

    -- ball
    State.ball.x = State.ball.x + State.ball.vx * DT
    State.ball.y = State.ball.y + State.ball.vy * DT
    -- top
    if State.ball.y < 0 and State.ball.vy < 0 then
        State.ball.vy = -State.ball.vy
        State.ball.y = -State.ball.y
    end
    -- left
    if State.ball.x < 0 and State.ball.vx < 0 then
        State.ball.vx = -State.ball.vx
        State.ball.x = -State.ball.x
    end
    -- right
    if State.ball.x + State.ball.w > W and State.ball.vx > 0 then
        State.ball.vx = -State.ball.vx
        State.ball.x = W - State.ball.w - (State.ball.x + State.ball.w - W)
    end

    -- crossed paddle Y this frame
    if State.ball.y + State.ball.h - State.ball.vy < State.paddle.y and State.ball.y + State.ball.h >= State.paddle.y then
        -- within paddle X
        local paddleStart = State.paddle.x - State.ball.w
        local paddleEnd = State.paddle.x + State.paddle.w
        local paddleLocation = (State.ball.x - paddleStart) / (paddleEnd - paddleStart)

        if paddleLocation >= 0 and paddleLocation <= 1 then
            -- State.ball.vy = -State.ball.vy

            local ballspeed = math.sqrt(State.ball.vx * State.ball.vx + State.ball.vy * State.ball.vy)
            local newx, newy = PaddleBounceAngle(paddleLocation)
            State.ball.vy = newy * ballspeed
            State.ball.vx = newx * ballspeed
        end
    end

    -- dev reset
    if State.ball.y > ray.GetScreenHeight() then
        State.ball.y = 30
    end

    ray.BeginDrawing()

    ray.ClearBackground(ray.BLACK)

    ray.DrawTextureEx(Tex_Paddle, State.paddle, 0, 0.5, ray.WHITE)
    ray.DrawTextureEx(Tex_Ball, State.ball, 0, 0.5, ray.WHITE)
    -- ray.DrawText("" .. math.floor(paddleLocation * 100), State.ball.x, State.paddle.y, 20, ray.WHITE)

    ray.EndDrawing()
end

function _destroy()
    ray.CloseWindow()
end

-- cuts off the edges of the ellipse for bounce calculation
BOUNCE_COVERAGE = 0.75
-- make the bounces more or less sharp toward the edges (<1 = sharp, >1 shallow)
OVAL_HEIGHT = 1
function PaddleBounceAngle(ballX)
    local thetaMin = (1 - BOUNCE_COVERAGE) * (math.pi / 2)
    local thetaMax = math.pi - thetaMin

    local theta = thetaMin + ballX * (thetaMax - thetaMin)

    local x = -math.cos(theta)
    local y = -OVAL_HEIGHT * math.sin(theta)

    return x, y
end

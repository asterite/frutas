require 'src/dependencies'

function love.load()
  -- set love's default filter to "nearest-neighbor", which essentially
  -- means there will be no filtering of pixels (blurriness), which is
  -- important for a nice crisp, 2D look
  love.graphics.setDefaultFilter('nearest', 'nearest')

  -- seed the RNG so that calls to random are always random
  math.randomseed(os.time())

  -- set the application title bar
  love.window.setTitle('Frutas')

  -- initialize our virtual resolution, which will be rendered within our
  -- actual window no matter its dimensions
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true
  })

  -- initialize our nice-looking retro text fonts
  gFonts = {
      ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
      ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
      ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
  }
  love.graphics.setFont(gFonts['small'])
end

--[[
    Called whenever we change the dimensions of our window, as by dragging
    out its bottom corner, for example. In this case, we only need to worry
    about calling out to `push` to handle the resizing. Takes in a `w` and
    `h` variable representing width and height, respectively.
]]
function love.resize(w, h)
  push:resize(w, h)
end

--[[
    Called every frame, passing in `dt` since the last frame. `dt`
    is short for `deltaTime` and is measured in seconds. Multiplying
    this by any changes we wish to make in our game will allow our
    game to perform consistently across all hardware; otherwise, any
    changes we make will be applied as fast as possible and will vary
    across system hardware.
]]
function love.update(dt)
end

--[[
    Called each frame after update; is responsible simply for
    drawing all of our game objects and more to the screen.
]]
function love.draw()
  -- begin drawing with push, in our virtual resolution
  push:apply('start')

  -- display FPS for debugging; simply comment out to remove
  displayFPS()

  push:apply('end')
end

--[[
    Renders the current FPS.
]]
function displayFPS()
  -- simple FPS display across all states
  love.graphics.setFont(gFonts['small'])
  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end

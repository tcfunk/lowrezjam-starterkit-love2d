gfx = love.graphics

function love.load()
  -- Sweet, delicious pixels
  gfx.setDefaultFilter('nearest', 'nearest', 0)

  -- Font, attribution in readme
  font = gfx.newFont('fonts/minpix.ttf', 7)
  dbgText = gfx.newText(font, '')

  -- Store window w/h and scale factor
  windowWidth, windowHeight, windowFlags = love.window.getMode()
  gScaleX, gScaleY = windowWidth/64, windowHeight/64

  -- Create low-resolution canvas
  lowrezCanvas = gfx.newCanvas(64, 64)
end

function love.update()
  local fps = love.timer.getFPS()
  dbgText:set(fps..' fps')
end

function love.draw()
  -- Do all your drawing within this block
  gfx.setCanvas(lowrezCanvas)
    gfx.clear()

    -- Draw FPS in upper-right corner
    gfx.setColor(255, 255, 255)
    gfx.draw(dbgText, 0, 0)

  gfx.setCanvas()

  -- Draw the low-rez canvas on top of the normal one
  gfx.draw(lowrezCanvas, 0, 0, 0, gScaleX, gScaleY)
end

-- Enforce aspect ratio
function love.resize(x, y)
  love.window.setMode(x, x, windowFlags)
  gScaleX, gScaleY = x/64, x/64
end

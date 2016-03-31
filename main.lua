gfx = love.graphics

function love.load()
  rng = love.math.newRandomGenerator()

  windowWidth, windowHeight, _ = love.window.getMode()
  gScaleX, gScaleY = windowWidth/64, windowHeight/64

  -- Sweet, delicious pixels
  gfx.setDefaultFilter('nearest', 'nearest', 0)

  -- Create low-resolution canvas
  lowrezCanvas = gfx.newCanvas(64, 64)
end

function love.update()
end

function love.draw()
  -- Do all your drawing within this block
  gfx.setCanvas(lowrezCanvas)
    gfx.setColor(255, 255, 0, 255)
    gfx.rectangle('line', 8, 8, 48, 48)
  gfx.setCanvas()

  -- Draw the low-rez canvas on top of the normal one
  gfx.draw(lowrezCanvas, 0, 0, 0, gScaleX, gScaleY)
end

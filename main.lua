local lg = love.graphics

local img = lg.newImage("testimage.png")
local shader = lg.newShader("shaders/posterize.glsl")
local luma = 0

love.load = function ()
   love.window.setMode(img:getDimensions())
   lg.setShader(shader)
end

love.draw = function ()
   lg.setColor(luma, luma, luma)
   lg.draw(img)
   luma = (luma + 1) % 255
end

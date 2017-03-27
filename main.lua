local lg = love.graphics

local img = lg.newImage("testimage.png")
local shader = lg.newShader("shaders/identity.glsl")

love.load = function ()
   love.window.setMode(img:getDimensions())
   lg.setShader(shader)
end

love.draw = function ()
   lg.draw(img)
end

local lg = love.graphics

local img = lg.newImage("testimage.png")
local w,h = img:getDimensions()

local shader = lg.newShader("shaders/waterfalls.glsl")

local scale = 2

love.load = function ()
   love.window.setMode(w*2, h*2)
end

local canvas = lg.newCanvas(w,h)
canvas:setFilter("nearest", "nearest")

local offset = 0
local counter = 0
love.draw = function ()
   lg.setShader(shader)
   shader:send("offset", offset)
   offset = offset + 0.05
   canvas:renderTo(function ()
         lg.draw(img)
   end)
   lg.setShader()
   lg.draw(canvas, 0,0,0, scale)
   counter = counter + 1
end

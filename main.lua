local lg = love.graphics

local img = lg.newImage("testimage.png")

love.load = function ()
   love.window.setMode(img:getDimensions())
end

love.draw = function ()
   lg.draw(img)
end

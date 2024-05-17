require "plants/baseplant"

grape = {}
grape.__index = grape
setmetatable(grape, baseplant)

local sprite = love.graphics.newImage("sprites/plants/plantgrape.png")
local HEIGHT = 240
function grape.new(x, ally) 
  local instance = setmetatable({}, grape)
  instance.attack = 20
  instance.cd = 1
  instance.sprite = sprite
  instance.x = x
  instance.type = "grape"
  instance.ally = ally
  instance.HEIGHT = 240
  return instance
end

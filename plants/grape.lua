require "plants/baseplant"

grape = {}
grape.__index = grape
setmetatable(grape, baseplant)

local sprite = love.graphics.newImage("sprites/plants/plantgrape.png")

function grape.new(x, ally) 
  local instance = setmetatable({}, grape)
  instance.attack = 20
  instance.cd = 1
  instance.sprite = sprite
  instance.x = x
  instance.type = "grape"
  instance.ally = ally
  return instance
end

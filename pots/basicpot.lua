require "pots/basepot"

basicpot = {}
basicpot.__index = basicpot
setmetatable(basicpot, basepot)

local sprite = love.graphics.newImage("sprites/pots/basicpot.png")

function basicpot.new(x)
  local instance = setmetatable({}, basicpot)
  instance.x = x
  instance.y = 0
  instance.pos = 0
  instance.baseHealth = 100
  instance.currentHealth = instance.baseHealth
  instance.type = "basic"
  instance.maxPlants = 1
  instance.sprite = sprite
  return instance
end

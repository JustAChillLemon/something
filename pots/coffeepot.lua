require 'pots.basepot'

CoffeePot = {}
CoffeePot.__index = CoffeePot
setmetatable(CoffeePot, basepot)

local SPRITE = love.graphics.newImage("sprites/pots/coffeepot.png")
local BASE_HEALTH = 50
local POT_TYPE = 'coffee'
local MAX_PLANTS = 1

function CoffeePot.new(pos)
  return setmetatable(basepot.new({}, pos, BASE_HEALTH, POT_TYPE, SPRITE, MAX_PLANTS), CoffeePot)
end
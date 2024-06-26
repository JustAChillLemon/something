require "pots/basepot"

WaterPot = {}
WaterPot.__index = WaterPot
setmetatable(WaterPot, basepot)
 
local SPRITE = love.graphics.newImage("sprites/pots/basicpotwithwater.png")
local BASE_HEALTH = 125
local POT_TYPE = 'water'
local MAX_PLANTS = 1

function WaterPot.new(pos)
  return setmetatable(basepot.new({} pos, BASE_HEALTH, POT_TYPE, SPRITE, MAX_PLANTS), WaterPot)
end
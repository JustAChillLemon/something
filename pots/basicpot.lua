require "pots/basepot"

basicpot = {}
basicpot.__index = basicpot
setmetatable(basicpot, basepot)

local SPRITE = love.graphics.newImage("sprites/pots/basicpot.png")
local BASE_HEALTH = 100
local POT_TYPE = 'basic'
local MAX_PLANTS = 1

function basicpot.new(pos)
  return basepot.new(setmetatable({}, basicpot), pos, BASE_HEALTH, POT_TYPE, SPRITE, MAX_PLANTS)
end

require 'plants.baseplant'

BellFlower = {}
BellFlower.__index = BellFlower
setmetatable(BellFlower, baseplant)

local SPRITE = love.graphics.newImage('sprites/plants/plantbellflower.png') -- needs new sprite
local HEIGHT = 240
local BASE_ATTACK = 7
local BASE_CD = 1.5
local TYPE = 'BellFlower'

function BellFlower.new(x, ally)
  return setmetatable(baseplant.new(x, ally, BASE_ATTACK, BASE_CD, SPRITE, TYPE, HEIGHT), BellFlower)
end

function BellFlower:attackPot()
  local instance = gSTATE_MACHINE.current.enemy
  if instance.pots[1].alive then
    instance.pots[1]:attacked(self.attack * self.attackMult)
  end 
  if instance.pots[2].alive then
    instance.pots[2]:attacked(self.attack * self.attackMult)
  end
  if instance.pots[3].alive then
    instance.pots[3]:attacked(self.attack * self.attackMult)
  end
end
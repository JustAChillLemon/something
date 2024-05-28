require "shopitems/soilproduct"
require 'pots.waterpot'

BasicSoilProduct = {}
BasicSoilProduct.__index = BasicSoilProduct
setmetatable(BasicSoilProduct, SoilProduct)

local SPRITE = love.graphics.newImage("sprites/placeholderSoil.png")

function BasicSoilProduct:new(price, itemSpot)
  return setmetatable(SoilProduct.new(price, SPRITE, itemSpot, self), BasicSoilProduct)
end

function BasicSoilProduct:behavior()
  --[[local temp = user.pots[self.intersectionKey].plants[1]
  print(user.pots[self.intersectionKey])

  user.pots[self.intersectionKey] = WaterPot.new(user.pots[self.intersectionKey].pos)
  print(user.pots[self.intersectionKey])
  user.pots[self.intersectionKey]:addPlant(temp)]]
  
  user:alterPot(self.intersectionKey, WaterPot.new(self.intersectionKey))
end
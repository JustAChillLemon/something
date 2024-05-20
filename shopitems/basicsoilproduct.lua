require "shopitems/soilproduct"

BasicSoilProduct = {}
BasicSoilProduct.__index = BasicSoilProduct
setmetatable(BasicSoilProduct, SoilProduct)

local SPRITE = love.graphics.newImage("sprites/placeholderSoil.png")

function BasicSoilProduct:new(price, itemSpot)
  return SoilProduct.new(price, SPRITE, itemSpot, self)
end
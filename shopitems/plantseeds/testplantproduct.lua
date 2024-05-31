require 'shopitems.plantproduct'
require 'plants.testplant'

TestPlantProduct = {}
TestPlantProduct.__index = TestPlantProduct
setmetatable(TestPlantProduct, PlantProduct)

local SPRITE -- todo

function TestPlantProduct:new(price, itemSpot)
  return setmetatable(PlantProduct(price, SPRITE, itemSpot, self), TestPlantProduct)
end

function TestPlantProduct:behavior()
  user.pots[self.intersectionKey]:switchPlant
end
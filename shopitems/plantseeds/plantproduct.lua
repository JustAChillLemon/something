require 'shopitems.shopitem'

PlantProduct = {}
PlantProduct.__index = PlantProduct
setmetatable(PlantProduct, ShopItem)

local TYPE_PLANT_SEED = 3

function PlantProduct.new(price, sprite, itemSpot, table, customHeight, customWidth)
  return ShopItem.new(price, sprite, TYPE_PLANT_SEED, itemSpot, table, customHeight, customWidth)
end
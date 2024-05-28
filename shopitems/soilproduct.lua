require "shopitems/shopitem"

SoilProduct = {}
SoilProduct.__index = SoilProduct
setmetatable(SoilProduct, ShopItem)

local TYPE_SOIL = 1


function SoilProduct.new(price, sprite, itemSpot, table, customHeight, customWidth)
  return ShopItem.new(price, sprite, TYPE_SOIL, itemSpot, table, customHeight, customWidth)  
end
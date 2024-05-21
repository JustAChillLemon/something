require "shopitems/shopitem"

SoilProduct = {}
SoilProduct.__index = SoilProduct
setmetatable(SoilProduct, ShopItem)

local TYPE_SOIL = 1
local HEIGHT = 220 * gY_DIALATION
local WIDTH = 220 * gX_DIALATION


function SoilProduct.new(price, sprite, itemSpot, table)
  return ShopItem.new(price, sprite, TYPE_SOIL, itemSpot, HEIGHT, WIDTH, table)  
end
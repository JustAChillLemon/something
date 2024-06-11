require 'shopitems.shopitem'

PotProduct = {}
PotProduct.__index = PotProduct
setmetatable(PotProduct, ShopItem)

local TYPE_POT = 2

function PotProduct.new(price, sprite, table, itemSpot, customHeight, customWidth)
  return ShopItem.new(price, sprite, TYPE_POT, table, itemSpot, customHeight, customWidth)
end
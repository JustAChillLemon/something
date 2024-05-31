require 'shopitems.shopitem'

PotProduct = {}
PotProduct.__index = PotProduct
setmetatable(PotProduct, ShopItem)

local TYPE_POT = 2

function PotProduct.new(price, sprite, itemSpot, table, customHeight, customWidth)
  return ShopItem.new(price, sprite, TYPE_POT, itemSpot, table, customHeight, customWidth)
end
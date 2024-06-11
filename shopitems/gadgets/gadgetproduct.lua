require 'shopitems.shopitem'

GadgetProduct = {}
GadgetProduct.__index = GadgetProduct
setmetatable(GadgetProduct, ShopItem)

local TYPE_GADGET = 1

function GadgetProduct.new(price, sprite, table, itemSpot, customHeight, customWidth)
  return ShopItem.new(price, sprite, TYPE_GADGET, table, itemSpot, customHeight, customWidth)
end
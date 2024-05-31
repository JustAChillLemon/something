require 'shopitems.shopitem'

GadgetProduct = {}
GadgetProduct.__index = GadgetProduct
setmetatable(GadgetProduct, ShopItem)

local TYPE_GADGET = 1

function GadgetProduct.new(price, sprite, itemSpot, table, customHeight, customWidth)
  return ShopItem.new(price, sprite, TYPE_GADGET, itemSpot, table, customHeight, customWidth)
end
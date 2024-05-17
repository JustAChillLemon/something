ShopItem = {}
ShopItem.__index = ShopItem

local TYPE_SOIL = 1
local TYPE_POT = 2
local TYPE_PLANT_SEED = 3

function ShopItem:new(price, sprite, itemType, itemSpot) 
  self = setmetatable({}, ShopItem)
  self.price = price
  self.sprite = sprite
  self.itemType = itemType
  self.x, self.y = ShopItem:assignCords(itemSpot)
  return self
end

function ShopItem:update(dt) end
function ShopItem:render() 
  love.graphics.draw(self.sprite, self.x, self.y, 0, gX_DIALATION, gY_DIALATION)
end
  
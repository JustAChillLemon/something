ShopItem = {}
ShopItem.__index = ShopItem

local TYPE_SOIL = 1
local TYPE_POT = 2
local TYPE_PLANT_SEED = 3

function ShopItem.new(price, sprite, itemType, itemSpot, length, width, table) 
  table = setmetatable(table or {}, ShopItem)
  table.price = price
  table.itemSpot = itemSpot
  table.sprite = sprite
  table.itemType = itemType
  table.x, table.y = ShopItem:assignCords(itemSpot)
  table.length, table.width = length, width
  return table
end
function ShopItem:update(dt) 
  if isClicked(self.x, self.y, self.width, self.length, 1) then
    self.heldDown = true
    self.xDiff = love.mouse.getX() - self.x
    self.yDiff = love.mouse.getY() - self.y
  end
  
  if self.heldDown then
    if not love.mouse.isDown(1) then
      self.heldDown = false
      self.x, self.y = ShopItem:assignCords(self.itemSpot)
      if self.intersecting then
        self.remove = true
      end
    else 
      self.x = love.mouse.getX() - self.xDiff
      self.y = love.mouse.getY() - self.yDiff
      local intersectingThisTime = false
      for key, pot in pairs(user.pots) do
        if intersects(self, pot) then
          self.intersecting = pot
          intersectingThisTime = true
        end
      end
      if not intersectingThisTime then
        self.intersecting = nil
      end
    end
  end
end
function ShopItem:render() 
  love.graphics.draw(self.sprite, self.x, self.y, 0, gX_DIALATION, gY_DIALATION)
end
function ShopItem:assignCords(itemSpot) 
  if itemSpot == 1 then
    return 100, 200
  elseif itemSpot == 2 then
    return 200, 200
  elseif itemSpot == 3 then
    return 300, 200
  elseif itemSpot == 4 then
    return 100, 300
  elseif itemSpot == 5 then
    return 200, 300
  elseif itemSpot == 6 then
    return 300, 300
  end
end
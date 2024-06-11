
ShopItem = {}
ShopItem.__index = ShopItem

-- keeping all the values for each type of thing bought in one place
local TYPE_GADGET = 1
local TYPE_POT = 2
local TYPE_FERTILIZER = 3

local HEIGHT = 220 * gY_DIALATION
local WIDTH = 220 * gX_DIALATION

function ShopItem.new(price, sprite, itemType, table, itemSpot, customHeight, customWidth) 
  table = table
  table.price = price
  table.itemSpot = itemSpot
  table.ogItemSpot = itemSpot
  table.sprite = sprite
  table.itemType = itemType
  table.height, table.width = customHeight or HEIGHT, customWidth or WIDTH
  return table
end
function ShopItem:update(dt) 
  if isClicked(self.x, self.y, self.width, self.height, 1) then
    self.heldDown = true
    self.xDiff = love.mouse.getX() - self.x
    self.yDiff = love.mouse.getY() - self.y
  end
  
  if self.heldDown then    
    if not love.mouse.isDown(1) then
      self.heldDown = false
      self:assignCords()
      if self.intersecting then
          if user.money >= self.price then
          self.remove = true
          user.money = user.money - self.price
          self:attach()
        end
        self.intersecting.highlight = false
      end
    else 
      self.x = love.mouse.getX() - self.xDiff
      self.y = love.mouse.getY() - self.yDiff
      local intersectingThisTime = false
      for key, pot in pairs(user.pots) do
        local notInside = true
        if isInClickZone(pot.x, pot.y, pot.width, pot.height) then
          self.intersecting = pot
          self.intersectionKey = key
          user.pots[key].highlight = true
          intersectingThisTime = true
          notInside = false
        end
        
        if notInside and pot.highlight then
          pot.highlight = false
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
  love.graphics.setFont(INFO_FONT)
  love.graphics.setColor(1,1,0)
  love.graphics.print(self.price, self.x, self.y - 30)
  love.graphics.setColor(1,1,1)
end
function ShopItem:assignCords() 
  if self.itemType ~= TYPE_FERTILIZER then
    if self.itemSpot == 1 then
      self.x = SHOP_WINDOW_DEFAULT_X + (72)
    else
      self.x = SHOP_WINDOW_DEFAULT_X + ((72 + 72 + 220))
    end
    self.y = SHOP_WINDOW_DEFAULT_Y + (72)
  else
    if self.itemSpot == 1 then
      self.x, self.y = 821, 774
    elseif self.itemSpot == 2 then
      self.x, self.y = 821 + 67, 774
    else
      self.x, self.y = 821 + 67 + 67, 774
    end
  end
end
function ShopItem:attach() 
  if self.itemType == TYPE_GADGET then
    user:attachGadget(self.createItem(user.pots[self.intersectionKey]), self.intersectionKey)
  elseif self.itemType == TYPE_POT then
    user:alterPot(self.intersectionKey, self.createItem(self.intersectionKey))
  elseif self.itemType == TYPE_FERTILIZER then
    self:consume()
  else 
    print("there should not be this type of thingy this is a problem dude")
  end
end
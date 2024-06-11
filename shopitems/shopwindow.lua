require 'globals'
require 'shopitems.gadgets.splunkergadgetproduct'
require 'shopitems.pots.coffeepotproduct'


ShopWindow = {}
ShopWindow.__index = ShopWindow

local SPRITE = love.graphics.newImage('sprites/shopwindow.png')
SHOP_WINDOW_DEFAULT_X = 1100 * gX_DIALATION
SHOP_WINDOW_DEFAULT_Y = 300 * gY_DIALATION 

function ShopWindow.new()
  local instance = setmetatable({}, ShopWindow)
  instance.x = SHOP_WINDOW_DEFAULT_X
  instance.y = SHOP_WINDOW_DEFAULT_Y
  instance.itemOne, instance.itemTwo = ShopWindow.RandItem()
  return instance
end

function ShopWindow:update(dt)
  if self.itemOne then self.itemOne:update(dt) end
  if self.itemTwo then self.itemTwo:update(dt) end
  if self.itemOne and self.itemOne.remove then
    self.itemOne = nil
  elseif self.itemTwo and self.itemTwo.remove then
    self.itemTwo = nil
  end
end

function ShopWindow:render()
  love.graphics.draw(SPRITE, self.x, self.y, 0, gX_DIALATION, gY_DIALATION)
  
  local held = nil
  
  if self.itemOne and self.itemOne.heldDown then
    if self.itemTwo then self.itemTwo:render() end
    return self.itemOne
  elseif self.itemTwo and self.itemTwo.heldDown then
    if self.itemOne then self.itemOne:render() end
    return self.itemTwo
  end
  
  if self.itemOne then self.itemOne:render() end
  if self.itemTwo then self.itemTwo:render() end
end

function ShopWindow.RandItem()
  local a, b = SplunkerProduct:new(1), CoffeePotProduct.new(2)
  a:assignCords()
  b:assignCords()
  return a, b
end
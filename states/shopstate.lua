require 'states.basestate'
require 'shopitems.shopwindow'
require 'button'

ShopState = {}
ShopState.__index = ShopState
setmetatable(ShopState, BaseState)

local background = love.graphics.newImage("sprites/shopscreen.png")

function ShopState.new()
  local instance = setmetatable({}, ShopState)
  instance.name = "shop" 
  instance.window = ShopWindow.new()
  if not instance.window then 
    print("AAAAAAA")
    end
  instance.buttons = {button.new(CENTER_X, 600, 
        function()
          gSTATE_MACHINE:changeState('fight')
        end, 'FIGHT???'
      ),}
  
  return instance
end

function ShopState:render()
  love.graphics.draw(background, 0, 0, 0, gX_DIALATION, gY_DIALATION)
  for key, button in pairs(self.buttons) do
    button:render()
  end
  local potHeld = user:render()

  local shopItemHeld = self.window:render()
  
  if potHeld then
    potHeld:render()
  end
  
  if shopItemHeld then
    shopItemHeld:render()
  end
end

function ShopState:update(dt)
  for key, button in pairs(self.buttons) do
    button:update(dt)
  end
  --[[for key, product in pairs(self.products) do 
    product:update(dt)
    if product.remove then
      table.remove(self.products, key)
    end
  end]]
  self.window:update(dt)
  user:update(dt)
end
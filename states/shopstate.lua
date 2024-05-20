require 'states.basestate'
require 'shopitems.basicsoilproduct'
require 'button'

ShopState = {}
ShopState.__index = ShopState
setmetatable(ShopState, BaseState)

local background = love.graphics.newImage("sprites/shopscreen.png")

function ShopState.new()
  local instance = setmetatable({}, ShopState)
  instance.name = "shop" 
  instance.products = {BasicSoilProduct:new(1, 1), BasicSoilProduct:new(1, 3)}
  print(instance.products[1])
  print(instance.products[2])
  instance.buttons = {button.new(CENTER_X, 600, 
        function()
          gSTATE_MACHINE:changeState('fight')
        end, 'FIGHT???'
      ),}
  
  print("HEYYY")
  return instance
end

function ShopState:render()
  love.graphics.draw(background, 0, 0, 0, gX_DIALATION, gY_DIALATION)
  for key, button in pairs(self.buttons) do
    button:render()
  end
  for key, product in pairs(self.products) do 
    product:render()
  end
  user:render()
end

function ShopState:update(dt)
  for key, button in pairs(self.buttons) do
    button:update(dt)
  end
  for key, product in pairs(self.products) do 
    product:update(dt)
    if product.remove then
      table.remove(self.products, key)
    end
  end
  user:update(dt)
end
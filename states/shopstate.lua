require 'states.basestate'
require 'shopitems.gadgets.splunkergadgetproduct'
require 'shopitems.pots.coffeepotproduct'
require 'button'

ShopState = {}
ShopState.__index = ShopState
setmetatable(ShopState, BaseState)

local background = love.graphics.newImage("sprites/shopscreen.png")

function ShopState.new()
  local instance = setmetatable({}, ShopState)
  instance.name = "shop" 
  instance.products = {SplunkerProduct:new(1), SplunkerProduct:new(2), CoffeePotProduct.new(3)}
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
  local heldObj = user:render()

  for key, product in pairs(self.products) do 
    if not product.heldDown then
      product:render()
    else 
      heldObj = product
    end
  end
  
  if heldObj then
    heldObj:render()
  end
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
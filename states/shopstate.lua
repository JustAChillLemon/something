require 'states/basestate'
require 'button'

ShopState = {}
ShopState.__index = ShopState
setmetatable(ShopState, BaseState)

local background = love.graphics.newImage("sprites/shopscreen.png")

function ShopState.new()
  local instance = setmetatable({}, ShopState)
  instance.name = "shop" 
  instance.buttons = {button.new(700, 600, 
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
  user:render()
end

function ShopState:update(dt)
  for key, button in pairs(self.buttons) do
    button:update(dt)
  end
end
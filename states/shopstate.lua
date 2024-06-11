require 'states.basestate'
require 'shopitems.shopwindow'
require 'button'
require 'shopitems.fertilizers.attackFertilizer'
require 'shopitems.fertilizers.hpFertilizer'
require 'shopitems.fertilizers.cdFertilizer'



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
  instance.buttons = {button.new(20, 20, 
        function()
          gSTATE_MACHINE:changeState('fight')
        end, 'FIGHT???'
      , true),}
  instance.fertilizers = {AttackFertilizer.new(), HPFertilizer.new(), CDFertilizer.new()}
  return instance
end

function ShopState:render()
  love.graphics.draw(background, 0, 0, 0, gX_DIALATION, gY_DIALATION)
  for key, button in pairs(self.buttons) do
    button:render()
  end
  local potHeld = user:render()

  local shopItemHeld = self.window:render()
  
  for k, v in pairs(self.fertilizers) do
    v:render()
  end
  
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

  for k, v in pairs(self.fertilizers) do
    v:update(dt)
  end
  self.window:update(dt)
  user:update(dt)
end
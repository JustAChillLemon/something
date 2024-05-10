require 'states/basestate'

ShopState = {}
ShopState.__index = ShopState
setmetatable(ShopState, BaseState)

local background = love.graphics.newImage("sprites/shopscreen.png")

function ShopState.new()
  local instance = setmetatable({}, ShopState)
  instance.name = "shop" 
  return instance
end

function ShopState:render()
  love.graphics.draw(background, 0, 0, 0, gX_DIALATION, gY_DIALATION)
  user:render()
end
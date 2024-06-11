require 'shopitems.pots.potproduct'
require 'pots.coffeepot'
require 'globals'

CoffeePotProduct = {}
CoffeePotProduct.__index = CoffeePotProduct
setmetatable(CoffeePotProduct, PotProduct)

local PRICE = 4
local SPRITE = love.graphics.newImage("sprites/pots/coffeepot.png")
local HEIGHT = SPRITE:getHeight() * gY_DIALATION
local WIDTH = SPRITE:getWidth() * gX_DIALATION

function CoffeePotProduct.new(itemSpot)
  local instance = setmetatable(PotProduct.new(PRICE, SPRITE, {}, itemSpot, HEIGHT, WIDTH), CoffeePotProduct)
  instance.createItem = function(position) return CoffeePot.new(position) end
  return instance
end
require 'shopitems.gadgets.gadgetproduct'
require 'gadgets.splunker'
require 'globals'

SplunkerProduct = {}
SplunkerProduct.__index = SplunkerProduct
setmetatable(SplunkerProduct, GadgetProduct)

local SPRITE = love.graphics.newImage("sprites/gadgets/splunkergadget.png")
local WIDTH = SPRITE:getWidth() * gX_DIALATION
local HEIGHT = SPRITE:getHeight() * gY_DIALATION
local PRICE = 2 -- to be changed


function SplunkerProduct:new(itemSpot)
  local instance = setmetatable(GadgetProduct.new(PRICE, SPRITE, itemSpot, {}, HEIGHT, WIDTH), SplunkerProduct)
  instance.createItem = function(holding) return Splunker.new(holding) end
  return instance
end
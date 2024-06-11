require 'shopitems.shopitem'
require 'globals'

HPFertilizer = {}
HPFertilizer.__index = HPFertilizer
setmetatable(HPFertilizer, ShopItem)

local SPRITE = love.graphics.newImage('sprites/healthF.png')

local PRICE = 2
local HEIGHT = SPRITE:getHeight() * gY_DIALATION
local WIDTH = SPRITE:getWidth() * gX_DIALATION
local TYPE_FERTILIZER = 3
local HP_BUFF = 20

function HPFertilizer.new()
 local a = setmetatable(ShopItem.new(PRICE, SPRITE, TYPE_FERTILIZER, {}, 2, HEIGHT, WIDTH), HPFertilizer)
 a:assignCords()
 return a
end

function HPFertilizer:consume()
  user.pots[self.intersectionKey].baseHealth = user.pots[self.intersectionKey].baseHealth + HP_BUFF
  user.pots[self.intersectionKey]:reset()
end
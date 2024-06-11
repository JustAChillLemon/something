require 'shopitems.shopitem'
require 'globals'

CDFertilizer = {}
CDFertilizer.__index = CDFertilizer
setmetatable(CDFertilizer, ShopItem)

local SPRITE = love.graphics.newImage('sprites/cooldownF.png')

local PRICE = 1
local HEIGHT = SPRITE:getHeight() * gY_DIALATION
local WIDTH = SPRITE:getWidth() * gX_DIALATION
local TYPE_FERTILIZER = 3
local CD_BUFF = 0.95

function CDFertilizer.new()
 local a = setmetatable(ShopItem.new(PRICE, SPRITE, TYPE_FERTILIZER, {}, 3, HEIGHT, WIDTH), CDFertilizer)
 a:assignCords()
 return a
end

function CDFertilizer:consume()
  user.pots[self.intersectionKey].plant.BASE_CD =  user.pots[self.intersectionKey].plant.BASE_CD * CD_BUFF
  user.pots[self.intersectionKey].plant:fightStart()
end
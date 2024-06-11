require 'shopitems.shopitem'
require 'globals'

AttackFertilizer = {}
AttackFertilizer.__index = AttackFertilizer
setmetatable(AttackFertilizer, ShopItem)

local SPRITE = love.graphics.newImage('sprites/attackF.png')

local PRICE = 1
local HEIGHT = SPRITE:getHeight() * gY_DIALATION
local WIDTH = SPRITE:getWidth() * gX_DIALATION
local TYPE_FERTILIZER = 3
local ATTACK_BUFF = 3

function AttackFertilizer.new()
 local a = setmetatable(ShopItem.new(PRICE, SPRITE, TYPE_FERTILIZER, {}, 1, HEIGHT, WIDTH), AttackFertilizer)
 a:assignCords()
 return a
end

function AttackFertilizer:consume()
  user.pots[self.intersectionKey].plant.BASE_ATTACK =  user.pots[self.intersectionKey].plant.BASE_ATTACK + ATTACK_BUFF
  user.pots[self.intersectionKey].plant:fightStart()
end
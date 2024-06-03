require "plants/baseplant"

grape = {}
grape.__index = grape
setmetatable(grape, baseplant)

local SPRITE = love.graphics.newImage("sprites/plants/plantgrape.png")
local HEIGHT = 240
local BASE_ATTACK = 20
local BASE_CD = 1
local TYPE = 'grape'

function grape.new(x, ally) 
  return setmetatable(baseplant.new(x, ally, BASE_ATTACK, BASE_CD, SPRITE, TYPE, HEIGHT), grape)
end

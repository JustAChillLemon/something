require 'plants.baseplant'

PolkaDotPlant = {}
PolkaDotPlant.__index = PolkaDotPlant
setmetatable(PolkaDotPlant, baseplant)

local SPRITE = love.graphics.newImage('sprites/plants/plantgrape.png') -- needs new sprite
local HEIGHT = 240
local BASE_ATTACK = 0
local BASE_CD = 2

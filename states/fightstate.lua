require 'states.basestate'
require 'plants.grape'


FightState = {}
FightState.__index = FightState
setmetatable(FightState, BaseState)

local background = love.graphics.newImage("sprites/fightscreen.png")
local healthBuff = 0
local attackBuff = 0
local cdBuff = 0

local wins = 0

function FightState.new() 
  local instance = setmetatable({}, FightState)
  instance.name = 'fight'
  instance.enemy = player:new(false)
  instance.enemy.pots[1]:addPlant(grape.new(instance.enemy.pots[1].x, false))
  instance.enemy.pots[2]:addPlant(grape.new(instance.enemy.pots[2].x, false))
  instance.enemy.pots[3]:addPlant(grape.new(instance.enemy.pots[3].x, false))
  user:fightStart(instance.enemy)
  instance.enemy:fightStart(user)
  for i = 1, 3 do
    instance.enemy.pots[i]:buff(healthBuff, attackBuff, cdBuff)
  end
  return instance
end
function FightState:render()
  love.graphics.draw(background, 0, 0, 0, gX_DIALATION, gY_DIALATION)
  user:render()
  self.enemy:render()
end
function FightState:update(dt)
  self.enemy:update(dt, user)
  user:update(dt, self.enemy)
  if self.enemy.lost or user.lost then
    gSTATE_MACHINE:changeState('postfight')
  end
end
function FightState:exit()
  if cdBuff < 0 then
    cdBuff = 0.1
  end
  if self.enemy.lost then
    attackBuff = (attackBuff * 1.1) + 2
    healthBuff = (healthBuff * 1.1) + 7
    cdBuff = (cdBuff * 1.1)
    wins = wins + 1
    user.money = user.money + 3 + wins
  else
    user.money = user.money + 2 
  end
end
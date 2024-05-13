require 'states.basestate'
require 'button'
require 'player'

FightState = {}
FightState.__index = FightState
setmetatable(FightState, BaseState)

local background = love.graphics.newImage("sprites/fightscreen.png")

function FightState.new() 
  local instance = setmetatable({}, FightState)
  instance.name = 'fight'
  instance.enemy = player:new(false)
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
    gSTATE_MACHINE:changeState('shop')
  end
end
require 'states.basestate'
require 'button'
require 'player'

FightState = {}
FightState.__index = FightState
setmetatable(FightState, BaseState)

local background = love.graphics.newImage("sprites/fightscreen.png")

enemy = nil

function FightState.new() 
  local instance = setmetatable({}, FightState)
  instance.name = 'fight'
  return instance
end

function FightState:enter()
  enemy = player:new(false)
  player:changePot(enemy.firstMostPot)
  enemy:changePot(player.firstMostPot)
end
function FightState:render()
  love.graphics.draw(background, 0, 0, 0, gX_DIALATION, gY_DIALATION)
  user:render()
  enemy:render()
end
function FightState:update(dt)
  enemy:update(dt)
  player:update(dt)
end
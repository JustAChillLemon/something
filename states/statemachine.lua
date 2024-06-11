require 'states.titlestate'
require 'states.shopstate'
require 'states.fightstate'
require 'states.postfightstate'

StateMachine = {}
StateMachine.__index = StateMachine

function StateMachine.new(states)
  local instance = setmetatable({}, StateMachine)
  instance.empty = {
    render = function() end,
    update = function() end,
    enter = function() end,
    exit = function() end
  }
  instance.states = states or {}
  instance.current = instance.empty
  return instance
end

function StateMachine:update(dt)
  self.current:update(dt)
end

function StateMachine:render()
  self.current:render()
end

function StateMachine:changeState(newState)
  self.current:exit()
  if newState == "title" then
    self.current = TitleState.new()
  elseif newState == 'shop' then 
    self.current = ShopState.new()
  elseif newState == 'fight' then
    self.current = FightState.new()
  elseif newState == 'postfight' then
    self.current = PostFightState.new(self.current.enemy)
  end
  
  self.stateName = newState
  self.current:enter()
end


gSTATE_MACHINE = StateMachine.new()
gSTATE_MACHINE:changeState("title")
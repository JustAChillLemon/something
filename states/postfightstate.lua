require 'states.basestate'
require 'button'

PostFightState = {}
PostFightState.__index = PostFightState
setmetatable(PostFightState, BaseState)

local background = love.graphics.newImage("sprites/fightscreen.png")

function PostFightState.new(e) 
  local instance = setmetatable({}, PostFightState)
  instance.enemy = e
  instance.win = not user.lost
  instance.button = button.new(CENTER_X, 600, function() gSTATE_MACHINE:changeState('shop') end, 'To the shop!')
  return instance
end
function PostFightState:update(dt)
  self.button:update(dt)
end

function PostFightState:render()
  love.graphics.draw(background, 0, 0, 0, gX_DIALATION, gY_DIALATION)
  user:render()
  self.enemy:render()
  love.graphics.setColor(0,0,0,100/255)
  love.graphics.rectangle('fill', 0, 0, 1920, 1080)
  love.graphics.setColor(1,1,1)
  self.button:render()
  if self.win then
    love.graphics.print("YOU WON!!!!!!!!!!", 100, 100)
  else 
    love.graphics.print("YOU LOST!??!?!", 100, 100)
  end
end
function PostFightState:exit()
  user:reset()
end
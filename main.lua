require 'player'
require 'button'
require 'pots.basicpot'
require 'plants.grape'
require 'states.statemachine'

user = player:new(true)
pots = { basicpot.new(4), basicpot.new(5), basicpot.new(6)}
user.pots[1]:addPlant(grape.new(user.pots[1].x, true))
user.pots[2]:addPlant(grape.new(user.pots[2].x, true))
user.pots[3]:addPlant(grape.new(user.pots[3].x, true))

local timeSinceLast = 0

function love.keypressed(key) 
  if key == 'escape' then
    love.event.quit()
  end
end

function love.update(dt)
  gSTATE_MACHINE:update(dt)
  love.mouse.released = {}
  love.mouse.clicked = {}
end

function love.draw()
  gSTATE_MACHINE:render()
end
function love.mousereleased(x, y, button)
  love.mouse.released[button] = true
end
function love.mousepressed(x, y, button)
  love.mouse.clicked[button] = true
end
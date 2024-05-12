require 'player'
require 'button'
require 'pots.basicpot'
require 'plants.grape'
require 'states.statemachine'

user = player:new(true)
enemy = player:new(false)
pots = { basicpot.new(4), basicpot.new(5), basicpot.new(6)}
user.pots[1]:addPlant(grape.new(user.pots[1].x, true))
user.pots[2]:addPlant(grape.new(user.pots[2].x, true))


function love.keypressed(key) 
  if key == 'escape' then
    love.event.quit()
  end
end

function love.update(dt)
  gSTATE_MACHINE:update(dt)
end

function love.draw()
  gSTATE_MACHINE:render()
end

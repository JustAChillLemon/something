require 'player'
require 'button'
require 'pots/basicpot'
require 'plants/grape'

  p1 = player.new()
  b = button.new(30, 30, 20, 20)
  

  
  pots = { basicpot.new(4), basicpot.new(5), basicpot.new(6)}
  p1.pots[1]:addPlant(grape.new(p1.pots[1].x, true))
  p1.pots[2]:addPlant(grape.new(p1.pots[2].x, true))
  pots[3]:addPlant(grape.new(pots[3].x, false))

function love.keypressed(key) 
  love.keyboard.pressed[key] = true
  if key == 'escape' then
    love.event.quit()
  end
end
function love.keyreleased(key)
  love.keyboard.pressed[key] = false 
end
function love.update(dt)
  b:update(dt)
end

function love.draw()
  b:render()
  --for k, v in pairs(pots) do
    --v:render()
  --end
  for k, v in pairs(p1.pots) do
    v:render()
  end
end

function love.keyboard.wasKeyPressed(str) 
  return love.keyboard.pressed[str]
end
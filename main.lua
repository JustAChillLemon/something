require 'player'
require 'button'
require 'pots/basicpot'
require 'plants/grape'

function love.load()
  love.window.setMode(1920, 1080)
  gamer = player.new()
  b = button.new(30, 30, 20, 20)
  love.keyboard.pressed = {}
  
  pots = {basicpot.new(1), basicpot.new(2), basicpot.new(3),
    basicpot.new(4), basicpot.new(5), basicpot.new(6)}
  pots[1]:addPlant(grape.new(pots[1].x, true))
  pots[6]:addPlant(grape.new(pots[6].x, false))
end

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
  for k, v in pairs(pots) do
    v:render()
  end
end

function love.keyboard.wasKeyPressed(str) 
  return love.keyboard.pressed[str]
end
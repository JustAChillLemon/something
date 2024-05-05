require 'player'
require 'button'
require 'pots/basicpot'

function love.load()
  love.window.setMode(1920, 1080)
  gamer = player.new()
  b = button.new(30, 30, 20, 20)
  love.keyboard.pressed = {}
  
  pots = {p1 = basicpot.new(32), p2 = basicpot.new(276), p3 = basicpot.new(520),
    p4 = basicpot.new(1180), p5 = basicpot.new(1424), p6 = basicpot.new(1668)}
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
  gamer:update(dt)
  b:update(dt)
end

function love.draw()
  gamer:render()
  b:render()
  for k, v in pairs(pots) do
    v:render()
  end
end

function love.keyboard.wasKeyPressed(str) 
  return love.keyboard.pressed[str]
end
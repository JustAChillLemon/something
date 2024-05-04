require 'player'
require 'button'

function love.load()
  love.window.setMode(1920, 1080)
  gamer = player.new()
  b = button.new(30, 30, 20, 20)
  love.keyboard.pressed = {}
end

function love.keypressed(key) 
  love.keyboard.pressed[key] = true

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
end

function love.keyboard.wasKeyPressed(str) 
  return love.keyboard.pressed[str]
end
require 'player'
require 'button'
require 'pots.basicpot'
require 'plants.grape'
require 'plants.bellflower'
require 'states.statemachine'

math.randomseed(os.time())

DEFAULT_FONT = love.graphics.newFont(12)
MONEY_FONT = love.graphics.newFont(40)

user = player:new(true)
pots = { basicpot.new(4), basicpot.new(5), basicpot.new(6)}
for i = 1, 3 do
  local choice = math.random(0, 1)
  local p = choice == 0 and BellFlower.new(user.pots[i].x, true) or grape.new(user.pots[i].x, true)
  user.pots[i]:addPlant(p)
end
--[[user.pots[1]:addPlant(BellFlower.new(user.pots[1].x, true))
user.pots[2]:addPlant(BellFlower.new(user.pots[2].x, true))
user.pots[3]:addPlant(BellFlower.new(user.pots[3].x, true))
]]
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
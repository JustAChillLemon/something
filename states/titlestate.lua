require 'states/basestate'
require 'button'

TitleState = {}
TitleState.__index = TitleState
setmetatable(TitleState, BaseState)

local background = love.graphics.newImage("sprites/titlescreen.png")

function TitleState.new()
  local instance = setmetatable({}, TitleState)
  instance.name = 'title' -- name of state
  instance.buttons = {button.new(100, 100, 100, 100, 
        function() 
            gSTATE_MACHINE:changeState('shop')
        end
      ), 
      button.new(200, 200, 100, 100, 
        function()
          love.event.quit()
        end
      )
      }
  return instance
end

function TitleState:render() 
  love.graphics.draw(background, 0, 0, 0, gX_DIALATION, gY_DIALATION)
  for key, button in pairs(self.buttons) do
    button:render()
  end
end
function TitleState:update(dt)
  for key, button in pairs(self.buttons) do 
    button:update(dt)
  end
end
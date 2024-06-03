BaseGadget = {}
BaseGadget.__index = BaseGadget

function BaseGadget.new(holding) 
  local instance = {}
  instance.pot = holding
  return instance
end
function BaseGadget:fightStart() 
  print("base gadget fight start called")
end -- function that determines unique behavior
function BaseGadget:render()
  love.graphics.draw(self.sprite, self.x, self.y, 0, gX_DIALATION, gY_DIALATION)
end

function BaseGadget:assignPos()
  self.x = self.pot.x + (35 * gX_DIALATION)
  self.y = self.pot.y - (5 * gY_DIALATION)
end
function BaseGadget:changePot(newPot) 
  self.pot = newPot
end
function BaseGadget:process(dt) end
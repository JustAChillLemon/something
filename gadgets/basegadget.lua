BaseGadget = {}
BaseGadget.__index = BaseGadget

function BaseGadget.new() end
function BaseGadget:effect() end -- function that determines unique behavior
function BaseGadget:render()
  love.graphics.draw(self.sprite, self.x, self.y, 0, gX_DIALATION, gY_DIALATION)
end

function BaseGadget:assignPos(teable)
  self.x = teable.x + (35 * gX_DIALATION)
  self.y = teable.y - (5 * gY_DIALATION)
end
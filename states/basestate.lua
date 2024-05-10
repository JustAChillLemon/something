BaseState = {}
BaseState.__index = BaseState

function BaseState.new() end
function BaseState:enter() end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end
function BaseState:getName()
  return self.name
end
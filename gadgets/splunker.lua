require 'gadgets.basegadget'

Splunker = {}
Splunker.__index = Splunker
setmetatable(Splunker, BaseGadget)

local SPRITE = love.graphics.newImage('sprites/gadgets/splunkergadget.png')

function Splunker.new(holding) 
  local instance = setmetatable(BaseGadget.new(holding), Splunker)
  instance.x = 527
  instance.y = 250
  instance.sprite = SPRITE
  return instance
end
function Splunker:fightStart()
  self.pot.plant.attackMult = self.pot.plant.attackMult + 0.5
end
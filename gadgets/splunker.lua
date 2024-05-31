require 'gadgets.basegadget'

Splunker = {}
Splunker.__index = Splunker
setmetatable(Splunker, BaseGadget)

local SPRITE = love.graphics.newImage('sprites/gadgets/splunkergadget.png')

function Splunker.new() 
  local instance = setmetatable({}, Splunker)
  instance.x = 527
  instance.y = 250
  instance.sprite = SPRITE
  return instance
end
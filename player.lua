require 'pots/basicpot'

player = {}
player.__index = player

player.pots = {basicpot.new(1), basicpot.new(2), basicpot.new(3)}
--player.frontMostPot = 

function player.new()
  instance = setmetatable({}, player)
  return instance
end

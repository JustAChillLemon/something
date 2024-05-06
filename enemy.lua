require 'pots/basicpot'

enemy = {}
enemy.__index = enemy

enemy.pots = {basicpot.new(4), basicpot.new(5), basicpot.new(6)}
enemy.frontMostPot = 

function enemy.new()
  instance = setmetatable({}, player)
  return instance
end

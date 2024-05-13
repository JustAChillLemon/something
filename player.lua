require 'pots/basicpot'

player = {}
player.__index = player

player.frontMostPotIdx = 3

function player:new(ally)
  self = setmetatable({}, player)
  self.pots = ally and {basicpot.new(1), basicpot.new(2), basicpot.new(3)} or {basicpot.new(4), basicpot.new(5), basicpot.new(6)}
  self.frontMostPot = self.pots[3]
  self.name = ally and 'player' or 'enemy'
  return self
end

function player:render() 
  for key, pot in pairs(self.pots) do
    pot:render()
  end
end

function player:update(dt, enemy) 
  --[[if gSTATE_MACHINE.stateName == 'fight' then
    if not (self.frontMostPot.alive) then -- front most pot is supposed to be targeted by enemy pots
      self.frontMostPotIdx = self.frontMostPotIdx - 1
      self.frontMostPot = self.pots[self.frontMostPotIdx]
      if enemy:changePot(self.frontMostPot) then 
        print("I EXIST")
      end
    end
    for key, pot in pairs(self.pots) do
      pot:update(dt)
    end
  end]]
  
  if gSTATE_MACHINE.stateName == 'fight' then
    local changePot = enemy.frontMostPot ~= self.pots[1].target
    for key, pot in pairs(self.pots) do
      pot:update(dt)
      if changePot then
        pot:changeTarget(enemy.frontMostPot)
      end
    end
  end
end
function player:changePot(target)
  for key, pot in pairs(self.pots) do
    pot:changeTarget(target)
  end
  return true
end
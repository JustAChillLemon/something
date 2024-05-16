require 'pots/basicpot'

player = {}
player.__index = player

player.frontMostPotIdx = 3

function player:new(ally)
  self = setmetatable({}, player)
  self.pots = ally and {basicpot.new(1), basicpot.new(2), basicpot.new(3)} or {basicpot.new(4), basicpot.new(5), basicpot.new(6)}
  self.frontMostPot = self.pots[3]
  self.name = ally and 'player' or 'enemy'
  self.money = 10
  return self
end

function player:render() 
  for key, pot in pairs(self.pots) do
    pot:render()
  end
  
  if gSTATE_MACHINE.stateName == 'shop' then
    love.graphics.print("Money: " .. self.money, (CENTER_X + 200) * gX_DIALATION, 100)
  end
end

function player:update(dt, enemy) 
  if gSTATE_MACHINE.stateName == 'fight' and enemy ~= nil then
    if not self.frontMostPot.alive then 
      if self.frontMostPot == self.pots[1] then
        self.lost = true
      end
      self.frontMostPotIdx = self.frontMostPotIdx > 1 and self.frontMostPotIdx - 1 or 1 
      self.frontMostPot = self.pots[self.frontMostPotIdx]
    end
    self.changePot = enemy.frontMostPot ~= (self.pots[1].plants[1] ~= nil and self.pots[1].plants[1].target)
  end
  
  for key, pot in pairs(self.pots) do
    pot:update(dt)
    if self.changePot then
      pot:changeTarget(enemy.frontMostPot)
    end
  end
end
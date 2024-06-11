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
function player:reset()
  for key, pot in pairs(self.pots) do
    pot:reset()
  end
  self.frontMostPot = self.pots[3]
  self.frontMostPotIdx = 3
  self.lost = false
end
function player:fightStart(enemy)
  self.frontMostPot = self.pots[3]
  for k,v in pairs(self.pots) do
    v:fightStart()
    v:changeTarget(enemy.frontMostPot)
  end
end
function player:alterPot(key, pot)
  local temp = self.pots[key].plant
  local temp2 = self.pots[key].gadget
  self.pots[key] = pot
  self.pots[key]:addPlant(temp)
  self.pots[key].gadget = temp2
  if temp2 then 
    temp2:changePot(self.pots[key])
  end
end
function player:render() 
  local heldPot = nil
  for key, pot in pairs(self.pots) do
    if not pot.heldDown then
      pot:render()
    else 
      heldPot = pot
    end
  end
  
  if gSTATE_MACHINE.stateName == 'shop' then
    love.graphics.print("Money: " .. self.money, (CENTER_X + 200) * gX_DIALATION, 100)
  end
  
  if heldPot then 
    return heldPot
  end
end

function player:update(dt, enemy) 
  if gSTATE_MACHINE.stateName == 'fight' and enemy ~= nil then
    if not self.frontMostPot.alive then 
      if self.frontMostPot == self.pots[1] then
        self.lost = true
      end
      self.frontMostPotIdx = self.frontMostPotIdx - 1
      self.frontMostPot = self.pots[self.frontMostPotIdx]
    end
    
    self.changePot = self.pots[1].plant.target ~= enemy.pots[enemy.frontMostPot]
  end
  
  for key, pot in pairs(self.pots) do
    pot:update(dt)
    if self.changePot and enemy then
      pot:changeTarget(enemy.frontMostPot)
    end
  end
end
function player:attachGadget(gadget, key)
  self.pots[key].gadget = gadget
  gadget:assignPos(self.pots[key])
end
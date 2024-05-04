basepot = {}
basepot.__index = basepot

basepot.x = nil -- int, pot's drawing cord
basepot.y = nil -- int, pot's drawing cord
basepot.pos = nil -- int, pot's position on the row of pots fighting
basepot.currentHealth = nil -- int, pot's current health
basepot.baseHealth = nil -- int, pot's max hp
basepot.type = nil -- string, pot's type
basepot.plants = {} -- table, plants currently in the pot
basepot.maxPlants = nil -- int, max plants that can go in plants
basepot.soil = nil -- string, type of soil
basepot.soilSprite = nil -- image, the soil in the pot's sprite
basepot.potSprite = nil -- image, the pot's sprite

--function basepot.new()

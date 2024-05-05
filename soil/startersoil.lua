require 'soil/basesoil'

startersoil = {}
startersoil.__index = startersoil

function startersoil.new() 
  return setmetatable(startersoil, basesoil)
end
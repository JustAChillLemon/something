basesoil = {}
basesoil.__index = basesoil

basesoil.liveable = {}  -- table, contains what kinds of plants can live in it, if empty all can live in it

function basesoil.new() end
function basesoil:effect() end -- function that determines unique behavior
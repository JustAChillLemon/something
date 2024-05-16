function isReleased(x, y, w, h, key) 
  return isInClickZone(x, y, w, h) and love.mouse.released[key]
end
--
function isClicked(x, y, w, h, key)
  return isInClickZone(x, y, w, h) and love.mouse.clicked[key]
end
--
function isHeld(x, y, w, h, key)
  return isInClickZone(x, y, w, h) and love.mouse.isDown(key)
end

function isInClickZone(x, y, w, h)
return (love.mouse.getX() > x and love.mouse.getX() < x + w) and (love.mouse.getY() > y and love.mouse.getY() < y + h)
end
--
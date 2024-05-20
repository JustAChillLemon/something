function isReleased(x, y, w, h, key) 
  return isInClickZone(x, y, w, h) and love.mouse.released[key]
end
--
function isClicked(x, y, w, h, key)
  return isInClickZone(x, y, w, h) and love.mouse.clicked[key]
end
--
function isInClickZone(x, y, w, h)
return (love.mouse.getX() > x and love.mouse.getX() < x + w) and (love.mouse.getY() > y and love.mouse.getY() < y + h)
end
--
function intersects(table1, table2)
  return ((table1.x >= table2.x) and (table1.x <= table2.x + table2.width) and (table1.y >= table2.y) and (table1.y <= table2.y + table2.length)) or ((table2.x >= table1.x) and (table2.x <= table1.x + table1.width) and (table2.y >= table1.y) and (table2.y <= table1.y + table1.length))
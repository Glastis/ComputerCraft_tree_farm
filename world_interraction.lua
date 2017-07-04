local side = require "sides"

--[[
---- Will check if bloc at side of turtle is of type provided, dig it and go at its location.
----
---- turtle_side; side of turtle, can be side.up, side.down, side.left, side.right, side.back, side.front
---- bloc; string of bloc name, formatted like: "mod:bloc", ex: "minecraft:dirt"
---- (optional) meta; metadata of bloc
]]--

function check_bloc_side(turtle_side, bloc, meta)
  local data
  local success

  if (turtle_side == side.left) then
    turtle.turnLeft()
    turtle_side = side.right
  elseif (turtle_side == side.right) then
    turtle.turnRight()
    turtle_side = side.left
  elseif (turtle_side == side.back) then
    turtle.turnRight()
    turtle.turnRight()
  end
  if turtle_side == side.up then
    success, data = turtle.inspectUp()
    if (success and data.name == bloc and (not meta or data.metadata == meta)) then
      turtle.digUp()
      up(1, true)
      check_bloc(bloc, meta)
      down(1, true)
    end
  elseif turtle_side == side.down then
    success, data = turtle.inspectDown()
    if (success and data.name == bloc and (not meta or data.metadata == meta)) then
      turtle.digDown()
      down(1, true)
      check_bloc(bloc, meta)
      up(1, true)
    end
  else
    success, data = turtle.inspect()
    if (success and data.name == bloc and (not meta or data.metadata == meta)) then
      turtle.dig()
      forward(1, true)
      check_bloc(bloc, meta)
      turtle.turnLeft()
      turtle.turnLeft()
      forward(1, true)
      turtle.turnRight()
      turtle.turnRight()
    end
  end
  if (turtle_side == side.right) then
    turtle.turnLeft()
  elseif (turtle_side == side.left) then
    turtle.turnRight()
  elseif (turtle_side == side.back) then
    turtle.turnLeft()
    turtle.turnLeft()
  end
end

--[[
---- Will check if bloc is of type provided, dig it and go at its location, recheck and came back.
----
---- turtle_side; side of turtle, can be side.up, side.down, side.left, side.right, side.back, side.front
---- bloc; string of bloc name, formatted like: "mod:bloc", ex: "minecraft:dirt"
---- (optional) meta; metadata of bloc
]]--
function check_bloc(bloc, meta)
  check_bloc_side(side.front, bloc, meta)
  check_bloc_side(side.back, bloc, meta)
  check_bloc_side(side.right, bloc, meta)
  check_bloc_side(side.left, bloc, meta)
  check_bloc_side(side.up, bloc, meta)
  check_bloc_side(side.down, bloc, meta)
end

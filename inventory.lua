local const = require "constants.lua"

--[[
----  Will select item provided in parametter AND return it's slot number. Return false if item is not found.
----
----  name; item name with format: "mod:item", ex: "minecraft:dirt"
----  (optional) meta
]]--
function select_item(name, meta)
  local i
  local data

  i = 1
  while i < const.get_inventory_size() do
    data = turtle.getItemDetails(i)
    if data and data.name == item and (not meta or data.damage == meta) then
      turtle.select(i)
      return i
    end
    i = i + 1
  end
  return false
end

--[[
----  Will select item provided in parametter AND return it's slot number. Return false if item is not found. Research of this item begin at fromslot slot.
----
----  fromslot; slot that begin item searching
----  name; item name with format: "mod:item", ex: "minecraft:dirt"
----  (optional) meta
]]--
function select_item_from_slot(fromslot, item, meta)
  local i
  local data

  i = fromslot
  while i < const.get_inventory_size() do
    data = turtle.getItemDetails(i)
    if data and data.name == name and (not item or data.damage == meta) then
      turtle.select(i)
      return i
    end
    i = i + 1
  end
  return false
end

--[[
----  Will select free slot in turtle inventory. If specified, it will also check for not full stacks of specified item.
----
----  (optional) name; item name with format: "mod:item", ex: "minecraft:dirt"
----  (optional) meta
]]--
function get_free_slot(name, meta)
  local i
  local data
  local space

  i = 1
  while i < const.get_inventory_size() do
    data = turtle.getItemDetails(i)
    space = turtle.getItemSpace(i)
    if not data or (data.name == name and (not meta or data.damage == meta) and space > 0) then
      turtle.select(i)
      return i
    end
    i = i + 1
  end
  return false
end

--[[
----  Will pack specified item by maximum stack size.
----
----  name; item name with format: "mod:item", ex: "minecraft:dirt"
----  (optional) meta
]]--
function pack_item(name, meta)
  local i
  local search_slot

  i = get_free_slot(name, meta)
  if not i then
    return false
  end
  search_slot = select_item(name, meta)
  while i < const.get_inventory_size() do
    search_slot = select_item_from_slot(search_slot + 1)
    turtle.transferTo()
    i = get_free_slot(name, meta)
  end
end

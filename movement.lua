function down(iter, dig)
  if not iter then
    iter = 1
  end
  while iter > 0 do
    if not turtle.down() then
      if dig then
        turtle.digDown()
        sleep(0.5)
      else
        sleep(1)
      end
    else
      iter = iter - 1
    end
  end
end

function up(iter, dig)
  if not iter then
    iter = 1
  end
  while iter > 0 do
    if not turtle.up() then
      if dig then
        turtle.digUp()
        sleep(0.5)
      else
        sleep(1)
      end
    else
      iter = iter - 1
    end
  end
end

function forward(iter, dig)
  if not iter then
    iter = 1
  end
  while iter > 0 do
    if not turtle.forward() then
      if dig then
        turtle.dig()
        sleep(0.5)
      else
        sleep(1)
      end
    else
      iter = iter - 1
    end
  end
end

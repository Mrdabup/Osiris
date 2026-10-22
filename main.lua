-- Testing a speed tutorial
local playerPosition = 
{
  X = 100,
  Y = 100,
  Speed = 100,
  Health = 100,
}

function love.update(dt)
  
  if love.keyboard.isDown("a") then
    playerPosition.X = playerPosition.X - playerPosition.Speed * dt
  end
  if love.keyboard.isDown("d") then
    playerPosition.X = playerPosition.X + playerPosition.Speed * dt
  end
  if love.keyboard.isDown("space") then
    playerPosition.Y = playerPosition.Y - playerPosition.Speed * dt
  end

end

function love.draw()
  love.graphics.setColor(0.2,0.7,1)
  love.graphics.rectangle("fill", playerPosition.X, playerPosition.Y, 50,50)
  love.graphics.setColor(1,0,0)
  love.graphics.rectangle("fill", 100,200,100,100)
  love.graphics.setColor(1,1,1)
  love.graphics.print("Current Position: X " ..playerPosition.X .. " Y " .. playerPosition.Y, 50, 50)
end

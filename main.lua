wf = require 'windfield'

local playerAtributes = 
{
  X = 100,
  Y = 100,
  Speed = 150,
  SpeedMult = 1.3,
  Health = 100,
  Storage = {},
  _ident = "player",
}


function love.load()
  world = wf.newWorld(0, 500, false)
  world:setGravity(0, 512)
  playerCollider = world:newRectangleCollider(playerAtributes.X, playerAtributes.Y,50,50)
  playerCollider:setType('dynamic')
  groundCollider = world:newRectangleCollider(0,500,1000,100)
  groundCollider:setType('static')
end

function love.update(dt)
  local px, py = playerCollider:getLinearVelocity()
  if love.keyboard.isDown("a") and px > -300 then
    playerCollider:applyLinearImpulse(-35,0)
    if love.keyboard.isDown("lshift") then
      playerCollider:applyLinearImpulse(-45,0)
    end
  end
  if love.keyboard.isDown("d")  and px < 300 then
    playerCollider:applyLinearImpulse(35,0)
    if love.keyboard.isDown("lshift") then
      playerCollider:applyLinearImpulse(45,0)
    end
  end
  if love.keyboard.isDown("space") then
    playerCollider:applyLinearImpulse(0,-35)
  end
    -- TODO: Basic Inventory
    world:update(dt)
end

function love.draw()
  --love.graphics.setColor(0.2,0.7,1)
  --love.graphics.rectangle("fill", playerAtributes.X, playerAtributes.Y, 50,50)
  --love.graphics.setColor(1,0,0)
  --love.graphics.rectangle("fill", 100,200,100,100)
  --love.graphics.setColor(1,1,1)
  --love.graphics.print("Current Position: X " ..playerAtributes.X .. " Y " .. playerAtributes.Y, 50, 50)
  world:draw() 
end

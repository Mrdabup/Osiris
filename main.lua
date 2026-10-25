wf = require 'windfield'

local world = love.physics.newWorld(0, 100)
local playerAtributes = 
{
  X = 100,
  Y = 100,
  Speed = 100,
  SpeedMult = 1.3,
  Health = 200,
  Storage = {},
  _ident = "player",
}

local floor = {}

function love.load()
    world = wf.newWorld(0, 0, true)
    world:setGravity(0, 512)
end

function love.update(dt)
  
  if love.keyboard.isDown("a") then
    playerAtributes.X = playerAtributes.X - playerAtributes.Speed * dt
    if love.keyboard.isDown("lshift") then
      playerAtributes.X = playerAtributes.X - playerAtributes.SpeedMult 
    end
  end
  if love.keyboard.isDown("d") then
    playerAtributes.X = playerAtributes.X + playerAtributes.Speed * dt
    if love.keyboard.isDown("lshift") then
      playerAtributes.X = playerAtributes.X + playerAtributes.SpeedMult 
    end
  end
  if love.keyboard.isDown("space") then
    playerAtributes.Y = playerAtributes.Y - playerAtributes.Speed * dt
  end
    -- TODO: Basic Inventory
    world:update(dt)
end

function love.draw()
  love.graphics.setColor(0.2,0.7,1)
  love.graphics.rectangle("fill", playerAtributes.X, playerAtributes.Y, 50,50)
  love.graphics.setColor(1,0,0)
  love.graphics.rectangle("fill", 100,200,100,100)
  love.graphics.setColor(1,1,1)
  love.graphics.print("Current Position: X " ..playerAtributes.X .. " Y " .. playerAtributes.Y, 50, 50)
end

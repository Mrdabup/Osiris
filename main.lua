wf = require 'windfield'



function love.load()
  world = wf.newWorld(0, 500, false)
  world:setGravity(0, 512)
  playerCollider = world:newRectangleCollider(100, 100,50,50)
  playerCollider:setType('dynamic')
  groundCollider = world:newRectangleCollider(0,500,1000,100)
  groundCollider:setType('static')
end

function love.update(dt)
  local px, py = playerCollider:getLinearVelocity()
  if love.keyboard.isDown("a") and px > -250 then
    playerCollider:applyLinearImpulse(-35,0)
  end
  if love.keyboard.isDown("d")  and px < 250 then
    playerCollider:applyLinearImpulse(35,0)
  end
  function love.keypressed(key)
    if key == "escape" then
      love.event.quit()
    end
    if key == "space" then
      playerCollider:applyLinearImpulse(0,-1500)
    end
  end
    world:update(dt)
end

function love.draw()
  world:draw() 
end

local handImage = love.graphics.newImage('graphics/hand.png')
local grabImage = love.graphics.newImage('graphics/hand-grab.png')
local handCursor = love.mouse.newCursor(handImage:getData(), 0, 0)
local grabCursor = love.mouse.newCursor(grabImage:getData(), 0, 0)

-- Start with a released hand
love.mouse.setCursor(handCursor)

function love.mousepressed(x, y, button, istouch)
	-- On press, the hand grabs
	love.mouse.setCursor(grabCursor)
end

function love.mousereleased(x, y, button, istouch)
	-- On release, the hand releases
	love.mouse.setCursor(handCursor)
end


-----------------------------------------------------------------------------------------
-- Touch And Drag
-- Taisei S
-- This program displays images that can be dragged around the screen. 
-----------------------------------------------------------------------------------------

--Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--Background images, width and height
local backgroundImage = display.newImageRect("Images/50c.jpg", display.contentWidth, display.contentHeight)
backgroundImage.anchorX = 0
backgroundImage.anchorY = 0

--Images
local girl = display.newImageRect("Images/girl5.png", 100, 100)
local squirrel = display.newImageRect("Images/bluething.png", 100, 100)
local oof = display.newImageRect("Images/Oof.png", 200, 200)

--audio
local oofAudio = audio.loadSound("Audio/oof.mp3")
local squirrelAudio1 = audio.loadSound("Audio/12.wav")
local squirrelAudio2 = audio.loadSound("Audio/13.wav")

--Inital Point
girl.x = 300
girl.y = 500
squirrel.x = 450 
squirrel.y = 125
oof.x = 900
oof.y = 600

--Boolean Vaiables
local touchGirl = false
local touchSquirrel = false
local touchOof = false

--Function
--When girl is touched, move the image
local function GirlListener(touch)

	if(touch.phase == "began") then
		if (touchSquirrel == false and touchOof == false) then
			touchGirl = true
		end
	end

	if ( (touch.phase == "moved" ) and (touchGirl == true) ) then
		girl.x = touch.x
		girl.y = touch.y
	end

	if ( touch.phase == "ended" ) then
		touchGirl = false
		touchSquirrel = false
		touchOof = false
	end 
end

--function
--When oof is touched, move the image
local function OofListener(touch)

	if(touch.phase == "began") then
		if (touchSquirrel == false and touchGirl == false) then
			touchOof = true
			audio.play(oofAudio)
		end
	end

	if ( (touch.phase == "moved" ) and (touchOof == true) ) then
		oof.x = touch.x
		oof.y = touch.y

	end

	if ( touch.phase == "ended" ) then
		touchGirl = false
		touchSquirrel = false
		touchOof = false
	end 
end

local function SquirrelListener(touch)

	if(touch.phase == "began") then
		if (touchOof == false and touchGirl == false) then
			touchSquirrel = true
			audio.play(squirrelAudio1)
		end
	end

	if ( (touch.phase == "moved" ) and (touchSquirrel == true) ) then
		squirrel.x = touch.x
		squirrel.y = touch.y
	end

	if ( touch.phase == "ended" ) then
		touchGirl = false
		touchSquirrel = false
		touchOof = false
		audio.play(squirrelAudio2)
	end 
end

--event listeners
girl:addEventListener("touch", GirlListener)
oof:addEventListener("touch", OofListener)
squirrel:addEventListener("touch", SquirrelListener)
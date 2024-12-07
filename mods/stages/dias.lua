function onCreate()

--All background sprites
	--lab
		makeLuaSprite('lab', 'radio/darkened lab', 400, -110);
		scaleObject('lab', 0.32, 0.32)
		addLuaSprite('lab', false);
	--galaxy
		makeLuaSprite('galaxy', 'radio/Galaxy alone', 400, -110);
		scaleObject('galaxy', 0.32, 0.32)
		addLuaSprite('galaxy', false);
	--moon
		makeLuaSprite('moon', 'radio/Moon alone', 400, -110);
		scaleObject('moon', 0.32, 0.32)
		addLuaSprite('moon', false);
	--clouds
		makeLuaSprite('cloud1', 'radio/cloud 1', 3000, 150);
		makeLuaSprite('cloud2', 'radio/cloud 2', 2500, 100);
		makeLuaSprite('cloud3', 'radio/cloud 3', 2000, -75);
		addLuaSprite('cloud1', false);
		addLuaSprite('cloud2', false);
		addLuaSprite('cloud3', false);
		scaleObject('cloud1', 0.20, 0.20)
		scaleObject('cloud2', 0.20, 0.20)
		scaleObject('cloud3', 0.20, 0.20)

	
--add split sprite in the middle of the screen
	makeAnimatedLuaSprite('border', 'radio/theborder', -230, -90)
	addAnimationByPrefix('border', 'idle', 'idle', 6, true)
	setObjectCamera('border', 'hud')
	scaleObject('border', 0.45, 0.45)
	addLuaSprite('border', true)


--order in which sprites appear in the background	
	setObjectOrder('galaxy', 0)
	setObjectOrder('moon', 1)
	setObjectOrder('lab', 3)
	setObjectOrder('cloud1', 2)
	setObjectOrder('cloud2', 2)
	setObjectOrder('cloud3', 2)
	
	setObjectOrder('border', 1)
	
	
end
function onCreatePost()
	--load the files so as not to crash the game when changing characters and sprites
	if songName == 'radio' then
		addCharacterToList('DIApixel', 'dad')
		addCharacterToList('Loyal D playablepixel', 'boyfriend')
		precacheImage('radio/labpixel')
	end
end

size = 0.7
function onStepHit()

--clouds parallax	
    if curStep == 1 then
		doTweenX('cloudx1', 'cloud1', -3000, 75, 'linear');
	end
	
	if curStep == 300 then
		doTweenX('cloudx2', 'cloud2', -3000, 125, 'linear');
	end
	
	if curStep == 700 then
		doTweenX('cloudx3', 'cloud3', -3000, 100, 'linear');
	end
		
	if curStep == 1567 then
		doTweenX('cloudx4', 'cloud3', 3000, 50, 'linear');
	end


--Change characters and map mid-level
     if curStep == 1024 and songName == 'radio' then
	 
		cameraFlash('hud', '255, 255, 255', 2.25, true)
		triggerEvent('Change Character', 'dad', 'DIApixel')
		triggerEvent('Change Character', 'bf', 'Loyal D playablepixel')
	 
		makeLuaSprite('pixellab', 'radio/labpixel', 400, -110);
		scaleObject('pixellab', 0.32, 0.32)
		addLuaSprite('pixellab', false);

     end
	 
 --Change the characters to the normal version and delete sprites that will no longer be used 
	 if curStep == 1567 and songName == 'radio' then
		triggerEvent('Change Character', 'dad', 'DIA')
		triggerEvent('Change Character', 'bf', 'Loyal D playable')
		removeLuaSprite("pixellab",true)

        setProperty('boyfriend.flipX', false)

    	scaleObject('boyfriend', size,size)

	 	cameraFlash('hud', '255, 255, 255', 2.5, true)
		
	 
	 end
end

function onUpdatePost()
	setPropertyFromClass('flixel.FlxG', 'camera.followLerp', 0)
	setProperty('camGame.scroll.y', 250-(screenHeight / 2))
	setProperty('camGame.scroll.x', 1000-(screenWidth / 2))
end


function onTweenCompleted(tag) --optimization among other stuff
--remove clouds
	if tag == 'cloudx1' then
		removeLuaSprite('cloud1');
	end
	if tag == 'cloudx2' then
		removeLuaSprite('cloud2');
	end	
	if tag == 'cloudx4' then
		removeLuaSprite('cloud3'); 
	end
end
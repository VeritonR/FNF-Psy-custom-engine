x = -425
y = -600
ex = 1.155
ey = 1.135
step = 1

function onCreate()
	-- background shit
	makeLuaSprite('1', 'jully/1', x, y);
	setScrollFactor('1', 1, 1);
	scaleObject('1', ex,ey)
	
	makeLuaSprite('2', 'jully/2', x, y);
	setScrollFactor('2', 1, 1);
	scaleObject('2', ex,ey)
	
	makeLuaSprite('3', 'jully/3', x, y);
	setScrollFactor('3', 1, 1);
	scaleObject('3', ex,ey)
	
	makeLuaSprite('4', 'jully/4', x, y);
	setScrollFactor('4', 1, 1);
	scaleObject('4', ex,ey)
	
	makeLuaSprite('5', 'jully/5', x, y);
	setScrollFactor('5', 1, 1);
	scaleObject('5', ex,ey)
	
	makeLuaSprite('6', 'jully/6', x, y+50);
	setScrollFactor('6', 1, 1);
	scaleObject('6', ex,ey)
	
	makeLuaSprite('7', 'jully/7', x, y+175);
	setScrollFactor('7', 1, 1);
	scaleObject('6', ex,ey)
	
	--ADS
	makeLuaSprite('ad1', 'jully/bgads/ad1', x, y);
	setScrollFactor('ad1', 1, 1);
	scaleObject('ad1', ex,ey)
	
	makeLuaSprite('ad2', 'jully/bgads/ad2', x, y);
	setScrollFactor('ad2', 1, 1);
	scaleObject('ad2', ex,ey)
	
	makeLuaSprite('ad3', 'jully/bgads/ad3', x, y);
	setScrollFactor('ad3', 1, 1);
	scaleObject('ad3', ex,ey)
	
	makeLuaSprite('ad4', 'jully/bgads/ad4', x, y);
	setScrollFactor('ad4', 1, 1);
	scaleObject('ad4', ex,ey)
	
	makeLuaSprite('ad5', 'jully/bgads/ad5', x, y);
	setScrollFactor('ad5', 1, 1);
	scaleObject('ad5', ex,ey)
	
	makeLuaSprite('ad6', 'jully/bgads/ad6', x, y);
	setScrollFactor('ad6', 1, 1);
	scaleObject('ad6', ex,ey)

	addLuaSprite('1', false);
	addLuaSprite('2', false);
	addLuaSprite('3', false);
	addLuaSprite('ad1', false);
	addLuaSprite('ad2', false);
	addLuaSprite('ad3', false);
	addLuaSprite('ad4', false);
	addLuaSprite('ad5', false);
	addLuaSprite('ad6', false);
	addLuaSprite('4', false);
	addLuaSprite('7', false);
	addLuaSprite('5', false);
	addLuaSprite('6', true);

end

function onCreatePost()
	if songName ~= 'Retaliation' then
		setCharacterX('gf', 350	)
		setProperty('defaultCamZoom',0.47)

	end
end

function opponentNoteHit(index, noteDir, noteType, isSustainNote)
	beatcam = true
end

function onBeatHit()
	if beatcam then
		if curBeat % 2 == 0 then
			--triggerEvent('Add Camera Zoom', 0.04,0.05)
		end
	end
end

function onSectionHit()
			if (step == 1) then
				setProperty('ad1.visible', true)
				setProperty('ad2.visible', false)
				setProperty('ad3.visible', false)
				setProperty('ad4.visible', false)
				setProperty('ad5.visible', false)
				setProperty('ad6.visible', false)
				step = math.random(1,6)
			end
			if (step == 2) then
				setProperty('ad1.visible', false)
				setProperty('ad2.visible', true)
				setProperty('ad3.visible', false)
				setProperty('ad4.visible', false)
				setProperty('ad5.visible', false)
				setProperty('ad6.visible', false)
				step = math.random(1,6)
			end
			if (step == 3) then
				setProperty('ad1.visible', false)
				setProperty('ad2.visible', false)
				setProperty('ad3.visible', true)
				setProperty('ad4.visible', false)
				setProperty('ad5.visible', false)
				setProperty('ad6.visible', false)
				step = math.random(1,6)
			end
			if (step == 4) then
				setProperty('ad1.visible', false)
				setProperty('ad2.visible', false)
				setProperty('ad3.visible', false)
				setProperty('ad4.visible', true)
				setProperty('ad5.visible', false)
				setProperty('ad6.visible', false)
				step = math.random(1,6)
			end	
			if (step == 5) then
				setProperty('ad1.visible', false)
				setProperty('ad2.visible', false)
				setProperty('ad3.visible', false)
				setProperty('ad4.visible', false)
				setProperty('ad5.visible', true)
				setProperty('ad6.visible', false)
				step = math.random(1,6)
			end
			if (step == 6) then
				setProperty('ad1.visible', false)
				setProperty('ad2.visible', false)
				setProperty('ad3.visible', false)
				setProperty('ad4.visible', false)
				setProperty('ad5.visible', false)
				setProperty('ad6.visible', true)
				step = math.random(1,6)
			end
end



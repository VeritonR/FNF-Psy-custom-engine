xy = {-200, -85}
size = 1.015
function onCreate()
--BG
	makeLuaSprite('bg1', 'treznor/1', xy[1], xy[2]);
	scaleObject('bg1', size,size);

		makeLuaSprite('bg2', 'treznor/2', xy[1], xy[2]);
		scaleObject('bg2', size, size);
	
			makeLuaSprite('bg3', 'treznor/3', xy[1], xy[2]);
			scaleObject('bg3', size, size);
	
				makeLuaSprite('bg4', 'treznor/4', xy[1], xy[2]);
				scaleObject('bg4', size, size);
				setProperty("bg4.alpha", 0.5)
	
					makeLuaSprite('bg5', 'treznor/behind', xy[1], xy[2]);
					scaleObject('bg5', size, size);
	
						makeLuaSprite('bg6', 'treznor/front', xy[1], xy[2]+20);
						scaleObject('bg6', size, size);
						setObjectOrder("bg6", 30)
	
--GUARDS
	makeAnimatedLuaSprite('Guards','treznor/Guards', 720, 225)
	addAnimationByPrefix('Guards','GF Dancing Beat','GF Dancing Beat',24,true)
    setScrollFactor('Guards', 1, 1);
	scaleObject('Guards', 0.65, 0.65);
	
--GOSHA
	makeAnimatedLuaSprite('gosha','characters/Gosha_Speakers_Assets', 1000, 45)
	addAnimationByPrefix('gosha','dance','gosha Dance',19,true)
    setScrollFactor('gosha', 1, 1);
	scaleObject('gosha', 0.6, 0.6);
	setProperty('gosha.flipX', false)
	setObjectOrder("gosha", 7)

--JOHNNY
	makeAnimatedLuaSprite('johnny','characters/Johnny_Bump_Assets', 505, 330) --POSITION
	addAnimationByPrefix('johnny','dance','john Dance',24,true)
    setScrollFactor('johnny', 1, 1);
	scaleObject('johnny', 0.525, 0.525);  --SIZE
	setProperty('johnny.flipX', false)

--ADD SPRITES
	addLuaSprite('bg1', false);
	addLuaSprite('bg2', false);
	addLuaSprite('bg3', false);
	addLuaSprite('bg4', true);
	addLuaSprite('bg5', false);
	addLuaSprite('bg6', true);
	addLuaSprite('Guards', false);
	addLuaSprite('gosha', false);
	addLuaSprite('johnny', false);


end
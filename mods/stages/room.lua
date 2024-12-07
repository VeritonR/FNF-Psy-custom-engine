function onCreate()
	-- background shit
	makeLuaSprite('righttimebg/bg_righttime', 'righttimebg/bg_righttime', -1200, -650);
	setScrollFactor('righttimebg/bg_righttime', 1, 1);
	scaleObject('righttimebg/bg_righttime', 1.35, 1.35);

	makeAnimatedLuaSprite('righttime_speakers', 'righttimebg/righttime_speakers', -1000, -530)
    addAnimationByPrefix('righttime_speakers', 'a', 'rt speakers', 36, true)
	objectPlayAnimation('righttime_speakers', 'a', true)
	scaleObject('righttime_speakers', 1.1, 1.1);
    setScrollFactor('righttime_speakers', 1, 1);
	
	setObjectOrder('righttimebg/bg_righttime', 2)


	makeAnimatedLuaSprite('cass', 'righttimebg/Cass_BG_Assets', -365, -300) --changing this value you can move Cass (X=-565) (Y=-495)
    addAnimationByPrefix('cass', 'a', 'cass danceTrailer', 24, true)
	objectPlayAnimation('cass', 'a', true)
	scaleObject('cass', 1.15, 1.15); --edit both values
    setScrollFactor('cass', 1, 1);
	
	addLuaSprite('righttimebg/bg_righttime', false);
	addLuaSprite('righttime_speakers', false);
	addLuaSprite('cass', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
function onCreate()
	-- background shit
	makeLuaSprite('bgflippy', 'week 12/bg', -75, -725);
	setScrollFactor('bgflippy', 1, 1);
	scaleObject('bgflippy', 2, 2);
	
	addLuaSprite('bgflippy', false);
end
X = 0
Y = 0
size = 1
function onCreate()
	-- background shit
	makeLuaSprite('mapa', 'Winterzbois/1', X, Y);
	scaleObject('mapa', size, size);

	makeLuaSprite('cadeiras', 'Winterzbois/2', X, Y)
	scaleObject('cadeiras', size, size);
	setObjectOrder('cadeiras', 7)
	
	addLuaSprite('mapa', false);
	addLuaSprite('cadeiras', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
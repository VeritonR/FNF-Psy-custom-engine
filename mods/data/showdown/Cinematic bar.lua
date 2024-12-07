function onCreate()
        makeLuaSprite('Top')
        makeGraphic('Top' , screenWidth, 500, '000000')
        addLuaSprite('Top', false)
        setObjectCamera('Top', 'hud')
        setProperty('Top.antialiasing', false)
		setObjectOrder('Top', 0)

        makeLuaSprite('bar')
        makeGraphic('bar' , screenWidth, 500, '000000')
        addLuaSprite('bar', false)
        setObjectCamera('bar', 'hud')
        setProperty('bar.antialiasing', false)
		setObjectOrder('bar', 0)
		
        setProperty('bar.y', 825)
        setProperty('Top.y', -600)
		
end

function onUpdatePost()

	if curStep == 346 then
		doTweenY('A','bar', 625, 1,'smoothStepOut')
		doTweenY('B','Top', -400, 1,'smoothStepOut')
		doTweenColor('bg', 'bg', '434343', 0.5, 'linear');
		doTweenColor('gf', 'gf', '434343', 0.5, 'linear');
		doTweenColor('dad', 'dad', '434343', 0.5, 'linear');
		doTweenColor('pessoas1', 'pessoas1', '434343', 0.5, 'linear');
		doTweenColor('pessoas2', 'pessoas2', '434343', 0.5, 'linear');
		doTweenColor('gosha', 'gosha', '434343', 0.5, 'linear');
		doTweenColor('johnny', 'johnny', '434343', 0.5, 'linear');
	end
	if curStep == 383 then
		doTweenY('A','bar', 1000, 0.5,'linear')
		doTweenY('B','Top', -1000, 0.5,'linear')	
		doTweenColor('bg', 'bg', 'FFFFFF', 0.5, 'linear');
		doTweenColor('gf', 'gf', 'FFFFFF', 0.5, 'linear');
		doTweenColor('dad', 'dad', 'FFFFFF', 0.5, 'linear');
		doTweenColor('pessoas1', 'pessoas1', 'FFFFFF', 0.5, 'linear');
		doTweenColor('pessoas2', 'pessoas2', 'FFFFFF', 0.5, 'linear');
		doTweenColor('gosha', 'gosha', 'FFFFFF', 0.5, 'linear');
		doTweenColor('johnny', 'johnny', 'FFFFFF', 0.5, 'linear');
	end
	--
	if curStep == 1147 then
		doTweenColor('bg', 'bg', '434343', 0.5, 'linear');
		doTweenColor('bf', 'boyfriend', '434343', 0.5, 'linear');
		doTweenColor('gf', 'gf', '434343', 0.5, 'linear');
		doTweenColor('pessoas1', 'pessoas1', '434343', 0.5, 'linear');
		doTweenColor('pessoas2', 'pessoas2', '434343', 0.5, 'linear');
		doTweenColor('gosha', 'gosha', '434343', 0.5, 'linear');
		doTweenColor('johnny', 'johnny', '434343', 0.5, 'linear');
	end
	if curStep == 1270 then
		doTweenColor('dad', 'dad', '434343', 0.5, 'linear');
		doTweenColor('bf', 'boyfriend', 'FFFFFF', 0.5, 'linear');
	end
	if curStep == 1408 then	
		doTweenColor('bg', 'bg', 'FFFFFF', 2, 'linear');
		doTweenColor('gf', 'gf', 'FFFFFF', 2, 'linear');
		doTweenColor('dad', 'dad', 'FFFFFF', 2, 'linear');
		doTweenColor('bf', 'boyfriend', 'FFFFFF', 2, 'linear');
		doTweenAlpha('hud','HUD',0,2,'linear');
		doTweenColor('pessoas1', 'pessoas1', 'FFFFFF', 0.5, 'linear');
		doTweenColor('pessoas2', 'pessoas2', 'FFFFFF', 0.5, 'linear');
		doTweenColor('gosha', 'gosha', 'FFFFFF', 0.5, 'linear');
		doTweenColor('johnny', 'johnny', 'FFFFFF', 0.5, 'linear');
	end
	
end
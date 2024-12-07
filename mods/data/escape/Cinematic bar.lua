function onCreate()
        makeLuaSprite('Top')
        makeGraphic('Top' , screenWidth, 500, '000000')
        addLuaSprite('Top', false)
        setObjectCamera('Top', 'other')
        setProperty('Top.antialiasing', false)
		setObjectOrder('Top', 0)

        makeLuaSprite('bar')
        makeGraphic('bar' , screenWidth, 500, '000000')
        addLuaSprite('bar', false)
        setObjectCamera('bar', 'other')
        setProperty('bar.antialiasing', false)
		setObjectOrder('bar', 0)
		
        setProperty('bar.y', 825)
        setProperty('Top.y', -600)
		
end

function onSongStart()
		doTweenY('A','bar', 625, 1,'smoothStepOut')
		doTweenY('B','Top', -400, 1,'smoothStepOut')
end

function onUpdatePost()

	if curStep == 125 then
		doTweenY('A','bar', 1000, 1,'linear')
		doTweenY('B','Top', -1000, 1,'linear')	
	end
	
end
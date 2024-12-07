function onCreate() 
	setProperty('introSoundsSuffix', 'deactive')
--Ready
    makeLuaSprite('ready', 'ready', 300, 250)
	setObjectCamera('ready', 'other')
	setProperty('ready.visible', false)
--set
	makeLuaSprite('set', 'set', 300, 175)
	setObjectCamera('set', 'other')
	setProperty('set.visible', false)
--Go	
	makeLuaSprite('go', 'go', 300, 125)
	setObjectCamera('go', 'other')
	setProperty('go.visible', false)

	addLuaSprite('ready', false)
	addLuaSprite('set', false)
	addLuaSprite('go', false)
end

function onCountdownTick(counter)
	if counter == 0 then

		playSound('intro3')

	elseif counter == 1 then

		setProperty('ready.visible', true)
		doTweenX("ready1", "ready", 750, 0.5, "linear")
		doTweenAlpha('ready', 'ready', 0, 0.5, 'CircInOut')
		setProperty('countdownReady.visible', false)
		playSound('intro2')	

	elseif counter == 2 then

        setProperty('set.visible', true)
		doTweenX("set1", "set", -250, 0.5, "linear")
		doTweenAlpha('set', 'set', 0, 0.5, 'CircInOut')
		setProperty('countdownSet.visible', false)
		playSound('intro1')

	elseif counter == 3 then

		setProperty('go.visible', true)
		doTweenX("go1", "go", 750, 0.5, "linear")
		doTweenAlpha('go', 'go', 0, 0.5, 'CircInOut')
		setProperty('countdownGo.visible', false)
		playSound('introGo')

	end
end
function onCreate()
		doTweenAlpha('hudFadeEventTween', 'camHUD', 0, 0.0001, 'linear');
		makeLuaSprite('Top')
        makeGraphic('Top' , screenWidth, screenHeight, '000000')
		scaleObject("Top", 5, 5)
		setProperty("Top.x",-500)
		setProperty("Top.y",-100)
        addLuaSprite('Top', true)
        setObjectCamera('Top', 'game')
        setProperty("Top.alpha", 1)
        setProperty("boyfriend.alpha", 0)
        setProperty("dad.alpha", 0)
        setProperty("gf.alpha", 0)
end

function onSongStart()
			doTweenAlpha('Topalpha', 'Top', 0, 10, 'linear');
			doTweenAlpha('hudFade', 'camHUD', 1, 4.5, 'linear');

			doTweenAlpha('boyfriend', 'boyfriend', 1, 4.5, 'linear');
			doTweenAlpha('dad', 'dad', 1, 4.5, 'linear');
			doTweenAlpha('gf', 'gf', 1, 4.5, 'linear');
end
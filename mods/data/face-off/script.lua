function onCreatePost()

        makeLuaSprite('Black','',0,0)
		makeGraphic('Black',1920, 1080, '000000')
		setObjectCamera('Black','hud')
		addLuaSprite('Black',true)

end

function onSongStart()
	doTweenAlpha('BlackFade','Black', 0, 6)
end
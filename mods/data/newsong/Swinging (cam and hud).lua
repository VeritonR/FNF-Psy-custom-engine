function onCreate()
	makeLuaSprite('blackscreen', 'blackscreen', -50, 0);
	addLuaSprite('blackscreen', false)
    setObjectCamera('blackscreen', 'other')
	scaleObject('blackscreen', 6, 6)
	setProperty('blackscreen.alpha', 0)
	setProperty('camHUD.alpha', 0)
end

function onStepHit()
	if curStep == 1 then
        doTweenZoom('iii', 'camGame', 1.1, 10, 'SmoothStepInOut')
        doTweenAngle('lllk', 'camGame', 6, 2.5, 'SmoothStepInOut')
	end
	if curStep == 120 then
		doTweenAlpha("hud", "camHUD", 1, 1, "linear")
	end
	if curStep == 127 then
		cameraFlash('camHUD', 'FFFFFF', 1, false)
		doTweenAngle('lllk1', 'camGame', 0, 1, 'SmoothStepInOut')
		doTweenZoom('iii', 'camGame', 1, 0.5, 'SmoothStepOut')
	end

	if curStep == 1279 then
		cameraFlash('other', 'FFFFFF', 0.5)
	end

	if curStep == 1295 then
		doTweenAlpha('camHUD', 'camHUD', 0, 0.5)
	end

	if curStep == 1350 then
		doTweenAlpha('blackscreen', 'blackscreen', 1, 15)
	end

	if curStep == 1407 then
		doTweenAlpha('blackscreen', 'blackscreen', 1, 0.01)
		cameraFlash('other', 'FFFFFF', 2)
	end
end

disabled = false

function onTweenCompleted(t)
	if curStep <= 110 then
		if t ==  'lllk' then
			doTweenAngle('lll', 'camGame', -6, 2.5, 'SmoothStepInOut')
		end
		if t ==  'lll' then
			doTweenAngle('lllk', 'camGame', 6, 2.5, 'SmoothStepInOut')
		end
	end	
end

v1 = 0.75
function Beat()
	if curBeat % 2 == 0 then
        setProperty('camGame.angle', v1*12)
		doTweenAngle('gameTween', 'camGame', 0, 1.5, 'backOut')
	else
        setProperty('camGame.angle', v1*-12)
		doTweenAngle('gameTween', 'camGame', 0, 1.5, 'backOut')
	end
end

function onSectionHit()
	if curStep >= 130 and curStep <= 384 or curStep >= 640 and curStep <= 1280 then
		Beat()
	end
end
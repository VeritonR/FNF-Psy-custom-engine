function onCreate()
			doTweenAlpha('hudFadeEventTween', 'camHUD', 0, 0.001, 'linear');
end

function onUpdatePost()
		if curStep == 125 then
			doTweenAlpha('hudFade', 'camHUD', 1, 1, 'linear');
		end
end
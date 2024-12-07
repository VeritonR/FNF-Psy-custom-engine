--use this variable to define in which curstep the script starts

StartOn = 384
StartOn2 = 1152

--use this variable to define which curstep the script ends at

EndOn = 768
EndOn2 = 1280

--                                END                               --




--Don't touch anything here (unless you know what you're doing)
enabled = true

function onStepHit()
	if curStep == StartOn or curStep == StartOn2  then
	
		doTweenAngle('turn', 'camGame', 2.5, crochet/300, 'sineInOut')
		doTweenAngle('camturn', 'camHUD', -2.5, crochet/300, 'sineInOut')
		enabled = true
		
	end
	
	if curStep == EndOn or curStep == EndOn2 then
		enabled = false
	end
end

function onTweenCompleted(t)
	if enabled then
		if t == 'turn' then
			doTweenAngle('turn1', 'camGame', -2.5, crochet/300, 'sineInOut')
			doTweenAngle('camturn1', 'camHUD', 2.5, crochet/300, 'sineInOut')
		end
		if t == 'turn1' then
			doTweenAngle('turn', 'camGame', 2.5, crochet/300, 'sineInOut')
			doTweenAngle('camturn', 'camHUD', -2.5, crochet/300, 'sineInOut')
		end
	else
		doTweenAngle('turn3', 'camGame', 0, crochet/300, 'sineInOut')
		doTweenAngle('turn4', 'camHUD', 0, crochet/300, 'sineInOut')
	end
end
arrowX = {92,204,316,428,732,844,956,1068}
no = 1
active = true

function onUpdatePost()
    if getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') == true then
		if curStep == 290 then
			noteTweenX('A', 0, 92, 1.5, 'BackIn')
			noteTweenX('B', 1, 204, 1.5, 'BackIn')
			noteTweenX('C', 2, 316, 1.5, 'BackIn')
			noteTweenX('D', 3, 428, 1.5, 'BackIn')
		--Player
			noteTweenX('E', 4, 732, 1.5, 'BackIn')
			noteTweenX('F', 5, 844, 1.5, 'BackIn')
			noteTweenX('G', 6, 956, 1.5, 'BackIn')
			noteTweenX('H', 7, 1068, 1.5, 'BackIn')
            for i = 0, 7 do -- fades in notes (in case of mid scroll again)
                noteTweenAlpha(i,i,1,0.1,'linear');
            end
		end
	end
	if curStep == 384 or curStep == 1152 then
 
        setProperty('camZoomingMult', 0)
    	setProperty('camZoomingDecay', 0)
        doTweenZoom('Zoomie', 'camHUD', 0.975, 0.5, 'smoothStepOut')
        active = true
	end
	if curStep == 760 or curStep == 1280 then
        
            setProperty('camZoomingMult', 1)
    	    setProperty('camZoomingDecay', 1)
    		doTweenZoom('Zoomie', 'camHUD', 1, 1, 'smoothStepInOut')
            active = false
            reset()
	end
end

x = 1
function onUpdate(elapsed)
    if curStep == 384 or curStep == 1152 then
        runTimer("work", 0.15,1); -- invert notes
		runTimer("change", 0.1,1); -- invert x
    end
end

function arrows() -- move
if x == 0 then
   --Opponent
       noteTweenX('A', 0, 182, 1.5, 'smoothStepOut')
       noteTweenX('B', 1, 304, 1.5, 'smoothStepOut')-- original position 92 204 316 428
       noteTweenX('C', 2, 416, 1.5, 'smoothStepOut')
       noteTweenX('D', 3, 528, 1.5, 'smoothStepOut')

   --Player
       noteTweenX('E', 4, 834, 1.5, 'smoothStepOut')
       noteTweenX('F', 5, 945, 1.5, 'smoothStepOut')-- original positions 734 845 956 1067
       noteTweenX('G', 6, 1056, 1.5, 'smoothStepOut')
       noteTweenX('H', 7, 1167, 1.5, 'smoothStepOut')
end
if x == 1 then -- player to right
        --Opponent
            noteTweenX('AA', 0, -2, 1.5, 'smoothStepOut')
            noteTweenX('BB', 1, 104, 1.5, 'smoothStepOut')-- original position 92 204 316 428
            noteTweenX('C', 2, 216, 1.5, 'smoothStepOut')
            noteTweenX('D', 3, 328, 1.5, 'smoothStepOut')

        --Player
            noteTweenX('E', 4, 634, 1.5, 'smoothStepOut')
            noteTweenX('F', 5, 745, 1.5, 'smoothStepOut')-- original positions 734 845 956 1067
            noteTweenX('G', 6, 856, 1.5, 'smoothStepOut')
            noteTweenX('H', 7, 967, 1.5, 'smoothStepOut')
end
    runTimer("work", 1.5,1); -- invert notes
    runTimer("change", 0.5,1); -- invert x
end

function reset() -- right reset
    for i = 0, 7 do
        noteTweenAngle('r' .. i .. '',i,0,1,'quartOut');
    end
--opponent
    noteTweenX('AA', 0, 92, 1.5, 'smoothStepOut')
    noteTweenX('BB', 1, 204, 1.5, 'smoothStepOut')-- original position 92 204 316 428
    noteTweenX('C', 2, 316, 1.5, 'smoothStepOut')
    noteTweenX('D', 3, 428, 1.5, 'smoothStepOut')

--Player
    noteTweenX('E', 4, 734, 1.5, 'smoothStepOut')
    noteTweenX('F', 5, 845, 1.5, 'smoothStepOut')-- original positions 734 845 956 1067
    noteTweenX('G', 6, 956, 1.5, 'smoothStepOut')
    noteTweenX('H', 7, 1067, 1.5, 'smoothStepOut')
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'work' and active == true then
        if active == true then
             arrows() -- invert notes
        end
    end 
    if tag == 'change' and active == true then
         if x == 0 then
          x = 1
        else
          x = 0
         end
    end
end
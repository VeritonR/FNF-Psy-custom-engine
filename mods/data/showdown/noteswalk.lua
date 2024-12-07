arrowX = {732,844,956,1068,92,204,316,428}
arrowX2 = {92,204,316,428,732,844,956,1068}
names = {'A','B','C','D','E','F','G','H'}
active = true
x = 0
no = 1

function onUpdatePost()
	if getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') == true then
		if curStep == 336 then
			noteTweenX('A', 0, 92, 1.5, 'BackIn')
			noteTweenX('B', 1, 204, 1.5, 'BackIn')
			noteTweenX('C', 2, 316, 1.5, 'BackIn')
			noteTweenX('D', 3, 428, 1.5, 'BackIn')
		--Player
			noteTweenX('E', 4, 732, 1.5, 'BackIn')
			noteTweenX('F', 5, 844, 1.5, 'BackIn')
			noteTweenX('G', 6, 956, 1.5, 'BackIn')
			noteTweenX('H', 7, 1068, 1.5, 'BackIn')
		end
	end
	if curStep == 380 then
		runTimer("work", 2.5,1); -- invert notes
		runTimer("change", 0.5,1); -- invert x
				noteTweenAngle('aa',0,360,1,'quartOut');
				noteTweenAngle('bb',1,360,1,'quartOut');
				noteTweenAngle('cc',2,360,1,'quartOut');
				noteTweenAngle('dd',3,360,1,'quartOut');
				
				noteTweenAngle('ee',4,360,1,'quartOut');
				noteTweenAngle('ff',5,360,1,'quartOut');
				noteTweenAngle('gg',6,360,1,'quartOut');
				noteTweenAngle('hh',7,360,1,'quartOut');
	end
	if curStep == 381 then
				if x == 0 then
					--Opponent
						noteTweenX('AA', 0, 734, 2.5, 'smoothStepOut')
						noteTweenX('BB', 1, 845, 2.5, 'smoothStepOut')
						noteTweenX('C', 2, 956, 2.5, 'smoothStepOut')
						noteTweenX('D', 3, 1067, 2.5, 'smoothStepOut')

					--Player
						noteTweenX('E', 4, 92, 2.5, 'smoothStepOut')
						noteTweenX('F', 5, 204, 2.5, 'smoothStepOut')
						noteTweenX('G', 6, 316, 2.5, 'smoothStepOut')
						noteTweenX('H', 7, 428, 2.5, 'smoothStepOut')
				end
						noteTweenAlpha('Alphaa',0,0.1,0.5,'linear');
						noteTweenAlpha('Alphab',1,0.1,0.5,'linear');
						noteTweenAlpha('Alphac',2,0.1,0.5,'linear');
						noteTweenAlpha('Alphad',3,0.1,0.5,'linear');

	end
	if curStep == 382 then
		makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	    addLuaSprite('flash', true);
	    setProperty('flash.scale.x',2)
		setProperty('flash.scale.y',2)
        setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,1,'linear')
	end
	if curStep == 510 then --original sides
            reset() 
			active = false
	end
	if curStep == 794 then  -- mid scroll (feat. opponent arrows)
        midScroll()
	end
	if curStep == 825 then --original sides
            reset() 
			active = false
	end
	if curStep == 889 then  -- mid scroll (feat. opponent arrows)
             midScroll()
	end
	if curStep == 952 then --original sides
            reset() 
			active = false
	end
end

function arrows() -- move
	for i = 0,7 do
         noteTweenAngle('AngleA'..i,i,360,1,'quartOut');
	end
    if x == 0 then
		--Opponent
			noteTweenX('A', 0, 732, 2.5, 'smoothStepOut')
			noteTweenX('B', 1, 844, 2.5, 'smoothStepOut')
			noteTweenX('C', 2, 956, 2.5, 'smoothStepOut')
			noteTweenX('D', 3, 1068, 2.5, 'smoothStepOut')

		--Player
			noteTweenX('E', 4, 92, 2.5, 'smoothStepOut')
			noteTweenX('F', 5, 204, 2.5, 'smoothStepOut')
			noteTweenX('G', 6, 316, 2.5, 'smoothStepOut')
			noteTweenX('H', 7, 428, 2.5, 'smoothStepOut')
	end
    if x == 1 then -- player to right
			noteTweenX('A', 0, 92, 2.5, 'smoothStepOut')
			noteTweenX('B', 1, 204, 2.5, 'smoothStepOut')
			noteTweenX('C', 2, 316, 2.5, 'smoothStepOut')
			noteTweenX('D', 3, 428, 2.5, 'smoothStepOut')
		--Player
			noteTweenX('E', 4, 732, 2.5, 'smoothStepOut')
			noteTweenX('F', 5, 844, 2.5, 'smoothStepOut')
			noteTweenX('G', 6, 956, 2.5, 'smoothStepOut')
			noteTweenX('H', 7, 1068, 2.5, 'smoothStepOut')
    end
	runTimer("work", 2.5,1); -- invert notes
	runTimer("change", 0.5,1); -- invert x
end

function reset(no) -- right reset
    for i = 0, 7 do
        noteTweenX(i,i,arrowX2[i+1],1.5,'quartOut');
        noteTweenAlpha('a' .. i .. '',i,1,2,'linear');
        cancelTween(names[i+1])
        noteTweenAngle('r' .. i .. '',i,0,1,'quartOut');
        x = 0
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'work' and active == true then
        arrows() -- invert notes
    end 
	if tag == 'change' and active == true then
		if x == 0 then
			x = 1
		else
			x = 0
		end
    end
end

function midScroll() -- small animation for mid scroll
    for i = 0, 3 do
        noteTweenX('pp'.. i ..'',i,412+(112*i),1.5,'quartOut');
        noteTweenAlpha('ia'..i,i,0,0.5,'linear');
    end
    for i = 4, 7 do
        noteTweenX('pp'.. i ..'',i,412+(112*(i-4)),1.5,'quartOut');
    end
    for i = 0, 7 do
        noteTweenAngle(i,i,360,1,'quartOut');
    end
end
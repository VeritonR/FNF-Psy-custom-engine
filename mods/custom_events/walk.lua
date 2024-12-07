local arrowX = {732,844,956,1068,92,204,316,428}
local arrowX2 = {92,204,316,428,732,844,956,1068}
local names = {'a','b','c','d','e','f','g','h'}
local on = false
local x = 0
local no = 1

function onEvent(name, value1, value2)
    if name == "walk" then
        if on == false and value1 == "" then -- off
            for i = 0, 7 do
                noteTweenAngle(i,i,360,1,'quartOut');
            end
            for i = 0, 3 do
                noteTweenAlpha(i,i,0.25,0.5,'linear');
            end
            arrowsw()
            on = true
        elseif on == true and value1 == "" then -- on
            reset()
            on = false
        elseif value1 == "1" then
            stops()
            on = false
        elseif value1 == "2" then
            reset()
        end
    end
end

function arrowsw() -- move arrows
    runTimer("work",3.1,1); -- invert notes
    if x == 0 then -- player to left
		--Opponent
			noteTweenX('A', 0, 732, 3, 'smoothStepOut')
			noteTweenX('B', 1, 844, 3, 'smoothStepOut')
			noteTweenX('C', 2, 956, 3, 'smoothStepOut')
			noteTweenX('D', 3, 1068, 3, 'smoothStepOut')

		--Player
			noteTweenX('E', 4, 92, 3, 'smoothStepOut')
			noteTweenX('F', 5, 204, 3, 'smoothStepOut')
			noteTweenX('G', 6, 316, 3, 'smoothStepOut')
			noteTweenX('H', 7, 428, 3, 'smoothStepOut')
        x = 1
    elseif x == 1 then -- player to right
			noteTweenX('A', 0, 92, 3, 'smoothStepOut')
			noteTweenX('B', 1, 204, 3, 'smoothStepOut')
			noteTweenX('C', 2, 316, 3, 'smoothStepOut')
			noteTweenX('D', 3, 428, 3, 'smoothStepOut')
		--Player
			noteTweenX('E', 4, 732, 3, 'smoothStepOut')
			noteTweenX('F', 5, 844, 3, 'smoothStepOut')
			noteTweenX('G', 6, 956, 3, 'smoothStepOut')
			noteTweenX('H', 7, 1068, 3, 'smoothStepOut')
        x = 0
    end
end

function reset(no) -- right reset
    for i = 0, 7 do
        noteTweenX(i,i,arrowX2[i+1],0.5,'quartOut');
        noteTweenAlpha('a' .. i .. '',i,1,0.5,'linear');
        cancelTween(names[i+1])
        noteTweenAngle('r' .. i .. '',i,0,1,'quartOut');
        x = 0
    end
end

function stops() -- left stop
    for i = 0, 7 do
        noteTweenX(i,i,arrowX[i+1],0.5,'quartOut');
        cancelTween(names[i+1])
        noteTweenAngle('r' .. i .. '',i,0,0.5,'quartOut');
        x = 1
    end
    for i = 0, 3 do
        noteTweenAlpha('a' .. i .. '',i,0.5,0.5,'linear');
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'work' and on == true then
        arrowsw() -- invert notes
    end
end
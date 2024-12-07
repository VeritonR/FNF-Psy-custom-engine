function onEvent(name, value1, value2)
    if name == "speen" then
        if value1 == "" then
            for i = 0, 7 do
               noteTweenAngle("o" .. i .. "",i,360,0.75,'quartOut');
            end
        else
            for i = 0, 7 do
               noteTweenAngle("o" .. i .. "",i,0,0.75,'quartOut');
            end
        end
    end
end
local size = 1
local sizeG = 1

function onCreatePost()
    local sizes = {
        tutorial = {1.38, nil},
        week1 = {0.65, 0.55},
        week2 = {0.908, nil},
        week4 = {0.71, 0.68},
        week5 = {0.77, 0.625},
        week6 = {0.84, 0.76},
        week7 = {1.1, nil}
    }

    local currentSize = sizes[week]
    if currentSize then
        size = currentSize[1]
        sizeG = currentSize[2] or sizeG
        if sizeG then
            scaleObject('gf', sizeG, sizeG)
        end
    end

    scaleObject('boyfriend', size, size)

    makeLuaSprite("fadehud")
    makeGraphic("fadehud", screenWidth, screenHeight, '000000')
    addLuaSprite("fadehud")
    setObjectCamera("fadehud", 'other')
end

function onCountdownTick(counter)
    if counter == 0 then
        doTweenAlpha("fadehud", "fadehud", 0, 0.005, "linear")
    end
end

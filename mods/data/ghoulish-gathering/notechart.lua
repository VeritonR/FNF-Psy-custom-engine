arrowX1 = {0.35, 0.45, 0.55, 0.65, 0.35, 0.45, 0.55, 0.65}
on = true

function onCreate()
    makeLuaSprite("black")
    makeGraphic("black", screenWidth, screenHeight, '000000')
    setObjectCamera("black",'camHUD')
    addLuaSprite("black",false)
    setProperty("black.alpha", 0)
end

function onUpdate()
    if curStep == 1806 then
        setProperty("black.alpha", 1)
        setProperty("camHUD.visible", false)
    end
    if curStep == 1167 then
        on = false
    end
    if curStep == 910 then
        Up()
    end
end

function Down()
    for i = 0,7 do
        noteTweenY("testa"..i, i, 85, arrowX1[i+1], "BackInOut")
    end 
    runTimer('Up',0.64)
end

function Up()
    for i = 0,7 do
        noteTweenY("testb"..i, i, 15, arrowX1[i+1], "BackInOut")
    end 
    runTimer('Down',0.64)
end

function onTimerCompleted(tag)
    if on then
         if tag == 'Up' then
              Up()
          end
         if tag == 'Down' then
             Down()
          end
    else
        reset()
    end
end

function reset()
    for i = 0,7 do
        noteTweenY("testc"..i, i, 50, arrowX1[i+1], "BackInOut")
    end 
end
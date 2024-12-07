function onCreate()
       makeLuaSprite('Top')
        makeGraphic('Top' , screenWidth, screenHeight, 'FFFFFF')
        addLuaSprite('Top', false)
        setObjectCamera('Top', 'other')
        setProperty("Top.alpha", 0)
end

function onSectionHit()
    if curStep >= 127 and curStep <= 1024 then
        setProperty("Top.alpha", 0.25)
        doTweenAlpha("Topalpha", "Top", 0, 1, "linear")
    end
end

function onUpdate(elapsed)
    if curStep == 1024 then
        doTweenAlpha('hudFade', 'camHUD', 0, 1, 'linear');
    end
    for i = 0,3 do
      noteTweenX("t"..i, i, -1000, 0.0001, "linear")
    end
end
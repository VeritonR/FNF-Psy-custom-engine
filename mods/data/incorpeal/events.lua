function onCreatePost()
    makeLuaSprite('Black')
    makeGraphic('Black',screenWidth, screenHeight, '000000')
    setObjectCamera("Black", 'hud')
    addLuaSprite('Black',true)
    setProperty("Black.alpha", 0)
end

function onSongStart()
    makeLuaSprite('white')
    makeGraphic('white',screenWidth, screenHeight, 'FFFFFF')
    setObjectCamera("white", 'camHUD')
    addLuaSprite('white',false)
    setObjectOrder("white", getObjectOrder("darkness")+2)
    doTweenAlpha("white", "white", 0, 1, "linear")
end

function onBeatHit()
    if curStep >= 127 and curStep <= 367 or curStep >= 880 and curStep <= 1024 then
        triggerEvent("Add Camera Zoom",0.03,0.03)
    end
end

function onUpdate(elapsed)
    if curStep == 367 or curStep == 768 then 
        doTweenAlpha('BlackFade','Black', 0.5, 4, 'linear')
    end
    if curStep == 495 or curStep == 880 then 
        doTweenAlpha('BlackFade2','Black', 0, 2, 'linear')
    end
    if curStep == 1024 then
        cameraFlash("game", "FFFFFF", 2, false)
    end
end
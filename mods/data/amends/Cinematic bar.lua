function onCreatePost()
    local sprites = {'gf', 'gosha', 'johnny', 'pessoas1', 'pessoas2', '1', '2', '3'}
    for _, sprite in ipairs(sprites) do
        setProperty(sprite .. '.alpha', 0)
    end

    local characters = {'boyfriend', 'dad'}
    for _, char in ipairs(characters) do
        setProperty(char .. '.colorTransform.greenOffset', -255)
        setProperty(char .. '.colorTransform.redOffset', -255)
        setProperty(char .. '.colorTransform.blueOffset', -255)
    end

    setProperty('bg.colorTransform.greenOffset', 255)
    setProperty('bg.colorTransform.redOffset', 255)
    setProperty('bg.colorTransform.blueOffset', 255)

    makeLuaSprite('Black', '', 0, 0)
    makeGraphic('Black', 1920, 1080, '000000')
    setObjectCamera('Black', 'hud')
    addLuaSprite('Black', true)
end

function onSongStart()
    doTweenAlpha('BlackFade', 'Black', 0, 3)
end

function onUpdatePost()
    if curStep == 380 then
        setProperty('defaultCamZoom', 0.7)
    elseif curStep == 382 then
        setProperty('defaultCamZoom', 2)
    elseif curStep == 384 then
        cameraFlash('camGame', 'FFFFFF', 1, false)
        setProperty('defaultCamZoom', 0.7)

        local sprites = {'gf', 'gosha', 'johnny', 'pessoas1', 'pessoas2', '1', '2', '3'}
        for _, sprite in ipairs(sprites) do
            setProperty(sprite .. '.alpha', 1)
        end

        local characters = {'boyfriend', 'dad'}
        for _, char in ipairs(characters) do
            setProperty(char .. '.colorTransform.greenOffset', 0)
            setProperty(char .. '.colorTransform.redOffset', 0)
            setProperty(char .. '.colorTransform.blueOffset', 0)
        end

        setProperty('bg.colorTransform.greenOffset', 0)
        setProperty('bg.colorTransform.redOffset', 0)
        setProperty('bg.colorTransform.blueOffset', 0)
    elseif curStep == 763 or curStep == 765 then
        triggerEvent("Add Camera Zoom", 0.015, 0.015)
    elseif curStep == 1152 then
        cameraFlash('camGame', 'FFFFFF', 1, false)

        local sprites = {'gf', 'gosha', 'johnny', 'pessoas1', 'pessoas2', '1', '2', '3'}
        for _, sprite in ipairs(sprites) do
            setProperty(sprite .. '.alpha', 0)
        end

        local characters = {'boyfriend', 'dad'}
        for _, char in ipairs(characters) do
            setProperty(char .. '.colorTransform.greenOffset', -255)
            setProperty(char .. '.colorTransform.redOffset', -255)
            setProperty(char .. '.colorTransform.blueOffset', -255)
        end

        setProperty('bg.colorTransform.greenOffset', 255)
        setProperty('bg.colorTransform.redOffset', 255)
        setProperty('bg.colorTransform.blueOffset', 255)
        setProperty('defaultCamZoom', 0.4)
        setProperty('bg.x', getProperty('bg.x') - 200)
        setProperty('bg.y', getProperty('bg.y') - 75)
        scaleObject('bg', 2, 3)
        doTweenAlpha('hudFade', 'camHUD', 0, 2, 'linear')
    end
end

function onCreatePost()
    setProperty('camHUD.zoom', 3)

	makeLuaSprite('Black','',0,0)
	makeGraphic('Black',screenWidth, screenHeight, '000000')
	setObjectCamera('Black','other')
    setProperty('Black.alpha', 0)
	addLuaSprite('Black',false)

    makeLuaSprite('party','',0,0)
	makeGraphic('party',3500, 3500, '')
	setObjectCamera('party','game')
    setObjectOrder('party', 99)
    setProperty('party.alpha', 0)
	addLuaSprite('party',false)

    makeLuaSprite("smoke", 'alex/smoke', -1050, 1010)
    scaleObject('smoke', 1.5, 1.5)
    setProperty('smoke.alpha', 0)
	setObjectOrder('smoke', getObjectOrder("peoples")-5)
	addLuaSprite('smoke', true) 
    
    makeLuaSprite("smoke2", 'alex/smoke1', 2175, 1010)
    scaleObject('smoke2', 1.5, 1.5)
    setProperty('smoke2.alpha', 0)
	setObjectOrder('smoke2', getObjectOrder("peoples")-5)
	addLuaSprite('smoke2', true)

end

enabledcolor = false

function onUpdatePost(elapsed)
    if curStep == 768 then --767
        setProperty('defaultCamZoom',0.875)
    end
    if curStep == 896 then --912
		setProperty('defaultCamZoom', 0.5)
    end
    if curStep ==  1280 then
        setProperty('camZoomingMult', 0)
    	setProperty('camZoomingDecay', 0)
        doTweenAlpha('Blackalpha', 'Black', 1, 1, 'smootherStepInOut')
        doTweenZoom('camera', 'camGame', 1, 1.5, 'smootherStepInOut')
    end
    if curStep == 1311 then
		doTweenColor('a', 'peoples', '434343', 0.01, 'linear');
        setProperty('camZoomingMult', 1)
    	setProperty('camZoomingDecay', 1)
        setProperty('Black.alpha', 0)
        cameraFlash('camHud', 'FFFFFF', 1, false)
		setProperty('dark.alpha', 0.75)
        enabledcolor = true
        setProperty('smoke.alpha', 0.75)
        setProperty('smoke2.alpha', 0.75)
        doTweenX('smokewalk', 'smoke', -150, 37, 'smootherInOut')
        doTweenX('smokewalk1', 'smoke2', 1975, 37, 'smootherInOut')
    end
    if curStep == 1823 then
		setProperty('defaultCamZoom',0.725)
    end
    if curStep == 1952 then
        cameraFlash('camOther', 'FFFFFF', 1, false)
		setProperty('defaultCamZoom',0.5)
		setProperty('camHUD.visible', false)
        setProperty('smoke2.alpha', 0)
        setProperty('smoke.alpha', 0)
		setProperty('dark.alpha', 0)
		doTweenColor('b', 'peoples', 'FFFFFF', 0.01, 'linear');
        enabledcolor = false
    end
end
colors = {'ff0000', '00ff00', '0000ff', 'e700e4', '00d8ff', '00ff70', 'fff700', 'FFFFFF'}
function onSectionHit()
    if enabledcolor then
        doTweenColor('partycolor', 'party', colors[getRandomInt(1,8)], 0.0001, 'linear')
    end
end

function onUpdate()
    if enabledcolor then
        setProperty('party.alpha', 0.1)
    else
        setProperty('party.alpha', 0)
    end
end
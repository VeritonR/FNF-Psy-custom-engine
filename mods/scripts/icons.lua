size = 0.169
xo = 0
xp = 1065
timer = {2,2.5,3,3.5,2,2.5,3,3.5}
local y = downscroll and -15 or 475

function onCreate()
	makeLuaSprite("fire", 'hud/fire', getProperty('iconP1.X'), getProperty('iconP1.Y'))
	addLuaSprite("fire",false)
	scaleObject("fire", 0.125, 0.125)
	setObjectCamera("fire",'hud')

	makeLuaSprite('healthabovehealth', 'healthBarr',0,0)
	screenCenter('healthabovehealth', 'x')
	setObjectCamera('healthabovehealth', 'hud')
	addLuaSprite('healthabovehealth',false)
	scaleObject('healthabovehealth', 1.015,1)
	setProperty('healthabovehealth.origin.x', 425)

	setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset', {650, -150, 725, -100}) 

	addCharacterToList('loyal-gameover', 'bf')
    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'loyal-gameover');
if songName ~= 'Leisure' and songName ~= 'flow' then
    makeLuaSprite('iconL', 'hud/icons/loyal', xp, y)
    addLuaSprite('iconL', false)
    scaleObject('iconL', size, size)
    setObjectCamera('iconL', 'hud')
    setObjectOrder('iconL', 10)
end

local icons = {
    tutorial = 'Gosha and Jonnhy',
    week1 = 'treznor',
    week2 = 'brother',
    week3 = 'dia',
    week4 = 'cass',
    week5 = 'athena',
    week6 = 'Nori',
    week7 = 'jully'
}

local iconName = icons[week]
if iconName then
    makeLuaSprite('icon', 'hud/icons/' .. iconName, xo, y)
    addLuaSprite('icon', false)
    setObjectCamera('icon', 'hud')
    scaleObject('icon', size, size)
    setObjectOrder('icon', 10)
end end

local sizebop = 0.179
local animation = 'SmoothStepInOut'

function goodNoteHit(index, noteDir, noteType, isSustainNote)
    if not isSustainNote then
        scaleObject('iconL', sizebop, sizebop)
        doTweenX('iconX', 'iconL.scale', size, 0.25, animation)
        doTweenY('iconY', 'iconL.scale', size, 0.25, animation)
        doTweenY('iconPY', 'iconL', y - 5, 0.25, animation)
        doTweenX('iconPX', 'iconL', xp, 0.25, animation)
end end

function opponentNoteHit(index, noteDir, noteType, isSustainNote)
    if not isSustainNote then
        scaleObject('icon', sizebop - 0.0075, sizebop - 0.0075)
        doTweenX('iconOPX', 'icon.scale', size - 0.005, 0.25, animation)
        doTweenY('iconOPY', 'icon.scale', size - 0.005, 0.25, animation)
        doTweenY('iconOY', 'icon', y, 0.25, animation)
        doTweenX('iconOX', 'icon', xo, 0.25, animation)
end end

function onCreatePost()
	setObjectOrder("healthabovehealth", 50)
	setObjectOrder("fire", getObjectOrder("healthabovehealth")+28)
if songName == 'Leisure' then
    for i = 0, 3 do
        noteTweenX('hideop'..i, i, -10050, 0.001, 'quartInOut')
end end

local yPos = downscroll and 750 or -150
local endPos = downscroll and 575 or 50

for i = 0, 7 do
    noteTweenY('defaultPlayerStrumY'..i, i, yPos, 0.001, 'quartInOut')
    noteTweenY('E1'..i, i, endPos, timer[i+1], 'backInOut')
end end

function onUpdatePost()
    getPropertyFromClass('backend.ClientPrefs', 'data.comboOffset')
    
    local healthY = downscroll and 55 or 560
    setProperty('healthabovehealth.y', healthY)
    
    local fireY = downscroll and getProperty("iconP1.y") + 40 or getProperty("iconP1.y") - 15
    doTweenX("fireX", "fire", getProperty("iconP1.x") + 17, 0.05, "smoothStepInOut")
    doTweenY("fireY", "fire", fireY, 0.05, "smoothStepInOut")
    
    setProperty('fire.scale.x', getProperty('iconP1.scale.x') - 0.3)
    setProperty('fire.scale.y', getProperty('iconP1.scale.y') - 0.3)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
end
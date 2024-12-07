function onCreate()
    makeLuaSprite("flashlight", 'luz', getPropertyFromClass('flixel.FlxG','mouse.x'), getPropertyFromClass('flixel.FlxG','mouse.y'))
    addLuaSprite('flashlight', true)
    setObjectCamera('flashlight', 'other')
    scaleObject('flashlight', 0.25, 0.25, true)
    
end

function onCreatePost()
    setPropertyFromClass('flixel.FlxG','mouse.visible',false)
end

function onUpdatePost()
    setProperty('flashlight.x', getPropertyFromClass('flixel.FlxG','mouse.x')-500)
    setProperty('flashlight.y', getPropertyFromClass('flixel.FlxG','mouse.y')-225)
end
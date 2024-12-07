opponentArrow = 0

function iff(test, if_true, if_false)
	if test then
		return if_true
	else
		return if_false
	end
end

function onUpdatePost(elapsed)
    for i=0, opponentArrow do
        if luaSpriteExists('opponentNoteSplash' .. i) then
            if getProperty('opponentNoteSplash' .. i .. '.animation.curAnim.finished') then
                removeLuaSprite('opponentNoteSplash' .. i, true)
            end
        end
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote and getPropertyFromClass('ClientPrefs', 'noteSplashes') and not getPropertyFromGroup('notes', id, 'noteSplashDisabled') then
        opponentArrow = opponentArrow + 1
        makeAnimatedLuaSprite('opponentNoteSplash' .. opponentArrow, iff(getPropertyFromGroup('notes', id, 'noteSplashTexture') == 'noteSplashTexture', 'noteSplashes', getPropertyFromGroup('notes', id, 'noteSplashTexture')), 0, 0)
        addAnimationByPrefix('opponentNoteSplash' .. opponentArrow, 'purpleScroll', 'note splash purple ' .. getRandomInt(1,2), 24, false)
        addAnimationByPrefix('opponentNoteSplash' .. opponentArrow, 'blueScroll', 'note splash blue ' .. getRandomInt(1,2), 24, false)
        addAnimationByPrefix('opponentNoteSplash' .. opponentArrow, 'greenScroll', 'note splash green ' .. getRandomInt(1,2), 24, false)
        addAnimationByPrefix('opponentNoteSplash' .. opponentArrow, 'redScroll', 'note splash red ' .. getRandomInt(1,2), 24, false)
        setObjectCamera('opponentNoteSplash' .. opponentArrow, 'hud')
        setProperty('opponentNoteSplash' .. opponentArrow .. '.alpha', getPropertyFromGroup('notes', id, 'alpha'))
        setProperty('opponentNoteSplash' .. opponentArrow .. '.x', getPropertyFromGroup('opponentStrums', noteData, 'x')-125)
        setProperty('opponentNoteSplash' .. opponentArrow .. '.y', getPropertyFromGroup('opponentStrums', noteData, 'y')-125)
        addLuaSprite('opponentNoteSplash' .. opponentArrow)
        setObjectOrder('opponentNoteSplash' .. opponentArrow, getObjectOrder('grpNoteSplashes'))
        objectPlayAnimation('opponentNoteSplash' .. opponentArrow, getPropertyFromGroup('notes', id, 'animation.curAnim.name'), false)
    end
end

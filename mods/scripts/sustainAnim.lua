-- Script By @BLUE
-- optimized by @Veriton
function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        -- Check if the note is a Sustain Note
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
        end
    end
end

function handleNoteHit(id, noteType, isSustainNote, character)
    if isSustainNote then
        setProperty(character .. '.holdTimer', 0)
        if getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing' then
            setProperty(character .. '.holdTimer', 0)
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    handleNoteHit(id, noteType, isSustainNote, 'boyfriend')
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    handleNoteHit(id, noteType, isSustainNote, 'dad')
end
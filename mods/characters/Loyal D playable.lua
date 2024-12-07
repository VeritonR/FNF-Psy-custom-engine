size = 1
function onCreatePost()
    if week == 'week3' then
        size = 0.7
        setProperty('boyfriend.flipX', false)
    end
    scaleObject('boyfriend', size,size)
end
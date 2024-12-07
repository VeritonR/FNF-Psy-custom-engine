default = -25

function onCreatePost()
	flydown()
end

function flydown()
	doTweenY("noridown", "dad", default-20, 1.5, "SmoothStepInOut")
end

function flyup()
	doTweenY("noriup", "dad", default+20, 1.5, "SmoothStepInOut")
end

function onTweenCompleted(tag)
	if tag == 'noridown' then
		flyup()
	end
	if tag == 'noriup' then
		flydown()
	end
end
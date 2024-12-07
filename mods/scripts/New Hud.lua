classify = true
MINrandom = 1 
MAXrandom = 125 
Rsicks = 75 
Rgoods = 50 
Rbads =  25
Rshits = 15
Rmisses = 10 
Misses = false
CPUscore = 0
altCPUscore = 0
CPUsicks = 0 
CPUgoods = 0
CPUbads = 0
CPUshits = 0
CPUmisses = 0
CPUrandomrating = 0
CPUnotehit = 0
CPUaccuracy = 100
Pmisses = 0
Pscore = 0
Paccuracy = 0
animation = 8
panimation = 8
pnotes = 0
onotes = 0

function onCreate()

	--Hud Decorations and config
		setObjectOrder('ophealth', 1)
		setObjectOrder('phealth', 1)
	
--TIMER
	if downscroll == false then
		--text
		makeLuaText('Pscore', 'Score:0', 0, 1150, 690)
		makeLuaText('Pmisses', 'Misses:'.. 0, 500, 825, 690)
		makeLuaText('Paccuracy', 'Accuracy:'.. 0, 500, 700, 690)

		makeLuaText('CPUscore', 'Score:0', 500, 75, 690)
		makeLuaText('CPUmisses', 'Misses:'.. 0, 500, -50, 690)
		makeLuaText('CPUaccuracy', 'Accuracy:'.. 0, 250, -50, 690)
		--normal sprites
		makeLuaSprite('timer', 'hud/timer', 500, 585)
		--animated sprites
		makeAnimatedLuaSprite('energy', 'hud/mic', 742, 600)
		makeAnimatedLuaSprite('energyo', 'hud/mic', 475, 600)
		makeAnimatedLuaSprite('phealth', 'hud/health', 811, 525)
		makeAnimatedLuaSprite('ophealth', 'hud/health', 79, 525)
	else
		--text
		makeLuaText('Pscore', 'Score:0', 0, 1100, 10)
		makeLuaText('Pmisses', 'Misses:'.. 0, 500, 775, 10)
		makeLuaText('Paccuracy', 'Accuracy:'.. 0, 500, 650, 10)

		makeLuaText('CPUscore', 'Score:0', 500, 165, 10)
		makeLuaText('CPUmisses', 'Misses:'.. 0, 500, 40, 10)
		makeLuaText('CPUaccuracy', 'Accuracy:'.. 0, 250, 40, 10)
		--normal sprites
		makeLuaSprite('timer', 'hud/timer', 500, 65)
		--animated sprites
		makeAnimatedLuaSprite('energy', 'hud/mic', 742, 85)
		makeAnimatedLuaSprite('energyo', 'hud/mic', 475, 85)
		makeAnimatedLuaSprite('phealth', 'hud/health', 816, 35)
		makeAnimatedLuaSprite('ophealth', 'hud/health', 79, 35)
	end

	-- Other Stuff
    addLuaText('CPUscore')
    addLuaText('CPUmisses')
    addLuaText('CPUaccuracy')
	addLuaText('Pscore')
    addLuaText('Pmisses')
    addLuaText('Paccuracy')
	
	scaleObject('timer', 0.55, 0.55)
	screenCenter('timer', 'X')
	setObjectCamera('timer', 'hud')
	addLuaSprite('timer', false)
	

--ENERGY ATTACK
	--player	
			addAnimationByPrefix('energy', '1', 'empty', 24, true)
			addAnimationByPrefix('energy', '2', 'half', 24, true)
			addAnimationByPrefix('energy', '3', 'full', 24, true)
			
					addLuaSprite('energy', false)
					setObjectCamera('energy', 'hud')
					setObjectOrder('energy', 2)
					scaleObject('energy', 0.5, 0.5)
	--opponent		
	addAnimationByPrefix('energyo', '1', 'empty', 24, true)
	addAnimationByPrefix('energyo', '2', 'half', 24, true)
	addAnimationByPrefix('energyo', '3', 'full', 24, true)
	
			addLuaSprite('energyo', false)
			setObjectCamera('energyo', 'hud')
			setObjectOrder('energyo', 2)
			scaleObject('energyo', 0.5, 0.5)
			setProperty("energyo.flipX", true)
	
--BF HEALTH BAR
		--health bar animations
			addAnimationByPrefix('phealth', '8', 'idlea', 1, true)
			addAnimationByPrefix('phealth', '7', 'idleb', 1, true)
			addAnimationByPrefix('phealth', '6', 'idlec', 1, true)
			addAnimationByPrefix('phealth', '5', 'idled', 1, true)
			addAnimationByPrefix('phealth', '4', 'idlee', 1, true)
			addAnimationByPrefix('phealth', '3', 'idlef', 1, true)
			addAnimationByPrefix('phealth', '2', 'idleg', 1, true)
			addAnimationByPrefix('phealth', '1', 'idleh', 1, true)
					
		addLuaSprite('phealth', false)

	--dad health
		--health bar animation
			addAnimationByPrefix('ophealth', '8', 'idlea', 1, true)
			addAnimationByPrefix('ophealth', '7', 'idleb', 1, true)
			addAnimationByPrefix('ophealth', '6', 'idlec', 1, true)
			addAnimationByPrefix('ophealth', '5', 'idled', 1, true)
			addAnimationByPrefix('ophealth', '4', 'idlee', 1, true)
			addAnimationByPrefix('ophealth', '3', 'idlef', 1, true)
			addAnimationByPrefix('ophealth', '2', 'idleg', 1, true)
			addAnimationByPrefix('ophealth', '1', 'idleh', 1, true)
						
		addLuaSprite('ophealth', false)
		setProperty('ophealth.flipX', true)
		
			--both health bar scale
				scaleObject('ophealth', 0.5, 0.5)
				scaleObject('phealth', 0.5, 0.5)
		
	--opponent hud	
    setTextSize('CPUscore', 17)
    setTextSize('CPUaccuracy', 17)
    setTextSize('CPUmisses', 17)
end

function onCreatePost() 
	setProperty('healthGain', 0)

end

function goodNoteHit(id, direction, noteType, isSustainNote)
	pnotes = pnotes + 1
	if songName == 'lizza' then --player on athena week
		setProperty('health', getProperty('health') + 0.015)
	elseif songName == 'bass' or songName == 'Escape' or songName == 'Breakdown' then --player on treznor week
		if isSustainNote then
			setProperty('health', getProperty('health') + 0.024) 
		else
			setProperty('health', getProperty('health') + 0.032) 
		end
	elseif songName == 'right-time' then
		if isSustainNote then
			setProperty('health', getProperty('health') + 0.023) 
		else
			setProperty('health', getProperty('health') + 0.031) 
		end
	elseif songName == 'radio' then
		if isSustainNote then
			setProperty('health', getProperty('health') + 0.027) 
		else
			setProperty('health', getProperty('health') + 0.035) 
		end
	elseif songName == 'Unwanted' or songName == 'loyal' then
		if isSustainNote then
			setProperty('health', getProperty('health') + 0.030) 
		else
			setProperty('health', getProperty('health') + 0.038) 
		end
	elseif songName == 'showdown' then
		if isSustainNote then
			setProperty('health', getProperty('health') + 0.036) 
		else
			setProperty('health', getProperty('health') + 0.044) 
		end
	elseif songName == 'face-off' then
		if isSustainNote then
			setProperty('health', getProperty('health') + 0.033) 
		else
			setProperty('health', getProperty('health') + 0.041) 
		end
	elseif songName == 'WTF' then
		if isSustainNote then
			setProperty('health', getProperty('health') + 0.037) 
		else
			setProperty('health', getProperty('health') + 0.045) 
		end
	else
		setProperty('health', getProperty('health') + 0.025) --player on another weeks
	end
end			

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if CPUrandomrating <= Rmisses then
	else
	--treznor week
	onotes = onotes + 1
		if songName == 'bass' or songName == 'Escape' then --treznor
			setProperty('health', getProperty('health') - 0.023)

	--athena week
		elseif songName == 'lizza'  then --athena
			setProperty('health', getProperty('health') - 0.015)
		elseif songName == 'radio'  then --radio
			setProperty('health', getProperty('health') - 0.030)
		elseif songName == 'right-time' then
			if curStep >= 768 then
				setProperty('health', getProperty('health') - 0.015)
			else
				setProperty('health', getProperty('health') - 0.026)
			end	
		elseif songName == 'Breakdown' then	
			setProperty('health', getProperty('health') - 0.031)
		elseif songName == 'Unwanted' or songName == 'Loyal' then
			setProperty('health', getProperty('health') - 0.026)
		elseif songName == 'showdown' then
			setProperty('health', getProperty('health') - 0.034)
		elseif songName == 'face-off' then
			setProperty('health', getProperty('health') - 0.035)
		elseif songName == 'WTF' then
			setProperty('health', getProperty('health') - 0.0345)
		else
			setProperty('health', getProperty('health') - 0.020) -- opponent on another weeks
		end
	end
    if not isSustainNote then
        if noteType == "Hurt Note" then
        else
			if CPUrandomrating >= Rsicks then
				if not Misses then
					if songName == 'bass' or songName == 'Breakdown' or songName == 'Escape' then
						CPUaccuracy = 93.5
					else
						CPUaccuracy = 100
					end
				end
			end
			if CPUrandomrating <= Rmisses then
				if songName == 'bass' or songName == 'Breakdown' or songName == 'Escape' then	
					CPUaccuracy = CPUaccuracy - 0.47
				else
					CPUaccuracy = CPUaccuracy - 2.47
				end
			end
		end
	end

    if not isSustainNote then
        if noteType == "Hurt Note" then
        else
			CPUnotehit = CPUnotehit + 1
			CPUrandomrating = getRandomInt(MINrandom,MAXrandom)
				if CPUrandomrating >= Rsicks then
					CPUsicks = CPUsicks + 1
						if Misses then
							CPUaccuracy = CPUaccuracy + 0.87
						end
					if classify then
						makeLuaSprite('Sick','Hud/rating/sick', 50, 450)
						addLuaSprite('Sick', false)
						runTimer('S', 1)
						scaleObject('Sick', 0.45, 0.45)
						setObjectCamera('Sick', 'hud')

						doTweenY('SUS', 'Sick', 420, 0.3 , 'sineInOut')
						doTweenX('AMOGUS', 'Sick', 45, 0.45 , 'sineInOut')
						removeLuaSprite('Good', true)
						removeLuaSprite('Bad', true)
						removeLuaSprite('Shit', true)
					end
				elseif CPUrandomrating >= Rgoods and CPUrandomrating < Rsicks then
							CPUgoods = CPUgoods + 1
							Misses = true
						if Misses then
							CPUaccuracy = CPUaccuracy - 0.77
						end
					if not Misses then
						CPUaccuracy = 93.7
					end
					if classify then
						makeLuaSprite('Good','Hud/rating/good', 50, 450)
						addLuaSprite('Good', false)
						runTimer('G', 1)
						scaleObject('Good', 0.45, 0.45)
						setObjectCamera('Good', 'hud')

						doTweenY('Gog', 'Good', 420, 0.3 , 'sineInOut')
						doTweenX('gog1', 'Good', 45, 0.45 , 'sineInOut')
						removeLuaSprite('Sick', true)
						removeLuaSprite('Bad', true)
						removeLuaSprite('Shit', true)
					end
				elseif CPUrandomrating >= Rbads and CPUrandomrating < Rgoods then
					CPUbads = CPUbads + 1
										Misses = true
					if Misses then
						CPUaccuracy = CPUaccuracy + 1.27
					end
					if not Misses then
						CPUaccuracy = 92.7
					end
					if classify then
						makeLuaSprite('Bad','Hud/rating/bad', 50, 450)
						addLuaSprite('Bad', false)
						runTimer('B', 1)
						scaleObject('Bad', 0.45, 0.45)
						setObjectCamera('Bad', 'hud')

						doTweenY('Bab', 'Bad', 420, 0.3 , 'sineInOut')
						doTweenX('bab1', 'Bad', 45, 0.45 , 'sineInOut')
						removeLuaSprite('Sick', true)
						removeLuaSprite('Good', true)
						removeLuaSprite('Shit', true)
					end
				elseif CPUrandomrating >= Rshits and CPUrandomrating < Rbads then
					CPUshits = CPUshits + 1
										Misses = true
					if Misses then
						CPUaccuracy = CPUaccuracy + 1.7
					end
					if not Misses then
						CPUaccuracy = 91.7
					end
					if classify then
						makeLuaSprite('Shit','Hud/rating/shit', 50, 450)
						addLuaSprite('Shit', false)
						runTimer('SH', 1)
						scaleObject('Shit', 0.45, 0.45)
						setObjectCamera('Shit', 'hud')
						
						doTweenY('Shid', 'Shit', 420, 0.3 , 'sineInOut')
						doTweenX('Shid1', 'Shit', 45, 0.45 , 'sineInOut')
						
						removeLuaSprite('Sick', true)
						removeLuaSprite('Good', true)
						removeLuaSprite('Bad', true)
					end
				elseif CPUrandomrating <= Rmisses then
					setProperty('health', getProperty('health') + 0.0075)
					Misses = true
					CPUmisses = CPUmisses + 1
					CPUaccuracy = CPUaccuracy - 3.7
					if not Misses then
						CPUaccuracy = 90.2
					end
				end

		end
	end
    CPUscore = CPUsicks*350+CPUgoods*200+CPUbads*100+CPUshits*50+-CPUmisses*10 
end

fadep = true
fadeop = true
sound = 1
shakeop = false
shakepl = false
gainhealthV = true
function onUpdate(elapsed)
		if shakeop == true then
			doTweenY("ophealth", "ophealth", getProperty("ophealth.y")+ getRandomInt(-5,5), 0.001, "linear")
			doTweenY("icon", "icon", getProperty("ophealth.y")-50, 0.001, "linear")
		end
		if shakepl == true then
			doTweenY("phealth", "phealth", getProperty("phealth.y")+ getRandomInt(-3,3), 0.001, "linear")
			doTweenY("iconL", "iconL", getProperty("phealth.y")-50, 0.001, "linear")
		end
		if getProperty('health') >= 1.95 then
			animation = animation - 1
			shakeop = true
			if sound == 1 then
				playSound('Opdamage', 1.75)
				setProperty('health', 1)
				runTimer("Changesound", 0.5)
			end
			if sound == 2 then
				playSound('Opdamage2', 1.75)
				setProperty('health', 1)
				runTimer("Changesound", 0.5)
			end
		end
		if getProperty('health') <= 0.1 and getProperty('health') >= 0.01 then
			panimation = panimation - 1
			playSound('pldamage', 1.75)				
			setProperty('health', 1)
			runTimer("Changesound", 0.5)
			shakepl = true
		end
		if panimation == 0 then
			setProperty('health', 0)
		end
	--player
	if pnotes <= 39 then
		objectPlayAnimation('energy', '1')	
	elseif pnotes >= 40 and pnotes <= 79 then
		objectPlayAnimation('energy', '2')	
	elseif pnotes >= 80 then
		objectPlayAnimation('energy', '3')
		if fadep == true then
			notefadep()
			fadep = false
		end
	end
	--opponent
	if onotes == 0 then
		objectPlayAnimation('energyo', '1')	
	elseif onotes == 60 then
		objectPlayAnimation('energyo', '2')	
	elseif onotes >= 90 then
		if fadeop == true then
			notefadeop()
			fadeop = false
		end
		objectPlayAnimation('energyo', '3')
		if animation <= 7 then
			if gainhealthV == true then
				if songName == 'radio' then
					runTimer('gainhealth', getRandomInt(2,4))
				else
					runTimer('gainhealth', getRandomInt(6,9))
				end
				gainhealthV = false
			end
		else
			onotes = 85 	
		end
	end

	--hud health
	Pscore = getProperty('songScore')
	Pmisses = getProperty('songMisses')
	Paccuracy = round(getProperty('ratingPercent') * 100, 2)
	
	setTextString("Pscore", "Score:" .. Pscore .. '')
	setTextString("Pmisses", "Misses:" .. Pmisses .. '')
	setTextString("Paccuracy", "Accuracy:" .. Paccuracy .. '')
	
	screenCenter('Time', 'x')
	
--health animations player
	if panimation == 8 then
		objectPlayAnimation('phealth', '8')
	elseif panimation == 7 then
		objectPlayAnimation('phealth', '7')
	elseif panimation == 6 then
		objectPlayAnimation('phealth', '6')
	elseif panimation == 5 then
		objectPlayAnimation('phealth', '5')
	elseif panimation == 4 then
		objectPlayAnimation('phealth', '4')
	elseif panimation == 3 then
		objectPlayAnimation('phealth', '3')
	elseif panimation == 2 then
		objectPlayAnimation('phealth', '2')
	elseif panimation == 1 then
		objectPlayAnimation('phealth', '1')
	end

-- health animations opponent
	if animation == 8 then
		objectPlayAnimation('ophealth', '8')
	elseif animation == 7 then
		objectPlayAnimation('ophealth', '7')
	elseif animation == 6 then
		objectPlayAnimation('ophealth', '6')
	elseif animation == 5 then
		objectPlayAnimation('ophealth', '5')
	elseif animation == 4 then
		objectPlayAnimation('ophealth', '4')
	elseif animation == 3 then
		objectPlayAnimation('ophealth', '3')
	elseif animation == 2 then
		objectPlayAnimation('ophealth', '2')
	elseif animation == 1 then
		objectPlayAnimation('ophealth', '1')
	end
	
	setObjectCamera('Time', 'hud')
	setObjectCamera('ophealth', 'hud')
	setObjectCamera('phealth', 'hud')
	
	--health bar config
	if downscroll == false then
		setProperty('healthBar.y', 560)
		setProperty('timeTxt.y', 630)

	else
		setProperty('healthBar.y', 55)
		setProperty('timeTxt.y', 105)
	end
		--setProperty('healthBar.x', 42)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty('timeBarBG.visible', false)
		setProperty('timeBar.visible', false)
		screenCenter('timeTxt', 'X')
		scaleObject('Time', 0.15, 0.15)
	
	--opponent rating
	if Misses then
		if songName == 'bass' or songName == 'Breakdown' or songName == 'Escape' then
			if CPUaccuracy >= 93.5	then
				CPUaccuracy = 93.5
			elseif CPUaccuracy <= 90.3	then
				CPUaccuracy = 90.3
			end
		elseif CPUaccuracy >= 99.5 then
				CPUaccuracy = 99.5
		end
	end
		
    if CPUnotehit ~= 0 then
        setTextString("CPUscoreTxt", "Score: " .. CPUscore .. " | Misses: " .. CPUmisses .. "")
		setTextString("CPUmisses", "Misses:" .. CPUmisses .. '')
		setTextString("CPUaccuracy", "Accuracy:" .. CPUaccuracy .. '')
		setTextString("CPUscore", "Score:" .. CPUscore .. '')
    end

	
    if hits < CPUnotehit then
        altCPUscore = CPUsicks*(350/(hitsDif/2))+CPUgoods*(200/(hitsDif/2))+CPUbads*(100/(hitsDif/2))+CPUshits*(50/(hitsDif/2))+-CPUmisses*(10/(hitsDif/2))
    elseif hits > CPUnotehit then
        altCPUscore = CPUsicks*(350*(reverthitsDif/2))+CPUgoods*(200*(reverthitsDif/2))+CPUbads*(100*(reverthitsDif/2))+CPUshits*(50*(reverthitsDif/2))+-CPUmisses*(10*(reverthitsDif/2))
    else
        altCPUscore = CPUsicks*350+CPUgoods*200+CPUbads*100+CPUshits*50+-CPUmisses*10
    end

end

function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function round(num, numDecimalPlaces)
   local mult = 10^(numDecimalPlaces or 0)
   return math.floor(num * mult + 0.5) / mult
end

function onStartCountdown()	
	setProperty('scoreTxt.visible', false)
	setProperty('health', 1)
end

rotateo = true
function onTimerCompleted(tag)
	if tag == 'gainhealth' then
		fadeop = true
		onotes = 0
		gainhealthV = true
		objectPlayAnimation('energyo', '1')
			playSound('healing', 1)
			animation = animation + 1
			if rotateo == true then
				doTweenAngle('testo', "energyo", 360, 0.8, "smoothStepInOut")
				rotateo = false
			else
				doTweenAngle('testo1', "energyo", -360, 0.8, "smoothStepInOut")
				rotateo = true
			end		
	end
	if tag == 'S' then
		removeLuaSprite('Sick', true)
	elseif tag == 'G' then
		removeLuaSprite('Good', true)
	elseif tag == 'B' then
		removeLuaSprite('Bad', true)
	elseif tag == 'SH' then
		removeLuaSprite('Shit', true)
	end
	if tag == 'Changesound' then
		shakeop = false
		shakepl = false
			doTweenX("phealth", "phealth", 816, 0.01, "linear")
			doTweenX("ophealth", "ophealth", 79, 0.01, "linear")
			doTweenX("icon", "icon", 0, 0.01, "linear")
			doTweenX("iconL", "iconL", 1065, 0.001, "linear")
		if downscroll then
			doTweenY("phealth", "phealth", 35, 0.001, "linear")
			doTweenY("ophealth", "ophealth", 35, 0.001, "linear")
			doTweenY("icon", "icon", -15, 0.001, "linear")
			doTweenY("iconL", "iconL", -15, 0.001, "linear")
		else
			doTweenY("phealth", "phealth", 525, 0.001, "linear")
			doTweenY("ophealth", "ophealth", 525, 0.001, "linear")
			doTweenY("icon", "icon", 475, 0.001, "linear")
			doTweenY("iconL", "iconL", 475, 0.001, "linear")
		end
		if sound == 1 then
			sound = 2
		else
			sound = 1
		end		--
	end--
	if tag == 'alpha' then
		removeLuaSprite("abb")
	end
	if tag == 'alphap' then
		removeLuaSprite("acc")
	end
end

function onTweenCompleted(tag)
	if tag == 'Gog' then
	doTweenY('Gog2', 'Good', 440, 0.25 , 'smoothStepIn')
	doTweenAlpha('a', 'Good', 0, 0.3 / playbackRate)
	end
	if tag == 'SUS' then
	doTweenY('SUS2', 'Sick', 440, 0.25 , 'smoothStepIn')
	doTweenAlpha('b', 'Sick', 0, 0.3 / playbackRate)
	end
	if tag == 'Bab' then
	doTweenY('Bab2', 'Bad', 440, 0.25 , 'smoothStepIn')
	doTweenAlpha('c', 'Bad', 0, 0.3 / playbackRate)
	end
	if tag == 'Shid' then
	doTweenY('Shid2', 'Shit', 440, 0.25 , 'smoothStepIn')
	doTweenAlpha('d', 'Shit', 0, 0.3 / playbackRate)
	end
end

rotate = true
function onUpdatePost()
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SPACE') then
		if pnotes >= 80 and panimation <= 7 then
			playSound('healing', 1)
			pnotes = 0
			objectPlayAnimation('energy', '1')		
			panimation = panimation + 1
			fadep = true
			if rotate == true then
				doTweenAngle('test', "energy", 360, 0.8, "smoothStepInOut")
				rotate = false
			else
				doTweenAngle('test1', "energy", -360, 0.8, "smoothStepInOut")
				rotate = true
			end			
		end
	end
end
function notefadeop()
	if downscroll then
		makeAnimatedLuaSprite('abb', 'hud/mic', 475, 85)
		doTweenY("alphaB", "abb", getProperty('abb.y')+60, 1, "linear")
	else
		makeAnimatedLuaSprite('abb', 'hud/mic', 475, 600)	
		doTweenY("alphaB", "abb", getProperty('abb.y')-60, 1, "linear")
	end
		addAnimationByPrefix('abb', '1', 'full', 24, true)
			addLuaSprite('abb', false)
				setObjectCamera('abb', 'hud')
					setObjectOrder('abb', 6)
						scaleObject('abb', 0.5, 0.5)
							setProperty("abb.flipX", true)
								doTweenAlpha("alpha", "abb", 0, 1, "linear")									
end
function notefadep()
	if downscroll then
		makeAnimatedLuaSprite('acc', 'hud/mic', 742, 85)
		doTweenY("alphapB", "acc", getProperty('acc.y')+60, 1, "linear")
	else	
		makeAnimatedLuaSprite('acc', 'hud/mic', 742, 600)
		doTweenY("alphapB", "acc", getProperty('acc.y')-60, 1, "linear")
	end
		addAnimationByPrefix('acc', '1', 'full', 24, true)
			addLuaSprite('acc', false)
				setObjectCamera('acc', 'hud')
					setObjectOrder('acc', 6)
						scaleObject('acc', 0.5, 0.5)
							doTweenAlpha("alphap", "acc", 0, 1, "linear")							
end



			

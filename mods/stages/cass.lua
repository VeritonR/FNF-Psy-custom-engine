s = 1
px = 225
py = -220
step = 1
function onCreate()
	if songName == 'WTF' then	
		doTweenAlpha('hudFadeEventTween', 'camHUD', 0, 0.001, 'linear');
	end
-- background shit
	makeLuaSprite('1', 'jane/1', px, py);
	setScrollFactor('1', 1, 1);
	scaleObject('1', s, s);
	
	makeLuaSprite('2', 'jane/2', px, py);
	setScrollFactor('2', 1, 1);
	scaleObject('2', s, s);
		
	makeLuaSprite('4', 'jane/4', px, py);
	setScrollFactor('4', 1, 1);
	scaleObject('4', s, s);
	
	makeLuaSprite('5', 'jane/5', px, py);
	setScrollFactor('5', 1, 1);
	scaleObject('5', s, s);
	
	makeLuaSprite('6', 'jane/6', px, py);
	setScrollFactor('6', 1, 1);
	scaleObject('6', s, s);
	
	makeLuaSprite('7', 'jane/7', px, py);
	setScrollFactor('7', 1, 1);
	scaleObject('7', s, s);

--FRONT COLOR
	makeLuaSprite('front', 'jane/front', px, py);
	setScrollFactor('front', 1, 1);
	scaleObject('front', s, s);
	
-- windows
		makeLuaSprite('w1', 'jane/windows/w1', px, py);
		setScrollFactor('w1', 1, 1);
		scaleObject('w1', s, s);
		
		makeLuaSprite('w2', 'jane/windows/w2', px, py);
		setScrollFactor('w2', 1, 1);
		scaleObject('w2', s, s);
		
		makeLuaSprite('w3', 'jane/windows/w3', px, py);
		setScrollFactor('w3', 1, 1);
		scaleObject('w3', s, s);
		
		makeLuaSprite('w4', 'jane/windows/w4', px, py);
		setScrollFactor('w4', 1, 1);
		scaleObject('w4', s, s);

--SPEAKER
SS = 0.60
		makeAnimatedLuaSprite('speaker','Speakers',1290, 375) --here
		addAnimationByPrefix("speaker", "speakers Booping", "speakers Booping")
		scaleObject('speaker', SS, SS);		

--JOHNNY
JS = 0.6
		makeAnimatedLuaSprite('johnny','characters/Johnny_Bump_Assets', 990, 170)
		addAnimationByPrefix('johnny','dance','john Dance',18,true)
		setScrollFactor('johnny', 1, 1);
		scaleObject('johnny', JS, JS);
		setProperty('johnny.flipX', false)

	addLuaSprite('1', false);
	addLuaSprite('2', false);
	addLuaSprite('w1', false);
	addLuaSprite('w2', false);
	addLuaSprite('w3', false);
	addLuaSprite('w4', false);
	addLuaSprite('4', false);
	addLuaSprite('5', false);
	addLuaSprite('6', false);
	addLuaSprite('7', false);
	addLuaSprite('johnny', false);
	addLuaSprite('speaker', false);
	addLuaSprite('front', true);
	addLuaSprite('gosha', false);



		setProperty('w2.visible', false)
		setProperty('w3.visible', false)
		setProperty('w4.visible', false)
end

function onSectionHit()
			if (step == 1) then
				setProperty('w1.visible', true)
				setProperty('w2.visible', false)
				setProperty('w2.visible', false)
				setProperty('w4.visible', false)
				step = math.random(1,4)
			end
			if (step == 2) then
				setProperty('w1.visible', false)
				setProperty('w2.visible', true)
				setProperty('w3.visible', false)
				setProperty('w4.visible', false)
				sstep = math.random(1,4)
			end
			if (step == 3) then
				setProperty('w1.visible', false)
				setProperty('w2.visible', false)
				setProperty('w3.visible', true)
				setProperty('w4.visible', false)
				step = math.random(1,4)
			end
			if (step == 4) then
				setProperty('w1.visible', false)
				setProperty('w2.visible', false)
				setProperty('w3.visible', false)
				setProperty('w4.visible', true)
				step = math.random(1,4)

			end	
end


function onUpdate()
if songName == 'WTF' then	
	if mustHitSection == false then
		if currentTarget ~= 'dad' or currentZoom ~= dadZoom then
			if getProperty('defaultCamZoom') == 1.15 then
				triggerEvent('Camera Follow Pos', 1050 ,350)
			else
				if curStep <= 183 then
					triggerEvent('Camera Follow Pos', 1450 ,290)
				else
					triggerEvent('Camera Follow Pos', 1250 ,290)
				end
			end
		end
	else
		if getProperty('defaultCamZoom') == 1.15 then
			triggerEvent('Camera Follow Pos', 1875 ,315)
		else
			triggerEvent('Camera Follow Pos', 1725 ,315)
		end
	end
	if curStep <= 182 then
		setProperty('camZoomingMult', 0)
	end
	if curStep == 183 then
		doTweenAlpha('fade', 'camHUD', 1, 1, 'StepInOut');
		setProperty('camZoomingMult', 1)
	end
end	
end


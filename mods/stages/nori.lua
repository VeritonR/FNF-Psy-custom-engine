x = -500
y = -100

function onCreate()
	makeLuaSprite("darkness", 'nori/darkness')
	setObjectCamera("darkness", 'camHUD')
	setObjectOrder("darkness", getObjectOrder("ophealth")-5)
	setProperty("darkness.alpha", 1)
	addLuaSprite("darkness",false)

	-- background shit
	makeLuaSprite('verde', 'nori/green', x, y);
	scaleObject('verde', 1.25, 1.25);
	
	makeLuaSprite('raio', 'nori/thunder', x, y);
	scaleObject('raio', 1.25, 1.25);
	setProperty("raio.alpha", 0)

	makeLuaSprite('frente', 'nori/front', x-450, y-225);
	scaleObject('frente', 1.5, 1.5);

	makeLuaSprite('frente1', 'nori/front1', x+100, y); --nori box
	scaleObject('frente1', 1.5, 1.5);


	addLuaSprite('verde', false);
	addLuaSprite('raio', false);
	addLuaSprite('frente', true);
	addLuaSprite('frente1', true);

	makeAnimatedLuaSprite("candles", 'nori/candles', 425,200)
	addAnimationByPrefix("candles", "fire", "idle", 8)
	scaleObject("candles", 1.3, 1.3)
	addLuaSprite("candles", false)
	
	makeAnimatedLuaSprite("candles2", 'nori/candles', 1200,100)
	addAnimationByPrefix("candles2", "fire2", "idle", 8)
	scaleObject("candles2", 1.3, 1.3)
	setProperty("candles2.angle", 25)
	addLuaSprite("candles2", false)

--JOHNNY
	JS = 0.69  --:O
		makeAnimatedLuaSprite('johnny','characters/Johnny_Bump_Assets', 360, 455)
		addAnimationByPrefix('johnny','dance','john Dance',18,true)
		scaleObject('johnny', JS, JS);
		setProperty('johnny.flipX', false)
		addLuaSprite('johnny', false);

--GOSHA
	makeAnimatedLuaSprite('gosha','characters/Gosha_Speakers_Assets', 1005, 55)
	addAnimationByPrefix('gosha','dance','gosha Dance',16,true)
	scaleObject('gosha', 0.817, 0.817);
	setProperty('gosha.flipX', false)
	addLuaSprite("gosha",false)
	setObjectOrder("gosha", 12)
	
end

candleY = 200
function thuder()
	setProperty("raio.alpha", 100)
	doTweenAlpha("raio", "raio", 0, 0.75, "bounceOut")
	playSound("thunder_"..getRandomInt(1,2), 2)
	runTimer("thunder", getRandomInt(5,25))
end

function onStartCountdown()
	runTimer("thunder", getRandomInt(5,10))
	candledown()
	candledown2()
end

function onTimerCompleted(tag)
	if tag == 'thunder' then
		thuder()
	end
end

function candledown()
	doTweenY("candledown", "candles", candleY-35, 2, "SmoothStepInOut")
end
function candledown2()
	doTweenY("candledown2", "candles2", 100-35, 3, "SmoothStepInOut")
end

function candleup()
	doTweenY("candleup", "candles", candleY+35, 2, "SmoothStepInOut")
end
function candleup2()
	doTweenY("candleup2", "candles2", 100+35, 3, "SmoothStepInOut")
end

function onTweenCompleted(tag)
	if tag == 'candledown' then
		candleup()
	end
	if tag == 'candledown2' then
		candleup2()
	end
	if tag == 'candleup' then
		candledown()
	end
	if tag == 'candleup2' then
		candledown2()
	end
end

function onUpdate(elapsed)
	if mustHitSection then
		setProperty('defaultCamZoom',0.6)
	else
		setProperty('defaultCamZoom',0.65)
	end
end
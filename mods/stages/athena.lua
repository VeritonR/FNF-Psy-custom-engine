function onCreate()

--All background sprites
	--Bg
		makeLuaSprite('bg', 'amends/athena', -565, -205);
		scaleObject('bg', 1.03, 1.02)
		addLuaSprite('bg', false);

		sizep1 = 1.755
		makeAnimatedLuaSprite("pessoas1", 'amends/peeps1', -260,-200)
		addAnimationByPrefix("pessoas1", "peidle1", "idle", 14, true)
		scaleObject('pessoas1', sizep1, sizep1)
		addLuaSprite('pessoas1', false);

		sizep2 = 1.955
		makeAnimatedLuaSprite("pessoas2", 'amends/peeps2', -350,-310)
		addAnimationByPrefix("pessoas2", "peidle2", "idle", 14, true)
		scaleObject('pessoas2', sizep2, sizep2)
		addLuaSprite('pessoas2', false);
		
	if songName == 'face-off' then
		makeLuaSprite('red', 'amends/red', 0, 0);
		scaleObject('red', 1, 1)
		setObjectCamera('red', 'hud')
		addLuaSprite('red', false);
	end

--GOSHA
	makeAnimatedLuaSprite('gosha','characters/Gosha_Speakers_Assets', 940, 0)
	addAnimationByPrefix('gosha','dance','gosha Dance',16,true)
	scaleObject('gosha', 0.69, 0.69);
	setProperty('gosha.flipX', false)
	setObjectOrder("gosha", 10)
	addLuaSprite("gosha")

--JOHNNY
	makeAnimatedLuaSprite('johnny','characters/Johnny_Bump_Assets', 410, 330) --POSITION
	addAnimationByPrefix('johnny','dance','john Dance',19,true)
    setScrollFactor('johnny', 1, 1);
	scaleObject('johnny', 0.585, 0.585);  --SIZE
	setProperty('johnny.flipX', false)
	addLuaSprite("johnny")


	spsize = 1.23
	--1
	makeLuaSprite("1",'amends/1',-565,-205)
	setObjectOrder("1", getObjectOrder('gfGroup')-1)
	scaleObject('1', spsize, spsize)

	--2
	makeLuaSprite("2",'amends/2',-565,-205)
	setObjectOrder("2", getObjectOrder('gosha')+1)
	scaleObject('2', spsize, spsize)

	--3
	makeLuaSprite("3",'amends/3',-565,-205)
	setObjectOrder("3", getObjectOrder('boyfriendGroup')+1)
	scaleObject('3', spsize, spsize)


	addLuaSprite("1",false)
	addLuaSprite("2",false)
	addLuaSprite("3",true)
		
end

function onCreatePost()
	if songName == 'face-off' then
		doTweenAlpha('red','red',0,0.001,'linear');
	end
end

function onUpdatePost()
	if songName == 'face-off' then
		if curStep == 320 then
			doTweenAlpha('red','red',1,9,'linear');
		end
		if curStep == 415 then
			doTweenAlpha('red','red',0,0.5,'linear');
		end
		if curStep == 704 then
			doTweenAlpha('red','red',1,12,'linear');
		end
		if curStep == 831 then
			doTweenAlpha('red','red',0,0.5,'linear');
		end
		if curStep == 1212 then
			makeLuaSprite("black","",0, -250)
			makeGraphic("black",1500,1100,'000000')
			setObjectCamera("black","hud")
			setProperty('black.alpha', 0)
			addLuaSprite("black",true)
			doTweenAlpha('FadeTween', 'black', 100, 1.5, 'linear');
		end
	end
end
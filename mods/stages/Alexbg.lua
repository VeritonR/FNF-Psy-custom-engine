function onCreatePost()
	-- background shit
	makeLuaSprite('Bg', 'alex/alexbg_1', 50, 0);
	addLuaSprite('Bg', false);
	scaleObject('Bg', 1.45, 1.55)
	
	makeAnimatedLuaSprite('peoples', 'alex/peeps', -20, -90)
	addAnimationByPrefix('peoples', 'idle', 'idle', 14, true)
	setObjectOrder('peoples', getObjectOrder("bg")+20)
	scaleObject('peoples', 1.75, 1.75)
	addLuaSprite('peoples', true);

	makeAnimatedLuaSprite('cara', 'alex/guy', '1015', '460')
	addAnimationByPrefix('cara', 'idle', 'idle', 14, true)
	addLuaSprite('cara', false);
	scaleObject('cara', 0.85, 0.85)
	setObjectOrder('cara', getObjectOrder("Bg")+2)

	makeLuaSprite('light1', 'alex/light', 0, 0);
	addLuaSprite('light1', false);
	scaleObject('light1', 1.5, 1.5)

	makeLuaSprite('light2', 'alex/light', 3100, 0);
	setProperty('light2.flipX', true)
	addLuaSprite('light2', false);
	scaleObject('light2', 1.5, 1.5)

	if songName == 'loyal_B' then
		makeLuaSprite("dark", 'alex/dark', -875, 0)
		setProperty('dark.alpha', 0) --0.75
		scaleObject('dark', 1.5, 1.5)
		setObjectOrder('dark', getObjectOrder("peoples")-5)
		addLuaSprite('dark', true)
	end

end

local bfZoom = 0.675
local dadZoom = 0.5

function onUpdatePost()
	if songName == 'loyal_B' then
	else
		if curStep >= 512 and curStep <= 640 and songName == 'Unwanted' or curStep >= 640 and curStep <= 900 and songName == 'Loyal' or curStep >= 1407 and songName == 'Loyal' or songName == 'Loyal' and curStep <= 256 then
				setProperty('defaultCamZoom',dadZoom)
				doTweenAlpha('peoples','peoples',1,1,'linear');
		else	
			if mustHitSection == false then
				if currentTarget ~= 'dad' or currentZoom ~= dadZoom then
						setProperty('defaultCamZoom',dadZoom)
						currentTarget = 'dad'
						currentZoom = 0.55
					if songName == 'Unwanted' and curStep <= 111 then
					else
						doTweenAlpha('peoples','peoples',1,0.5,'linear');
					end	
				end	
			else
				if currentTarget ~= 'boyfriend' or currentZoom ~= bfZoom then
					setProperty('defaultCamZoom',bfZoom)
					currentTarget = 'boyfriend'
					currentZoom = 0.675
					doTweenAlpha('peoples','peoples',0.5,0.5,'linear');
				end
			end
		end
	end
end

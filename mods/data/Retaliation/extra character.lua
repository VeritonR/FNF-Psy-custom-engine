
idleoffsets = {'-28', '-33'}
leftoffsets = {'52', '-33'}
downoffsets = {'-28', '-33'}
upoffsets = {'-28', '-33'}
rightoffsets = {'-28', '-33'}
   
idle_xml_name = 'loyal Idle'
left_xml_name = 'loyal Left'
down_xml_name = 'loyal Down'
up_xml_name = 'loyal Up'
right_xml_name = 'loyal Right'

leftmiss_xml_name = 'loyal leftMISS'
downmiss_xml_name = 'loyal downMISS'
upmiss_xml_name = 'loyal upMISS'
rightmiss_xml_name = 'loyal rightMISS'

name_of_character_xml = 'Loyal_Assets'
name_of_character = 'Loyal_Assets'
name_of_notetype = 'No Animation'

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, 975, -25); --here
	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 22, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);

	addAnimationByPrefix(name_of_character, 'singLEFTmiss', leftmiss_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWNmiss', downmiss_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUPmiss', upmiss_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHTmiss', rightmiss_xml_name, 24, false);

	setProperty(name_of_character, 'flipX', false);


	objectPlayAnimation(name_of_character, 'idle');
	addLuaSprite(name_of_character, true);

end

animationsList = {}
holdTimers = {name_of_character = -1.0};
noteDatas = {name_of_character = 0};

function onSongStart()
	holdTimers = -1;
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.0025;
	if holdTimers >= 0 then
		holdTimers = holdTimers + elapsed;
		if holdTimers >= holdCap then
			holdTimers = -1;
		end
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype then
		objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
		holdTimers= 0;
		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
		end
	end
end

local missAnims = {"singLEFTmiss", "singDOWNmiss", "singUPmiss", "singRIGHTmiss"}
function noteMiss(id, miss, noteType, isSustainNote)
	if noteType == name_of_notetype then
		objectPlayAnimation(name_of_character, missAnims[miss + 1], true);
		holdTimers= 0;
		if miss == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
		elseif miss == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
		elseif miss == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
		elseif miss == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
		end
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		if holdTimers < 0 then
			objectPlayAnimation(name_of_character, 'idle');
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
end

function onCreatePost()
	objectPlayAnimation(name_of_character, 'idle');
	setObjectOrder('Loyal_Assets',getObjectOrder('dadGroup')-1)
	scaleObject(name_of_character, 1.065, 1.065); 
end

function onCountdownTick(counter)
	if counter % 1 == 0 then
		if holdTimers < 0 then
			objectPlayAnimation(name_of_character, 'idle');
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
end


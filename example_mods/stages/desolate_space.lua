local xx = 560;
local yy = 575;
local xx2 = 900;
local yy2 = 620;
local ofs = 25;
local ofs2 = 25;
local followchars = true;
local del = 0;
local del2 = 0;
local rings = 0

function onCreate()
	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	luaDebugMode = true

	setProperty('cameraSpeed', 2.0)
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');

	makeAnimatedLuaSprite('p3_Glitch', 'Xenostage/p3_Glitch', -700, 0);
	addAnimationByPrefix('p3_Glitch','batic','Glitch static',24,true)
	makeAnimatedLuaSprite('p3_Stats', 'Xenostage/P3_SonicStat', -600, 0);
	addAnimationByPrefix('p3_Stats','busk','TitleMenuSSBG instance 1',24,true)
	makeAnimatedLuaSprite('batic1', 'Xenostage/P3_Stat', 0, 0);
	addAnimationByPrefix('batic1', 'lanlubber', 'Phase3Static instance 1', 36, false);
	makeLuaSprite('p3_floor', 'Xenostage/p3_Grass', -700, -100)
	makeLuaSprite('p3_trs', 'Xenostage/p3_Trees2', -700, 0)
	makeLuaSprite('p3_tree', 'Xenostage/p3_Trees', -700, 0)
	makeLuaSprite('nono', 'makeGraphicsucks', 0, 0);
	makeLuaSprite('introcircle1', 'CircleTripleTrouble', 900, 0);
	makeLuaSprite('introtext1', 'TextTripleTrouble', -1000, 0);
	makeLuaSprite('Ring_Counter', 'Counter',5,590)
	scaleObject('nono', 6.0, 6.0);
	scaleObject('p3_Stats', 5.5, 5.5);
	scaleObject('batic1', 5.0, 5.0);
	scaleObject('p3_Glitch', 1.01, 1.01);
	setObjectCamera('nono', 'other');
	setObjectCamera('introcircle1', 'other');
	setObjectCamera('introtext1', 'other');
	setObjectCamera('batic1', 'other');
    setObjectCamera('Ring_Counter', 'other')
	setScrollFactor('p3_Glitch', 0.9, 0.9);
	setScrollFactor('p3_tree', 1.05, 1.0);
	setScrollFactor('p3_trs', 1.05, 1.0);
	setScrollFactor('batic1', 0, 0);

	setScrollFactor('ring', 0, 0);
    makeLuaText('rings', 'Rings: '..rings, 1000, 80, 570)
    setObjectCamera('rings', 'other')
	addLuaText('rings')
    setTextFont('rings', 'EurostileTBla.ttf')
    setTextSize('rings', 72.0)
    setTextBorder('rings', 4, 'CC6600')
    setTextColor('rings', 'FFCC33')
    setTextAlignment('rings', 'left')

	addLuaSprite('p3_Glitch', false)
	addLuaSprite('p3_Stats', false)
	addLuaSprite('p3_trs', false)
	addLuaSprite('p3_tree', false)
	addLuaSprite('p3_floor', false)
	addLuaSprite('Ring_Counter',true)
	addLuaSprite('batic1',true)
	addLuaSprite('nono', true);
	addLuaSprite('introcircle1', true);
	addLuaSprite('introtext1', true);

	setProperty('batic1.visible', false)
	setProperty('p3_Stats.visible', false)
	setTextString('rings', ''..rings)
end

function onCreatePost()
	setProperty('introSoundsSuffix', 'bruh')
	triggerEvent('Camera Follow Pos',xx,yy)
	setObjectOrder('batic1', getObjectOrder('creep') - 2)
	setObjectOrder('Ring_Counter', getObjectOrder('batic1') - 1)
	setObjectOrder('ring', getObjectOrder('batic1') - 1)
	setObjectOrder('nono', getObjectOrder('creep') + 1)
	setObjectOrder('introcircle1', getObjectOrder('nono') + 1)
	setObjectOrder('introtext1', getObjectOrder('introcircle1') + 1)
	addCharacterToList('eggy', 'dad')
	addCharacterToList('tails', 'dad')
	addCharacterToList('knux', 'dad')
	addCharacterToList('sonic-beast', 'dad')
	addCharacterToList('sonic-beast-invert', 'dad')
	addCharacterToList('P3-bf', 'bf')
	addCharacterToList('P3-bf-flip', 'bf')
	addCharacterToList('bf-invert', 'bf')
end

function onStartCountdown()
	setProperty('batic1.alpha', 0.66);
	doTweenX('circle1Tween', 'introcircle1', -100, 2.1, 'quintOut')
	doTweenX('text1Tween', 'introtext1', 100, 2.1, 'quintOut')
	runTimer('weeb1',2.1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'weeb1' then
		doTweenAlpha('graphicAlpha', 'nono', 0, 0.4, 'linear');
		doTweenAlpha('circleAlpha', 'introcircle1', 0, 0.4, 'linear');
		doTweenAlpha('textAlpha', 'introtext1', 0, 0.4, 'linear');
		runTimer('savespace',5)
	end
	if tag == 'statfin' then
		setProperty('batic1.visible', false)
	end
	if tag == 'savespace' then
		removeLuaSprite('introcircle1', true)
		removeLuaSprite('introtext1', true)
		removeLuaSprite('nono', true)
	end
end

function noteMiss(id, noteData, noteType)
	if not sussy then -- I do not know what this sussy variable does
        if data == 2 then
            setProperty('songMisses', getProperty('songMisses') - 1)
			setTextString('rings', ''..rings)
        else
            if rings > 0 then
                rings = rings - 1
                setProperty('songMisses', getProperty('songMisses') - 1)
			setTextString('rings', ''..rings)
            else
				setProperty('health', getProperty('health') - 100);
            end
        end
    end
end

function opponentNoteHit()
	if followchars == true and mustHitSection == false then
           
			setProperty('defaultCamZoom', 0.9)
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
			
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end

			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
           
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end

            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        end
	end

function goodNoteHit(id, data, type, sussy)
    if not sussy and data == 2 then
        rings = rings + 1
        playSound('Kaching',1)
		setTextString('rings', ''..rings)
    end
	if followchars == true and mustHitSection == true then
		if curStep < 5136 then
			setProperty('defaultCamZoom', 1.1)
		else
			setProperty('defaultCamZoom', 0.9)
		end

		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
        end
            
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
        end
            
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
        end
           
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
        end

        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
        end
    end
end

function onStepHit()
	if mustHitSection == true then
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			if curStep < 5136 then
			setProperty('defaultCamZoom', 1.1)
		else
			setProperty('defaultCamZoom', 0.9)
		end
            triggerEvent('Camera Follow Pos',xx2,yy2)
        end
	else
		if getProperty('dad.animation.curAnim.name') == 'idle' then
			setProperty('defaultCamZoom', 0.9)
			triggerEvent('Camera Follow Pos',xx,yy)
		end
	end
	if curStep == 4 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.16)
		objectPlayAnimation('batic1', 'lanlubber', false);
		doTweenZoom('camGame', 'camGame', 1.2, 1.15, 'linear')
	end
	if curStep == 1029 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 1040 then
		setProperty('p3_Stats.visible', true)
	end
	if curStep == 1094 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 1221 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 1285 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 1296 then
		setProperty('p3_Stats.visible', false)
	end
	if curStep == 2308 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 2320 then
		setProperty('p3_Stats.visible', true)
	end
	if curStep == 2820 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 2824 then
		setProperty('p3_Stats.visible', false)
	end
	if curStep == 3204 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 3460 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 4100 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 4112 then
		setProperty('p3_Stats.visible', true)
	end
	if curStep == 5125 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	setPropertyFromGroup('opponentStrums', 2, 'alpha', 0)
end

function onEvent(name, value1, value2)
    if name == 'Invert Strum Position' then
        xx = 900
		xx2 = 560
    end
    if name == 'Reset Strum Position' then
        xx = 560
		xx2 = 900
    end
end
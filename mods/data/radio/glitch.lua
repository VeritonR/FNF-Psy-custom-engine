local shaderName = "glitch"

function onUpdate(elapsed)
    if curStep == 1020 then
        cameraShake("game", 0.025, 0.55)
        cameraShake("hud", 0.025, 0.55)
    end
    if curStep == 1024 then
        shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

        makeLuaSprite("glitch")
        makeGraphic("shaderImage", screenWidth, screenHeight)
    
       setSpriteShader("shaderImage", "glitch")
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("glitch").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("glitch").shader)]);
        return;
    ]])
    end
        setShaderFloat("glitch", "iTime", os.clock())
    if curStep == 1567 then
        removeSpriteShader("shaderImage")
        setProperty('camGame.filtersEnabled', false)
        setProperty('camHUD.filtersEnabled', false)

    end
 end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end
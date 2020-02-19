obj = 0
mWorld = 0

onStart = function(g_object, world)
	debug.Log("hello from testscript.lua")

    obj = g_object

    leng = length(Vec3(-1, -1, -1))
    debug.Log(leng)
    
    mWorld = world
    
	return 0
end

onFrame = function(frameTime)
    transform = obj:transform().translation --Obtain position vector of object
    tile = obj:tile() --Obtain TileProperty from object
    
    transform.x = transform.x + 10.2 * frameTime
    obj:transform():setPosition(transform)
    --If U key has been pressed
    if(input.isKeyPressed(input.KEY_U)) then 
        obj:audio():Play() --then play music
        tile:playAnim()
    end

    if(input.isKeyPressed(input.KEY_T)) then 
        engine.loadWorld("small_test.scn")
    end

	if(input.isKeyPressed(input.KEY_N)) then 
        	window.setWindowSize(1024,768)
    	end
	if(input.isKeyPressed(input.KEY_Z)) then 
        	window.setWindowMode(window.MODE_FULLSCREEN)
    	end

	if(input.isKeyPressed(input.KEY_V)) then 
        	obj:setActive(false)
    	end
	if(input.isKeyPressed(input.KEY_G)) then 
        obj:setLabel("PIDOR")

		mWorld:findObject("player"):script():getScript("scripts/char_move.lua"):func("printtext", "PIDOR", 33, 22.0)
		mWorld:findObject("player"):script():getScript("scripts/char_move.lua"):func("charmove", 3,3,3)
    	end
	
	if(input.isKeyPressed(input.KEY_L)) then 
        	mWorld:instantiate(mWorld:findObject("tftf"))
    	end
    
	return 0
end

obj = 0

speed = 100.4
mPLayerObj = 0
cam = 0 --Camera container
_world = 0 --World container

onStart = function(g_object, world)

    obj = g_object
    cam = world.camera
    _world = world
    
	return 0
end
printtext = function(text, integer, number)
	debug.Log(text)
	debug.Log(integer)
	debug.Log(number)
end

charmove = function(x, y, z)
	obj:transform():setPosition(Vec3(x,y,z))
end


onFrame = function(frameTime)
	
    transform = obj:transform().translation
    tile = obj:tile()
    cam_viewport = cam.viewport
    isKeyPressed = 0
    
    if(input.isKeyHold(input.KEY_W)) then 
        transform.y = transform.y + speed * frameTime
        isKeyPressed = 1
    end
    if(input.isKeyHold(input.KEY_S)) then 
        transform.y = transform.y - speed * frameTime
        isKeyPressed = 1
    end
    if(input.isKeyHold(input.KEY_A)) then 
        transform.x = transform.x + speed * frameTime
        isKeyPressed = 1
    end
    if(input.isKeyHold(input.KEY_D)) then 
        transform.x = transform.x - speed * frameTime
        isKeyPressed = 1
    end
    
    if(isKeyPressed == 1) then
        
        obj:transform():setPosition(transform)
    end
    
    result_vec = Vec3(transform.x + cam_viewport.endX / 2, transform.y - cam_viewport.endY / 2, 0)
    cam:setPosition(result_vec)
    
    
	return 0
end
 

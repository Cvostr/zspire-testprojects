pitch = 0
yaw = 0
mPlayerObj = 0
mWorld = 0

onStart = function(g_object, world)
	mWorld = world
	camera = world.camera
    mPlayerObj = world:findObject("player");
	return 0
end

onFrame = function(frameTime)
	mouse_state = input.getMouseState() --Obtain mouse state
	camera = mWorld.camera --current camera state
	
	yaw = yaw + mouse_state.relX * 0.16 --new pitch value
    pitch = pitch + mouse_state.relY * 0.16 --new yaw value

    if (pitch > 89) then
    	pitch = 89
	end

    if (pitch < -89) then
        pitch = -89
	end
	--Fill the vector
    front = Vec3(0,0,0)
    front.x = math.cos(math.rad(yaw)) * math.cos(math.rad(pitch))
    front.y = -math.sin(math.rad(pitch))
    front.z = math.sin(math.rad(yaw)) * math.cos(math.rad(pitch))
	--normalize vector        
	front = normalize(front)
    camera:setFront(front)


    front_vec = Vec3(0, 0, 0);
    front_vec.x = camera.front.x;
    front_vec.y = camera.front.y;
    front_vec.z = camera.front.z 
    
    front_vec.x = front_vec.x * -15;
    front_vec.y = front_vec.y * -15;
    front_vec.z = front_vec.z * -15 
    
    camera:setPosition(v_add(mPlayerObj:transform().translation, front_vec));
    
	return 0
end

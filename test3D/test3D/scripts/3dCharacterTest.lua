mWorld = 0
mObject = 0

obj_rigidbody = 0
mTransform = 0

speed = 10

onStart = function(g_object, world)
    mWorld = world;
    mObject = g_object

    obj_rigidbody = mObject:character()
    mTransform = mObject:transform()
    
    return 0
end

onFrame = function()
    
    camera = mWorld.camera
    linearVel = Vec3(0, -10, 0)

    cam_front = camera.front
    
    if(input.isKeyHold(input.KEY_W)) then 
        linearVel = sum(linearVel, mul(cam_front, speed));
    end
    if(input.isKeyHold(input.KEY_S)) then 
       linearVel = sum(linearVel, mul(cam_front, -speed));
    end
    if(input.isKeyHold(input.KEY_A)) then 
        right_vec = v_cross(cam_front, camera.up)
        right_vec = normalize(right_vec);
        linearVel = sum(linearVel, mul(right_vec, -speed));
    end
    if(input.isKeyHold(input.KEY_D)) then 
        right_vec = v_cross(cam_front, camera.up)
        right_vec = normalize(right_vec);
        linearVel = sum(linearVel, mul(right_vec, speed));
    end
    
    obj_rigidbody:setLinearVelocity(linearVel)
    

return 0
end

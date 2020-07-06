mWorld = 0
mObject = 0
mCamObject = 0

obj_rigidbody = 0
mTransform = 0

speed = 10

onStart = function(g_object, world)
    mWorld = world;
    mObject = g_object
    mCamObject = mWorld:findObject("Camera")

    obj_rigidbody = mObject:character()
    mTransform = mObject:transform()
    
    return 0
end

onFrame = function()
    
    camera = mWorld.camera
    linearVel = Vec3(0, -10, 0)

    yaw = mCamObject:script():getScript("scripts/camera_look.lua"):func("getyaw")
    cam_front = camera.front

    moved = false
    
    if(input.isKeyHold(input.KEY_W)) then 
        linearVel = sum(linearVel, mul(cam_front, speed));
        moved = true
    end
    if(input.isKeyHold(input.KEY_S)) then 
       linearVel = sum(linearVel, mul(cam_front, -speed));
       moved = true
    end
    if(input.isKeyHold(input.KEY_A)) then 
        right_vec = v_cross(cam_front, camera.up)
        right_vec = normalize(right_vec);
        linearVel = sum(linearVel, mul(right_vec, -speed));
        moved = true
    end
    if(input.isKeyHold(input.KEY_D)) then 
        right_vec = v_cross(cam_front, camera.up)
        right_vec = normalize(right_vec);
        linearVel = sum(linearVel, mul(right_vec, speed));
        moved = true
    end
    
    if(input.isKeyHold(input.KEY_SPACE)) then 
        obj_rigidbody:Jump(1);
    end

    if(moved) then
        mObject:animation():play()
        mTransform:setRotation(Vec3(mTransform.rotation.x, (180 - yaw), mTransform.rotation.z))
    else 
        mObject:animation():stop()
    end
    
    obj_rigidbody:Walk(linearVel.x, linearVel.z)
    

return 0
end

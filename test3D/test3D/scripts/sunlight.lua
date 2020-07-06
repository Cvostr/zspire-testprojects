mObject = 0
mTransform = 0

onStart = function(g_object, world)
  mObject = g_object
  mTransform = mObject:transform()
  return 0
end

onFrame = function(frameTime)
  rot = mTransform.rotation
  mTransform:setRotation(Vec3(rot.x + 0.1 , rot.y, rot.z))
  return 0
end
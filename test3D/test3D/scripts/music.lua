
mGameObject = 0
mAudio = 0

onStart = function(g_object, world)
	mGameObject = g_object  
	mAudio = mGameObject:audio()
	mAudio:setAudioFile("file1.wav")
	return 0
end

onFrame = function(frameTime)
	if(input.isKeyPressed(input.KEY_U)) then 
	        mAudio:Play() --then play music
    	end
  return 0
end

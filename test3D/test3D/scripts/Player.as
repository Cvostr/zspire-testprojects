float speed = 7;
class Player : ZPScript{
	CharacterController@ char;
	GameObject@ obj_ref;
	Camera@ cam;
	
	Player(GameObject@ o)
	{
		@obj_ref = o;
	}
	
	void Start() {
		@char = obj_ref.char_ctrl();
		@cam = obj_ref.world.getCamera();
	}
	void Update(){
		bool moved = false;
		Vec3 linearVel = Vec3(0, -10, 0);

		if(isKeyHold(KEY_W)){
			linearVel = linearVel + cam.front * speed;
			moved = true;
    	}
		if(isKeyHold(KEY_S)) {
			linearVel = linearVel + cam.front * -speed;
			moved = true;
		}
		if(isKeyHold(KEY_A)){ 
			Vec3 right_vec = cross(cam.front, cam.up);
			right_vec.Normalize();
			linearVel = linearVel + right_vec * -speed;
			moved = true;
		}
		if(isKeyHold(KEY_D)) {
			Vec3 right_vec = cross(cam.front, cam.up);
			right_vec.Normalize();
			linearVel = linearVel + right_vec * speed;
			moved = true;
		}

		if(isKeyPressed(KEY_SPACE)){
			char.Jump(8);
		}

		char.Walk(linearVel.x, linearVel.z);

		if(moved) {
        	obj_ref.anim().Play();
        	//mTransform:setRotation(Vec3(mTransform.rotation.x, (180 - yaw), mTransform.rotation.z))
    	}else{
        	obj_ref.anim().Stop();
    	}

	}
}
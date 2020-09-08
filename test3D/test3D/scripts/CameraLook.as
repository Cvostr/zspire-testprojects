string player_obj_name = "test";
float dist_to_player = 15;

class angel : ZPScript{

	GameObject@ player;
	GameObject@ obj_ref;
	World@ world;
	MouseState@ mouse;
	Camera@ cam;

	float pitch = 0;
	float yaw = 0;

	angel(GameObject@ o){
		@obj_ref = o;
	}
	void Start() {
		@mouse = getMouseState();
		@world = obj_ref.world;
		@cam = world.getCamera();

		@player = world.findObject(player_obj_name);
	}
	void Update(){
		yaw += mouse.relX * 0.16; //new pitch value
    	pitch += mouse.relY * 0.16; //new yaw value

		if (pitch > 89) {
    		pitch = 89;
		}

		if (pitch < 15){
			pitch = 15;
		}
		
		if (yaw > 360) {
			yaw = 0;
		}

		//Fill the vector
		Vec3 front = Vec3(0,0,0);
		front.x = cos(rad(yaw)) * cos(rad(pitch));
		front.y = -sin(rad(pitch));
		front.z = sin(rad(yaw)) * cos(rad(pitch));
		//normalize vector        
		front.Normalize();
		cam.front = front;
		cam.updateViewMat();

		cam.pos = player.transform().translation + cam.front * -dist_to_player;

		//print(mouse.relX, mouse.relY, cam.front, "xui pizda", true, false);
	}
}
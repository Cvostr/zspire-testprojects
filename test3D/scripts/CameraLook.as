class CameraLook : ZPScript{

	string player_obj_name = "test";
	float dist_to_player = 15;

	GameObject@ player;
	GameObject@ obj_ref;
	World@ world;
	MouseState@ mouse;
	CameraComponent@ ObjCamera;

	float pitch = 0;
	float yaw = 0;

	CameraLook(GameObject@ o){
		@obj_ref = o;
		@ObjCamera = o.camera();
	}
	void Start() {
		@mouse = getMouseState();
		@world = obj_ref.world;

		@player = world.findObject(player_obj_name);

		world.AddFromPrefab(getResources().getPrefab("Pilot"));
	}
	void Update(){
		yaw += mouse.relX * 0.16; //new pitch value
    	pitch += mouse.relY * 0.16; //new yaw value

		if (pitch > 89) {
    		pitch = 89;
		}

		if (pitch < 5){
			pitch = 5;
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
		
		Vec3 newPos = player.transform().translation + front * -dist_to_player;

		obj_ref.transform().setTranslation(newPos);
		obj_ref.transform().setRotation(Vec3(pitch, yaw, 0));
	}
}
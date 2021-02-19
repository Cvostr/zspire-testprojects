#include "scripts/music"

class Player : ZPScript{
	float dfg = 9;
	float speed = 7;
	float JumpHeight = 6;

	private float SpeedMod = 40;

	CharacterController@ char;
	CameraComponent@ camera;
	GameObject@ obj_ref;
	World@ world;

	music@ musComp;
	KeyValueFile@ kv;
	
	Player(GameObject@ o)
	{
		@obj_ref = o;
		@world = o.world;
		@kv = KeyValueFile();
		
	}
	
	void Start() {
		@char = obj_ref.character();
		@musComp = cast<music>(obj_ref.getScriptClass("music"));
		@camera = world.findObject("Camera").camera();

		kv.ReadFile("file");
		kv.SetInt("ilita", 228);
		kv.SetInt("lalka", 1337);
		kv.SaveAll();
	}
	void Update(){
		
		Time@ time = GetTime();
		print(time.GetDeltaTime());
		bool moved = false;
		Vec3 linearVel = Vec3(0, -10, 0);

		GameObject@ rayt = obj_ref.world.RayTestFirstObject(obj_ref.transform().translation + Vec3(0,1,0), Vec3(0, -1, 0), 2);
		if(rayt !is null)
			rayt.setLabel("underplayer");

		Vec3 front = camera.GetFront();
		Vec3 up = camera.GetUp();

		if(isKeyHold(KEY_W)){
			linearVel = linearVel + front * speed * time.GetDeltaTime() * SpeedMod;
			moved = true;
    	}
		if(isKeyHold(KEY_S)) {
			linearVel = linearVel + front * -speed * time.GetDeltaTime() * SpeedMod;
			moved = true;
		}
		if(isKeyHold(KEY_A)){ 
			Vec3 right_vec = cross(front, up);
			right_vec.Normalize();
			linearVel = linearVel + right_vec * -speed * time.GetDeltaTime() * SpeedMod;
			moved = true;
		}
		if(isKeyHold(KEY_D)) {
			Vec3 right_vec = cross(front, up);
			right_vec.Normalize();
			linearVel = linearVel + right_vec * speed * time.GetDeltaTime() * SpeedMod;
			moved = true;
		}

		if(isKeyPressed(KEY_SPACE)){
			char.Jump(JumpHeight);
		}

		

		if(moved) {
			char.Walk(linearVel.x, linearVel.z);

        	obj_ref.anim().Play();
			musComp.PlayMus();
    	}else{
        	obj_ref.anim().Stop();
    	}

	}
}
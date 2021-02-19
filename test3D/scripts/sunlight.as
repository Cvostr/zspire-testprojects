RGBAColor col = RGBAColor(255,255,245);

AudioResource@ audio;

class sunlight : ZPScript{

	private Time@ time;

	GameObject@ obj_ref;
	
	sunlight(GameObject@ o)
	{
		@obj_ref = o;
	}
	
	void Start() {
		@time = GetTime();
	}
	void Update(){
		Vec3 rot = obj_ref.transform().rotation;
		obj_ref.transform().setRotation(Vec3(rot.x + time.GetDeltaTime(), rot.y, rot.z));

		RGBAColor lCol = obj_ref.light().color;
		obj_ref.light().color.r = lCol.r + 1;

		
	}
}
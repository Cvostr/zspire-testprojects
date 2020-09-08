int test_glob = 4;
float test_glob_2 = 10.5f;
bool test_glob_3 = true;
Vec3 test_vec = Vec3(0, 1, 0);
string test_str = "str";

rgbColor col = rgbColor(255,255,245);

AudioResource@ audio;

class angel : ZPScript{

	GameObject@ obj_ref;
	
	angel(GameObject@ o)
	{
		@obj_ref = o;
		print(test_glob, test_glob_2);
	}
	
	void Start() {

	}
	void Update(){
		Vec3 rot = obj_ref.transform().rotation;
		obj_ref.transform().setRotation(Vec3(rot.x + 0.1 , rot.y, rot.z));

		rgbColor lCol = obj_ref.light().color;
		obj_ref.light().color.r = lCol.r + 1;

		
	}
}
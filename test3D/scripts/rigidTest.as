class rigid : ZPScript{
	GameObject@ obj;
	rigid(GameObject@ o){
		@obj = o;
	}
	void Start() {

	}
	void Update(){
		if(isKeyPressed(KEY_N)){
			obj.rigidbody().applyCentralImpulse(Vec3(1, 5, 0));
		}
		if(isKeyPressed(KEY_K)){
			obj.rigidbody().applyCentralForce(Vec3(10, 50, 0));
		}
	}
}
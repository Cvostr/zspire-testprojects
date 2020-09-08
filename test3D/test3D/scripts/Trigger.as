class angel : ZPScript{
	angel(GameObject@ o){

	}
	void Start() {

	}
	void Update(){

	}
	void onTrigger(GameObject@ obj){
		print("Collide with", obj.getLabel());
	}
}
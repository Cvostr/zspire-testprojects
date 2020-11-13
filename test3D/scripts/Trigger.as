class Trigger : ZPScript{
	Trigger(GameObject@ o){

	}
	void Start() {

	}
	void Update(){

	}
	void onTrigger(GameObject@ obj){
		print("Collide with", obj.getLabel());
	}
	void onTriggerEnter(GameObject@ obj){
		print("Collide enter with", obj.getLabel());
	}
	void onTriggerExit(GameObject@ obj){
		print("Collide exit with", obj.getLabel());
	}
}
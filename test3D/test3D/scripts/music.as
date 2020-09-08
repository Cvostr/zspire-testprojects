class angel : ZPScript{
	GameObject@ obj;
	AudioSource@ aud;
	angel(GameObject@ o){
		@obj = o;
		@aud = obj.audio();
	}
	void Start() {
		aud.setAudio(getResources().getAudio("filedd.wav"));
		aud.Play();
	}
	void Update(){

	}
}
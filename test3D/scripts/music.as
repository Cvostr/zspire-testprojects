class music : ZPScript{
	GameObject@ obj;
	AudioSource@ aud;
	music(GameObject@ o){
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
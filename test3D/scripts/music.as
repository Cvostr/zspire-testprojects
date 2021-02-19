class music : ZPScript{
	GameObject@ obj;
	AudioSource@ aud;
	music(GameObject@ o){
		@obj = o;
		@aud = obj.audio();
	}
	void Start() {
		aud.setAudio(getResources().getAudio("audio/file1"));
		PlayMus();
	}
	void Update(){

	}
	void PlayMus(){
		aud.Play();
	}
}
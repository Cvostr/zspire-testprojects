class menu : ZPScript{

	private Ui@ manager;
	private Button@ btn;
	private Button@ btn1;
	private Button@ btn2;
	LinearLayout@ ll;

	menu(GameObject@ o){
	}
	void Start() {
		@manager = GetUi();
		@btn = Button();
		@btn1 = Button();
		@btn2 = Button();
		@ll = LinearLayout();

		ll.Orientation = ORIENTATION_VERTICAL;
		ll.move(40, 140);

		btn.SetDefaultSprite(getResources().getTexture("textures/grass"));
		btn1.SetDefaultSprite(getResources().getTexture("big_building"));
		btn2.SetDefaultSprite(getResources().getTexture("big_building"));

		btn.setText("play_btn");
		btn.setTextColor(RGBAColor(255,0,255));

		ll.AddView(btn);
		ll.AddView(btn1);
		ll.AddView(btn2);

		manager.SetRootLayout(ll);

		SetMouseRelativeMode(true);
	}
	void Update(){
		if(btn.isClicked())
			GetWindow().SetWindowSize(1280, 720);
		if(btn1.isClicked())
			GetWindow().SetWindowMode(1);
	}
}
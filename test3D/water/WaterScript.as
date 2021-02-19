class WaterScript : ZPScript{

	GameObject@ MainCamera;
	GameObject@ WaterCamera;
	GameObject@ This;
	World@ world;

	WaterScript(GameObject@ o){
		@world = o.world;
		@This = o;
	}
	void Start() {
		@MainCamera = world.findObject("Camera");
		@WaterCamera = world.findObject("WaterC");

		WaterCamera.camera().SetViewMask(1);
		WaterCamera.camera().SetAutoAspectRatio(false);

		Plane pl = Plane(Vec3(0,1,0), This.transform().translation + Vec3(0, -0.1, 0));
		WaterCamera.camera().SetReflectionPlane(pl);
		
		This.SetViewMask(2);
	}
	void Update(){
		CameraLook@ cml = cast<CameraLook>(MainCamera.getScriptClass("CameraLook"));
		Vec3 CurRotation = WaterCamera.transform().rotation;
		
		CurRotation.y = cml.yaw;
		CurRotation.x = cml.pitch;

		WaterCamera.transform().setRotation(CurRotation);

		Vec3 CameraPos = MainCamera.transform().translation;
		Vec3 WaterPos = This.transform().translation;

		float diff = abs(CameraPos.y - WaterPos.y);

		WaterCamera.transform().setTranslation(Vec3(CameraPos.x, CameraPos.y, CameraPos.z));

		WaterCamera.camera().SetAspectRatio(MainCamera.camera().GetAspectRatio());
	}
}
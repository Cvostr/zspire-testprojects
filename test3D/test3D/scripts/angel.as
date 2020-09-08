class angel : ZPScript{

    GameObject@ obj_ref;

    angel(GameObject@ o)
    {
        @obj_ref = o;
    }

    void Start(){
        //obj_ref.transform().setActive(false);
        //obj_ref.setActive(false);
        print("aaa");
        
    }

    void Update(){
        Vec3@ p = obj_ref.transform().translation;
        p.x += 0.1;
        p.y += 0.1;
        p.z = 0.18;

        obj_ref.transform().setTranslation(p);

        print("bbb");
    }
}
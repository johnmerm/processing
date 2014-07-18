class Bouncer extends GameHandler{
  Bouncer(Physics physics){
   super(physics);
  }
  
  Shape[] getSceneSetup(){
    ArrayList a = new ArrayList();
    physics.setRestitution(0);
    a.add(new Platform(physics,200,40,width/2,height-50,5,0));
    physics.setRestitution(1);
    for (int i=0;i<2;i++){
      float x = random(100,width-100);
      float y = random(100,height-100);
      float theta =pi/5;
      a.add(new Ball(physics,50,x,y,10,theta));
    }
    return (Shape[])a.toArray(new Shape[a.size()]);
  }
}

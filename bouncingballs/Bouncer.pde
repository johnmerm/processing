class Bouncer extends GameHandler{
  
  AudioPlayer ding = maxim.loadFile("ding.wav");
  
  
  Bouncer(Physics physics){
   super(physics);
  }
  
  Body pp = null;
  
  Shape[] getSceneSetup(){
    ArrayList a = new ArrayList();
    physics.setRestitution(0);
    physics.setDensity(100);
    
    
    a.add(new Platform(physics,200,40,width/2,height-50,5,0));
    
    physics.setRestitution(1);
    for (int i=0;i<2;i++){
      float x = random(100,width-100);
      float y = random(100,height-100);
      float theta =pi/5;
      physics.setDensity(1.0);
      physics.setRestitution(1);
      color c = (i%2==0 ? color(255,0,0):color(0,255,0));
      a.add(new Ball(physics,c,50,x,y,10,theta));
    }
    
    pp = ((Shape)a.get(0)).getBody();
    
    ding.setLooping(false);
    return (Shape[])a.toArray(new Shape[a.size()]);
  }
  
  
  void keyPressed(){
    Vec2 impulse = new Vec2(0,0);
    if (key == CODED) {
      
      if (keyCode == LEFT) {
        
        impulse = new Vec2(-10000,0);
        pp.applyImpulse(impulse,pp.getWorldCenter());
      }else if (keyCode == RIGHT) {
        
        impulse = new Vec2(10000,0);
        pp.applyImpulse(impulse,pp.getWorldCenter());
      }
    }
    
  }
  
  public void result(ContactResult p){
    super.result(p);
    println(p.shape1.getBody().getMass()+" "+p.shape2.getBody().getMass());
    if (p.shape1.getBody().getMass()<20.0 && p.shape2.getBody().getMass() < 20.0){ 
      ding.cue(0);
      ding.play();
    }
  }
}

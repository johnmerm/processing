class Billard extends GameHandler {
  private Ball striker;

  AudioPlayer[] chicks;
  int aChick = 0;
  Billard(Physics physics){
   super(physics);
   
   
  }
  
  Shape[] getSceneSetup(){
      physics.setRestitution(0.5);
      physics.setDensity(1.0);
      physics.setFriction(0.2);
      physics.getWorld().setGravity(new Vec2(0,0));
      
      ArrayList a = new ArrayList();
      float r = 30;
      int bi = 0;
      
      for (int i=0;i<5;i++){
        float x = width/2 + i*r/2;
        float y = height/2 - i*r/2;
        for (int j=0;j<=i;j++){
          
      
          color c;
          if (bi == 4){
            print("7");
            c = color(10,10,10);
          }else if (bi %2==0){
            c = color (255,0,0);
          }else if (bi %2 ==1 ){
            c = color (0,255,255);
          }else{
            c= color(100,100,100);
          }
          a.add(new Ball(physics,c,r,x+i*5,y+j*(r+5),0,0));
          bi ++;    
        }
       
      }
      
      striker = new Ball(physics,color(255,255,255),r,width/2-300,height/2,0,0); 
      a.add(striker);
      
      chicks = new AudioPlayer[a.size()];
      for (int i=0;i<chicks.length;i++){
         chicks[i] = maxim.loadFile("chick.wav");
         chicks[i].setLooping(false);
       }
      return (Shape[])a.toArray(new Shape[a.size()]);
  }
  int px,py;
  void mousePressed(){
    px = mouseX;
    py = mouseY;
  }
  void mouseReleased(){
     Vec2 impulse = new Vec2(mouseX-px,py-mouseY);
     Vec2 center = new Vec2(px,py);
     striker.getBody().applyImpulse(impulse,center);
   }
   
   public void result(ContactResult r){
     super.result(r);
     if (r.shape1.getBody().getMass()*r.shape2.getBody().getMass() !=0){
       //don't play sound when collidimg with wall
       aChick = (aChick+1)%chicks.length;
       chicks[aChick].cue(0);
       chicks[aChick].play();
     }
   }
}


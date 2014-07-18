class Billard extends GameHandler {
  private Ball striker;
  Billard(Physics physics){
   super(physics);
   physics.getWorld().setContactListener(this);
  }
  
  Shape[] getSceneSetup(){
      physics.setRestitution(1);
      ArrayList a = new ArrayList();
      float r = 30;
      for (int i=0;i<5;i++){
        float x = width/2 + i*r/2;
        float y = height/2 - i*r/2;
        for (int j=0;j<=i;j++){
          a.add(new Ball(physics,r,x+i*5,y+j*(r+5),0,0));
        }
       
      }
      
      striker = new Ball(physics,r,width/2-300,height/2,0,0); 
      a.add(striker);
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
   
}


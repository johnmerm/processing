class Billard extends GameHandler{
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
      a.add(new Ball(physics,r,width/2-300,height/2,20,0.01));
      return (Shape[])a.toArray(new Shape[a.size()]);
  }
}


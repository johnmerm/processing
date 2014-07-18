abstract class GameHandler implements ContactListener{
  protected Physics physics;
  protected GameHandler(Physics physics){
    this.physics = physics;
  }
  
  abstract Shape[] getSceneSetup();
  void mousePressed(){}
  void mouseReleased(){}
  void keyPressed(){}
  void mouseClicked(){}
  
  
  boolean collisionHappened; 
  public void persist(ContactPoint p)
  {
  }
  
  public void add(ContactPoint p)
  {
    collisionHappened = true;
    
    Body body1 = p.shape1.getBody();
    Body body2 = p.shape2.getBody();
    stroke(255,255,255);
    strokeWeight(1);
    Vec2 pos1 = physics.worldToScreen(body1.getWorldCenter());
    Vec2 pos2 = physics.worldToScreen(body2.getWorldCenter());
    line(pos1.x,pos1.y,pos2.x,pos2.y);
  }

  public void remove(ContactPoint p)
  {
  }
  
  public void result(ContactResult r)
  {
    if (collisionHappened)
    {
      collisionHappened = false;
    }
    
  }

  
}




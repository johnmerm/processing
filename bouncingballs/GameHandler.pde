abstract class GameHandler{
  Physics physics;
  GameHandler(Physics physics){
    this.physics = physics;
  }
  
  abstract Shape[] getSceneSetup();
  void mousePressed(){}
  void mouseReleased(){}
  void keyPressed(){}
  void mouseClicked(){}
  
}




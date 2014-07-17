interface Shape{
  boolean checkCollision(Shape s);
  void afterCollision(Shape s);
  
  void next();
  void draw();
}

class Platform implements Shape{
  float x,y;
  float px,py;
  
  float p_width = 50;
  float p_height = 10;
  
  float v = 5;
  Platform (float x,float y){
    this.x = x;
    this.y = y;
  }
  
  boolean checkCollision(Shape s){
    if (s == null){
      // Check collision against the borders
      return (x >= width-p_width/2 || x<=0);
    }else if (s instanceof Ball){
      return s.checkCollision(this);
    }
    return false;
  }
  
  void afterCollision(Shape s){
   if (s == null){
     // Collision against the borders
     v = -v;  
   }
  }
  void next(){
    px = x;
    py = y;
    
    x += v;
    
  }
  void draw(){
    stroke(0,0,0);
    fill(0,0,0);
    rect(px,py,p_width,p_height);
    stroke(0,0,0);
    fill(100,100,100);  
    rect(x,y,p_width,p_height);
  }
  
  String toString(){
    return "platform:x = "+x+" y = "+y;
  }
}

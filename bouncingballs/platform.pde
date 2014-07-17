class Platform implements Shape{
  float x,y;
  float px,py;
  
  float p_width;
  float p_height;
  
  float v;
  Platform (float p_width,float p_height,float x,float y,float v){
    this.p_width = p_width;
    this.p_height = p_height;
    this.x = x;
    this.y = y;
    this.v = v;
  }
  
  boolean checkCollision(Shape s){
    if (s == null){
      // Check collision against the borders
      return (x >= width-p_width/2 || x<=p_width/2);
    }else if (s instanceof Ball){
      return s.checkCollision(this);
    }
    return false;
  }
  
  void afterCollision(Shape s){
   if (s == null){
     // Collision against the borders
     v = -v;  
   }else if (s instanceof Ball){
     s.afterCollision(this);
   }
  }
  void next(){
    px = x;
    py = y;
    
    x += v;
    
  }
  void draw(){
    rectMode(CENTER);
    stroke(0,0,0);
    fill(0,0,0);
    rect(px,py,p_width,p_height);
    stroke(0,0,0);
    fill(100,100,100);  
    rect(x,y,p_width,p_height);
    
    stroke(255);
    strokeWeight(10); 
    point(x,y);
  }
  
  String toString(){
    return "platform:x = "+x+" y = "+y;
  }
}

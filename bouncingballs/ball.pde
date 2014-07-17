import java.lang.RuntimeException;

class Ball implements Shape{
  float radius = 10;
  float px,py;
  float x,y;
  float v = 10;
  float theta;
  Ball(float x,float y,float theta){
    this.x = x;
    this.y = y;
    this.theta = theta;
  }
  
  void next(){
    px = x;
    py = y;
    
    theta = theta % (2*pi);
    
    
    float dx = cos(theta)*v;
    float dy = sin(theta)*v;
    
    x += dx;
    y += dy;

  }
  boolean checkCollision(Shape s){
    if (s==null){
      //Check collision with the borders
      return (x >= width-10 || x <= 10 || y >= height-10 || y <= 10);
    }else { 
      if (s == this){
        throw new RuntimeException("checkCollision with self!!!!");
      }else{
        if (s instanceof Platform){
          float sx = ((Platform)s).x;  
          float sy = ((Platform)s).y;
          float sw = ((Platform)s).p_width;  
          float sh = ((Platform)s).p_height;
          
          return (abs(x-sx)<= sw && abs(y-sy)<=sh);
        }else if (s instanceof Ball){
          float sx = ((Ball)s).x;  
          float sy = ((Ball)s).y;
          
          return (abs(x-sx)<= radius && (abs(y-sy)<=radius));
        }else{
          throw new RuntimeException("What shape is this? "+s.getClass());
        }
      }
    }
  }
  
  void afterCollision(Shape s){
    if (s == null){
      if ((x >= width || x <= 0) && (y >= height || y <= 0)){
        theta =  pi+ theta;
      }else if (x >= width || x <= 0){
        theta  = pi - theta;
      }else if (y >= height || y <= 0){
        theta = 2*pi - theta;
      }
    }else if (s instanceof Platform){
      theta  = pi - theta;
    }else if (s instanceof Ball){
      theta  = pi - theta;
    }
  }
  
  
  
  void draw(){
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(px,py,radius,radius);
    stroke(0,0,0);
    fill(100,100,100);  
    ellipse(x,y,radius,radius);
  }
  
  String toString(){
    return "ball:x = "+(int)x+" y = "+(int)y+" theta = "+(int)degrees(theta);
  }
}


import java.lang.RuntimeException;


class Ball implements Shape{
  float diameter = 10;
  float px,py;
  float x,y;
  float v = 10;
  float theta;
  Ball(float diameter,float x,float y,float v,float theta){
    
    this.diameter = diameter;
    this.x = x;
    this.y = y;
    this.v = v;
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
      return (x >= width-diameter/2 || x <= diameter/2 || y >= height-diameter/2 || y <= diameter/2);
    }else { 
      if (s == this){
        throw new RuntimeException("checkCollision with self!!!!");
      }else{
        if (s instanceof Platform){
          float sx = ((Platform)s).x;  
          float sy = ((Platform)s).y;
          float sw = ((Platform)s).p_width;  
          float sh = ((Platform)s).p_height;
          
          return (abs(x-sx)<= (sw+diameter)/2 && abs(y-sy)<=(sh+diameter)/2);
        }else if (s instanceof Ball){
          float sx = ((Ball)s).x;  
          float sy = ((Ball)s).y;
          
          return (abs(x-sx)<= diameter && (abs(y-sy)<=diameter));
        }else{
          throw new RuntimeException("What shape is this? "+s.getClass());
        }
      }
    }
  }
  
  void afterCollision(Shape s){
    if (s == null){
      if ((x >= width-diameter/2 || x <= diameter/2) && (y >= height-diameter/2 || y <= diameter/2)){
        theta =  pi+ theta;
      }else if (x >= width-diameter/2 || x <= diameter/2){
        theta  = pi - theta;
      }else if (y >= height-diameter/2 || y <= diameter/2){
        theta = 2*pi - theta;
      }
    }else if (s instanceof Platform){
      float sx = ((Platform)s).x;  
      float sy = ((Platform)s).y;
      float sw = ((Platform)s).p_width;  
      float sh = ((Platform)s).p_height;
      if (abs(x-sx) - (sw+diameter)/2 > abs(y-sy) - (sh+diameter)/2){
        theta  = pi - theta;
      }else if (abs(x-sx) - (sw+diameter)/2 < abs(y-sy) - (sh+diameter)/2){
        theta = 2*pi - theta;
        //theta =  pi+ theta;
      }else{
        //theta =  pi+ theta;
        theta = 2*pi - theta;
      }
    }else if (s instanceof Ball){
      theta  = pi - theta;
      ((Ball)s).theta =pi - ((Ball)s).theta; 
    }
  }
  
  
  
  void draw(){
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(px,py,diameter,diameter);
    stroke(0,0,0);
    fill(100,100,100);  
    ellipse(x,y,diameter,diameter);
  }
  
  String toString(){
    return "ball:x = "+(int)x+" y = "+(int)y+" theta = "+(int)degrees(theta);
  }
}


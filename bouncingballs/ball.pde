import java.lang.RuntimeException;
import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;

class Ball implements Shape{
  Physics physics;
  Body body;
  float diameter = 10;
  float px,py;
  float x,y;
  float v = 10;
  float theta;
  Ball(Physics p,float diameter,float x,float y,float v,float theta){
    this.physics = p;
    this.diameter = diameter;
    this.x = x;
    this.y = y;
    this.v = v;
    this.theta = theta;
    this.body = physics.createCircle(x,y,diameter/2);
    
    Vec2 linVelocity = new Vec2(v*cos(theta),v*sin(theta));
    this.body.setLinearVelocity(linVelocity);
   
  }
  Body getBody(){
    return body;
  }
  
  void next(){
    /*
    px = x;
    py = y;
    
    theta = theta % (2*pi);
    
    
    float dx = cos(theta)*v;
    float dy = sin(theta)*v;
    
    x += dx;
    y += dy;
    */

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
    /*
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(px,py,diameter,diameter);
    stroke(0,0,0);
    fill(100,100,100);  
    ellipse(x,y,diameter,diameter);
    */
    Vec2 pos = physics.worldToScreen(body.getWorldCenter());
    float angle = physics.getAngle(body);
    pushMatrix();
      translate(pos.x,pos.y);
      rotate(-angle);
      stroke(0,0,0);
      fill(100,100,100);  
      ellipse(0,0,diameter,diameter);
    popMatrix();  
    
  }
  
  String toString(){
    return "ball:x = "+(int)x+" y = "+(int)y+" theta = "+(int)degrees(theta);
  }
}


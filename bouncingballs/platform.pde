import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;

class Platform implements Shape{
  
  
  float x,y;
  float px,py;
  
  float p_width;
  float p_height;
  
  float v,theta;
  
  Physics physics;
  Body body;
  Platform (Physics physics,float p_width,float p_height,float x,float y,float v,float theta){
    this.physics = physics;
    this.p_width = p_width;
    this.p_height = p_height;
    this.x = x;
    this.y = y;
    this.v = v;
    this.body = physics.createRect(x-p_width/2,y-p_height/2,x+p_width/2,y+p_height/2);
    
    Vec2 linVelocity = new Vec2(v*cos(theta),v*sin(theta));
    this.body.setLinearVelocity(linVelocity);
    index.put(this.body,this);
  }
  
  Body getBody(){
    return body;
  }
  
  Shape getShapeOfBody(Body b){
    return (Shape)index.get(b);
  }
  
  PFont  f;
  void draw(){
    /*
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
    
    */
    Vec2 pos = physics.worldToScreen(body.getWorldCenter());
    float angle = physics.getAngle(body);
    pushMatrix();
      translate(pos.x,pos.y);
      rotate(-angle);
      rectMode(CENTER);
//      stroke(0,0,0);
//      fill(100,100,100);  
//      rect(0,0,p_width,p_height);
//      stroke(255);
//      strokeWeight(10); 
//      point(0,0);
      strokeWeight(1);
      line(0,0,0,p_height/2);
      line(0,0,p_width/2,0);
      if (f == null){
        f = createFont("Arial",16,true);
      }
      textFont(f,16);        
      textAlign(LEFT);
      text(""+angle,20,20);
      
    popMatrix();
  }
  
  String toString(){
    return "platform:x = "+x+" y = "+y;
  }
}

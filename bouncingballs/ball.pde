class Ball implements Shape{
  
  
  
  Physics physics;
  Body body;
  float diameter = 10;
  float px,py;
  float x,y;
  float v = 10;
  float theta;
  color c;
  Ball(Physics p,color c,float diameter,float x,float y,float v,float theta){
    this.physics = p;
    this.c = c;
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
  
  
  
  
  
  
  
 PFont f; 
 void draw(){
    Vec2 pos = physics.worldToScreen(body.getWorldCenter());
    float angle = physics.getAngle(body);
    pushMatrix();
      translate(pos.x,pos.y);
      rotate(-angle);
      stroke(c);
      fill(c);  
      ellipse(0,0,diameter,diameter);
      stroke(255,255,255);
      strokeWeight(1);
      line(0,-diameter/2,0,diameter/2);
      line(-diameter/2,0,diameter/2,0);
      /*
      if (f == null){
        f = createFont("Arial",16,true);
      }
      textFont(f,16);        
      textAlign(LEFT);
      text(""+degrees(angle),20,20);
      */
    popMatrix();  
    
  }
  
  String toString(){
    return "ball:x = "+(int)x+" y = "+(int)y+" theta = "+(int)degrees(theta);
  }
}


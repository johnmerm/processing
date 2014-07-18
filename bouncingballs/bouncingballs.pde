import java.util.ArrayList;

import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;

float pi = (float)java.lang.Math.PI;

Shape[] shapes;

String str = "";
PFont  f;

Physics physics;
GameHandler handler; 
void setup(){
  size(displayWidth,displayHeight);
  if (frame !=null){
    frame.setResizable(true);
  }
  background(0,0,0);
  
  physics = new Physics(this, width, height, 0, -10, width*2, height*2, width, height, 10);
  physics.setDensity(1.0);
  physics.setFriction(0);
  
  physics.getWorld().setGravity(new Vec2(0,0));
  handler = new Billard(physics);
  
  shapes = handler.getSceneSetup();
  
  
  
  
  f = createFont("Arial",16,true);
}



void checkCollisions(){
  //Check collision of each object against each other & the border
  for (int i=0;i<shapes.length;i++){
    Shape one =  shapes[i];
    if (one.checkCollision(null)){
      one.afterCollision(null);
    }
    
    for (int j=i+1;j<shapes.length;j++){
      //1 will check agaianst 2,3,4,5,6
      //2 will cjeck against 3,4,5,6
      // ...
      Shape other = shapes[j];
      if (one.checkCollision(other)){
        one.afterCollision(other);
      }
    }
  }
}
void draw(){
  /*
  checkCollisions();
  String str = "";
  for (Shape s:shapes){
    s.next();
    
    s.draw();
    */
    
    //Just clear the screen
    rectMode(CENTER);
    fill(0,0,0);
    rect(width/2,height/2,width,height);
    for (Shape s:shapes){
      s.draw();
    }
  }
  


void mousePressed(){
  
  for (Shape s:shapes){
    str += s.toString()+"\n";
  }
  
  fill(255,255,255);
  textFont(f,16);        
  textAlign(LEFT);
  text(str,mouseX,mouseY);
}

void mouseReleased(){
  fill(0,0,0);
  textFont(f,16);        
  textAlign(LEFT);
  text(str,mouseX,mouseY);
  
  str = "";
}



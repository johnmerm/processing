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
void setup(){
  size(640,480);
  background(0,0,0);
  ArrayList a = new ArrayList();
  a.add(new Platform(200,40,width/2,height-50,5));
  for (int i=0;i<2;i++){
    float x = random(100,width-100);
    float y = random(100,height-100);
    float theta =pi/5;
    a.add(new Ball(50,x,y,10,theta));
  }
  shapes = (Shape[])a.toArray(new Shape[a.size()]);
  
  
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
  checkCollisions();
  String str = "";
  for (Shape s:shapes){
    s.next();
    
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



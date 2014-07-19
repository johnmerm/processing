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

Maxim maxim = new Maxim(this);

void setup(){
  //size(displayWidth,displayHeight);
  size(640,480);
  if (frame !=null){
    frame.setResizable(true);
  }
  background(0,0,0);
  
  physics = new Physics(this, width, height, 0, -10, width*2, height*2, width, height, 10);
  
  handler = new Billard(physics);
  
  shapes = handler.getSceneSetup();
  
  
  
  
  f = createFont("Arial",16,true);
}



void draw(){
    //clear the screen
    rectMode(CENTER);
    fill(0,0,0);
    rect(width/2,height/2,width,height);
    //Draw them all
    for (Shape s:shapes){
      s.draw();
    }
  }
  


void mousePressed(){
  handler.mousePressed();  
  
}

void mouseReleased(){
  handler.mouseReleased();
}

void keyPressed(){
  handler.keyPressed();
}



float pi = 3.1415;

Shape[] shapes;

String str = "";
PFont  f;

Physics physics;
GameHandler handler; 

//Minim maxim = new Minim(this);

void setup(){
  size(displayWidth,displayHeight);
  //size(640,480);
  
  
  background(0,0,0);
  
  physics = new Physics(this, width, height, 0, -10, width*2, height*2, width, height, 10);
  physics.setCustomRenderingMethod(this,"renderShapes");
  handler = new Billard(physics);
  
  shapes = handler.getSceneSetup();
  
  
  
  
  f = createFont("Arial",16,true);
}


void renderShapes(World world){
      //Draw them all
    for (Shape s:shapes){
      s.draw();
    }

}

void draw(){
    //clear the screen
    rectMode(CENTER);
    fill(0,0,0);
    rect(width/2,height/2,width,height);
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



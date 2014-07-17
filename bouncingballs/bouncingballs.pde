import java.util.ArrayList;

float pi = (float)java.lang.Math.PI;

Shape[] shapes;

String str = "";
PFont  f;

void setup(){
  size(640,480);
  background(0,0,0);
  ArrayList a = new ArrayList();
  a.add(new Platform(width/2,height-50));
  for (int i=0;i<10;i++){
    float x = random(0,width);
    float y = random(0,height);
    float theta =random(0,2*pi);
    a.add(new Ball(x,y,theta));
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
        other.afterCollision(one);
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



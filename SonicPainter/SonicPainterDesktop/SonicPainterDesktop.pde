//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer player;
AudioPlayer player2;

int brush = 0;
int myHeight;
int smRectWidth;
float theta = 0;
PFont  f;

PImage [] images = new PImage[8];
int currImageIdx = -1;
void setup()
{
  size(640, 480);
  loadPixels();
  
  myHeight = height-60;
  smRectWidth = width/8;
  
  maxim = new Maxim(this);
  player = maxim.loadFile("atmos1.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("bells.wav");
  player2.setLooping(true);
  player.volume(0.25);
  background(0);
  rectMode(CENTER);
  
  f = createFont("Arial",16,true);
  rect(width/2, myHeight/2, width, myHeight);  
  

}

void draw()
{
  noStroke();
  fill(0, 255);
  rect(width/2, height-30, width, 60);
  
  
  for (int i=0;i<8;i++){
    stroke(255,255,255,255);
    strokeWeight(1);
    rect((i+0.5)*smRectWidth,height-30,smRectWidth,60);
    
    if (images[i] !=null){
      image(images[i],i*smRectWidth,myHeight,smRectWidth,60);
    }
  }
}
void clearScreen(){
    noStroke();
    fill(0, 255);
    rect(width/2, myHeight/2, width, myHeight);
}
void keyPressed(){
  if (key>='0' && key <='8'){
    brush = Integer.parseInt(""+key);
    
    //background(0);
    fill(255);
    textFont(f,16);        
    textAlign(LEFT);
    text(""+brush,width/2,height/2);  
  }else if (key=='c'){
    clearScreen();
  }else if (key =='s'){
    currImageIdx = (currImageIdx+1) % 8;
    println("currImageIdx:"+currImageIdx);
    images[currImageIdx] = createImage(width,myHeight,RGB);
    images[currImageIdx].loadPixels();
    loadPixels();
    
    for (int i=0;i<width*myHeight;i++){
      images[currImageIdx].pixels[i] = pixels[i];
    }
    images[currImageIdx].updatePixels();
    updatePixels();
  }
}

void mouseDragged()
{
  if (mouseY<height-60 && pmouseY<height-60 && mouseY>0 && pmouseY>0){
    player.play();
    player2.play();
    float red = map(mouseX, 0, width, 0, 255);
    float blue = map(mouseY, 0, width, 0, 255);
    float green = dist(mouseX,mouseY,width/2,height/2);
    
    float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
    float alpha = map(speed, 0, 20, 0, 10);
    //println(alpha);
    float lineWidth = map(speed, 0, 10, 10, 1);
    lineWidth = constrain(lineWidth, 0, 10);
    
    noStroke();
    fill(0, alpha);
    rect(width/2, height/2-30, width, height-60);
    
    stroke(red, green, blue, 255);
    strokeWeight(lineWidth);
    switch(brush){
      case 0:
        line(pmouseX, pmouseY,mouseX, mouseY);
        break;
      case 1:
        brush1(mouseX, mouseY,speed, speed,lineWidth);
        break;
      case 2:
        brush2(mouseX, mouseY,speed, speed,lineWidth);
        break;
      case 3:
        brush3(mouseX, mouseY,speed, speed,lineWidth);
        break;
      case 4:
        brush4(mouseX, mouseY,speed, speed,lineWidth);
        break;
      case 5:
        brush5(mouseX, mouseY,speed, speed,lineWidth);
        break;
      case 6:
        brush6(mouseX, mouseY,speed, speed,lineWidth);
        break;  
      case 7:
        brush7(mouseX, mouseY,speed, speed,lineWidth);
        break;
      case 8:
        rect(mouseX, mouseY, speed, speed);
        break;
    }
    
  }
  //rect(mouseX, mouseY, speed, speed);
  
  //
  //brush2(mouseX, mouseY,speed, speed,lineWidth);
  //brush3(mouseX, mouseY,speed, speed,lineWidth);
  //brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

  //brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  //brush6(mouseX, mouseY,speed, speed,lineWidth);
  //brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

  player.setFilter((float) mouseY/height*5000,mouseX / width);
  //player2.setFilter((float) mouseY/height*5000,mouseX / width);
  
  player2.ramp(1.,1000);
  player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{
  //println("rel");
  player2.ramp(0.,1000);

        
}
void mouseClicked(){
  if (mouseY>myHeight){
    int frame = mouseX/smRectWidth;
    if (images[frame] != null){
      clearScreen();
      image(images[frame],0,0,width,myHeight);
    }
  }
}



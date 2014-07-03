//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


void brush1(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  ellipse(x,y,px,py); 
  
  return;
}


void brush2(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

void brush3(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  popMatrix();

  return;
}

void brush4(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,myHeight/2+((myHeight/2)-py),x,myHeight/2+((myHeight/2)-y));
  line(width/2+((width/2)-px),myHeight/2+((myHeight/2)-py),width/2+((width/2)-x),myHeight/2+((myHeight/2)-y));
  return;
}

void brush5(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,myHeight/2+((myHeight/2)-py),x,myHeight/2+((myHeight/2)-y));
  line(width/2+((width/2)-px),myHeight/2+((myHeight/2)-py),width/2+((width/2)-x),myHeight/2+((myHeight/2)-y));
  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
  line(myHeight/2-((myHeight/2)-py),width/2-((width/2)-px),myHeight/2-((myHeight/2)-y),width/2-((width/2)-x));
  line(width/2+((width/2)-py),myHeight/2+((myHeight/2)-px),width/2+((width/2)-y),myHeight/2+((myHeight/2)-x));
  line(width/2-((width/2)-py),myHeight/2+((myHeight/2)-px),width/2-((width/2)-y),myHeight/2+((myHeight/2)-x));
  return;
}

void brush6(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  px=px+random(50);
  py=py+random(50);
  ellipse(x,y,px,py);
  ellipse(width/2+((width/2)-x),y,px,py);
  ellipse(x,myHeight/2+((myHeight/2)-y),px,py);
  ellipse(width/2+((width/2)-x),myHeight/2+((myHeight/2)-y),px,py);
  ellipse(width/2+((width/2)-y),width/2-((width/2)-x),px,py);
  ellipse(myHeight/2-((myHeight/2)-y),width/2-((width/2)-x),px,py);
  ellipse(width/2+((width/2)-y),myHeight/2+((myHeight/2)-x),px,py);
  ellipse(width/2-((width/2)-y),myHeight/2+((myHeight/2)-x),px,py);  
  return;
}

void brush7(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  return;
}

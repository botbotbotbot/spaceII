
void a(float x, float y) {
  fill(random(254),random(254),random(254));
  rect(x+20,y+20,x-20,y-20);
}

void b(float x, float y) {
  fill(random(254),random(254),random(254));
  ellipse(x,y,30,30);
}

void c(float x, float y) {
  fill(0);
  stroke(1);
  line(0,0,x,y);
  line(0,height,x,y);
  line(width,0,x,y);
  line(width,height,x,y);
}

void m(float x, float y) {
  fill(255);
  noStroke();
  //bezier(0,0,x,y,random(width),random(height),width,height);
  bezier(0,0,x,y,x+20,y-100,width,height);
 // bezier(endx,endy,40.3,50.2,x,y,startx,starty);
}

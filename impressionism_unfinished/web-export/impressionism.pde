PImage img;

void setup() {
  size(1065,607);
  img = loadImage("colorado.jpg");
}

void draw() {
  background(0);
  image(img,0,0);
}
float eAddSize = 30;

float jStartNum = -350;

int cx = 250;
int cy = 250;
int r = 100;

void a(float x, float y) {
  stroke(random(50), random(50), random(100));
  fill(random(150),random(75,254),random(75,254));
  rect(x+20,y+20,x-20,y-20);
}

void b(float x, float y) {
  float randomNum = random(300);
  stroke(random(50), random(50), random(100), random(50));
  fill(random(100,255),random(150,255),random(100,254), random(100));
  ellipse(x,y,randomNum,randomNum);
}

void c(float x, float y) {
  fill(0);
  stroke(1);
  line(0,0,x,y);
  line(0,height,x,y);
  line(width,0,x,y);
  line(width,height,x,y);
}

void d(float x, float y) {
  noStroke();
  fill(random(50),random(254),random(200));
  triangle(x, y, x - 50, y - random(10), x + random(100), y - 25);
}

void e(float x, float y){
  noFill();
  stroke(random(125,254),random(25),random(100,200));
  if(eAddSize < 900){
    eAddSize = eAddSize + 5;
  }
  else{
    eAddSize = 5;
  }
  ellipse(x + random(50),y + random(10),eAddSize,eAddSize);
}

void f(float x, float y) {
  stroke(random(25),random(120,254),random(255));
  
  float t = millis()/1000.0f * random(200);
  int pointX = (int)(cx+r*sin(t));
  int pointY = (int)(cy+r*sin(t));  
  
 line(pointX, pointY, x, y);
}

void g(float x, float y) {
  for (int i = 0; i < 25; i = i+1) {
    fill(random(200,254),200,random(150,220), random(75));
    stroke(random(100,255),50,random(150,240));
    ellipse(x + random(-75, 75) ,y + random(-75, 75),3,3);
  }
}

void h(float x, float y) {
  for (int i = 0; i < 75; i = i+1) {
    fill(random(5,100),random(150,235),random(10,255), random(50,70));
    noStroke();
    ellipse(x + random(5) ,y + random(-90,90),3,3);
  }
}


void i(float x, float y) {
  noStroke();
  fill(random(150,255),random(50, 150),random(50), random(5, 12));
  quad(x + random(5), y + random(2), x + random(5), y + random(30), x + random(50), y + random(50), x + random(100,200), y + random(100, 200));
}

void j(float x, float y) {
  if(jStartNum < 200){
    jStartNum = jStartNum + random(5);
  }
  else{
    jStartNum = -350;
  }
  for (int i = 0; i < 3; i = i+1) {
    float randNum = random(10);
    stroke(random(200,255),random(200,255),random(200,255), random(50));
    fill(255, 255, 255, random(80));
    ellipse(x + random(-(jStartNum), jStartNum) ,y + random(-(jStartNum), jStartNum),randNum,randNum);
  }
}

void k(float x, float y) {
  color hoverColor = get(int(x),int(y));
  stroke(hoverColor);
  fill(hoverColor);
  rect(x,y,3,100);
}

void l(float x, float y) {
  float r1;
  float r2;
  float linesize = 20;
  stroke(255);
  r1 = random(0,2*PI);
  line(x,y,x+linesize*sin(r1),y+linesize*cos(r1));
  r2 = random(0,1) + r1;
  line(x+linesize*sin(r1),y+linesize*cos(r1),x+linesize*sin(r1)+linesize*sin(r2),y+linesize*cos(r1)+linesize*cos(r2));
}

void m(float x, float y) {
  float r = 100*sin(frameCount/180)+111;
  float b = 100*cos(frameCount/100)+127;
  float g = 100*sin(frameCount/130)+150;
  fill(r,b,g);
  noStroke();
  bezier(0,0,x,y,x+20,y-100,width,height);
}

void n(float x, float y) {
  color hoverColor = get(int(x),int(y));
  stroke(hoverColor);
  fill(hoverColor);
  float r1;
  float r2;
  float linesize = 100;
  strokeWeight(10);
  r1 = random(0,2*PI);
  line(x,y,x+linesize*sin(r1),y+linesize*cos(r1));
  r2 = random(0,1) + r1;
  line(x+linesize*sin(r1),y+linesize*cos(r1),x+linesize*sin(r1)+linesize*sin(r2),y+linesize*cos(r1)+linesize*cos(r2));
}

void o(float x, float y) {
  float r = 100*sin(frameCount/180)+111;
  float b = 100*cos(frameCount/100)+127;
  float g = 100*sin(frameCount/130)+150;
  float offset = random(100,width/2-20);
  fill(r,b,g);
  strokeWeight(5);
  rect(offset,offset,width-2*offset,height-2*offset);
}

void p(float x, float y) {
  float r = 100*sin(frameCount/180)+111;
  float b = 100*cos(frameCount/100)+127;
  float g = 100*sin(frameCount/130)+150;
  float size = random(15,150);
  fill(r,b,g);
  strokeWeight(1);
  for (int i = 0; i < width-1; i = i+1) {
    ellipse(i,y+size*sin(i),5,5);
  }
}

void q(float x, float y) {
  float size = 30;
  noStroke();
//  for (int i = 1; i < width/2-1; i = i+1) {
//    fill(random(5,100),random(150,235),random(10,255), random(50,70));
//    rect(2*i,y,2*i+1,y+size*cos(0.1*(2*i)));
        rect(2,y,3,y+size);
//  }

// Why is the height of the rectangle increasing with y? 
// Shouldn't the height always be size?
}


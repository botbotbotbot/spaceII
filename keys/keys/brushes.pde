float eAddSize = 30;

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



void m(float x, float y) {
  fill(255);
  noStroke();
  //bezier(0,0,x,y,random(width),random(height),width,height);
  bezier(0,0,x,y,x+20,y-100,width,height);
 // bezier(endx,endy,40.3,50.2,x,y,startx,starty);
}

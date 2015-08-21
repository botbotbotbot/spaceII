int stage = 1;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float c1x;
float c1y;
float c1r;
float c2x;
float c2y;
float c2r;

void setup() {
  size(600,600);
  background(60,30,80);
  strokeWeight(3);
  fill(255);
}

void draw() {
  println(stage);
}

void innercircle(float c1x,float c1y,float c1r,float pct,float xdiff,float ydiff) {
  float r = c1r * pct;
  float x = c1x + xdiff;
  float y = c1y + ydiff;
  ellipse(x,y,r,r);
}

void mousePressed() {
  if (stage==1) {
    x1 = mouseX;
    y1 = mouseY;
    stage += 1;
  } else if (stage == 2) {
    x2 = mouseX;
    y2 = mouseY;
    c1x = (x1+x2)/2;
    c1y = (y1+y2)/2;
    c1r = sqrt(pow(abs(x1-x2),2)+pow(abs(y1-y2),2));
    ellipse(c1x,c1y,c1r,c1r);
    stage += 1;
  } else if (stage == 3) {
    x3 = mouseX;
    y3 = mouseY;
    stage += 1;
  } else if (stage == 4) {
    x4 = mouseX;
    y4 = mouseY;
    stage += 1;
    
    c2x = (x3+x4)/2;
    c2y = (y3+y4)/2;
    c2r = sqrt(pow(abs(x3-x4),2)+pow(abs(y3-y4),2));
    
    float pct = c2r/c1r;
    float xdiff = c2x-c1x;
    float ydiff = c2y-c1y;
        
    for (int i=0; i <30; i+=1) {
      innercircle(c1x,c1y,c1r,pct,xdiff,ydiff);
      fill(random(80+i*5,255),random(100+i*5,255),random(70+i*5,254),150);
      strokeWeight(3-0.1*i);
      c1r *= pct;
      c1x += xdiff;
      c1y += ydiff;
      xdiff *= pct;
      ydiff *= pct;
    }
  } else if (stage == 5) {
    stage = 1;
    background(60,30,80);
  }
}






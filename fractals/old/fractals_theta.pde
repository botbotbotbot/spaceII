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
  stroke(3);
  fill(255);
}

void draw() {
  println(stage);
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
    
    float pctR = c1r/c2r;
    float xdist = c1x-c2x;
    float ydist = c1y-c2y;
    
    float add_to_theta = 0;
    if (c1x > c2x) {
      add_to_theta += HALF_PI;
    }
    if (c1y > c2y) {
      add_to_theta += HALF_PI;
    }
    
    float theta = tan(abs(c1y-c2y)/abs(c1x-c2x)) + add_to_theta;
    
    for (int i=0; i <10; i+=1) {
      innercircle(c1x,c1y,c1r,theta,pctR,pctDist);
      x = c1x - xdist*pct;
      y = c1y - ydist*pct;
    }
  }
}

void innercircle(c1x,c1y,c1r,theta,pct,xdist,ydist) {
  float r = c1r*pct;
  float x = 
}




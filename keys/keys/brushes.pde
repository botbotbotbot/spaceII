
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
  line(0,0,x,y);
  line(0,height,x,y);
  line(width,0,x,y);
  line(width,height,x,y);
}

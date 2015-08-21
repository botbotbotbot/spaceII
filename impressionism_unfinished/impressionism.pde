PImage img;

void setup() {
  println("made it jay");
  size(1003,561);
  img = loadImage("colorado.jpg");
}

void draw() {
  background(0);
  image(img,0,0);
}

void mouseDragged() {
  int accel = int(dist(pmouseX,pmouseY,mouseX,mouseY));
  int size = min(accel,1);
//  paint(size,200,200,100,pmouseX,pmouseY,mouseX,mouseY);
}

void mouseClicked() {
  paint(20,200,200,100,50,50,100,100);
}

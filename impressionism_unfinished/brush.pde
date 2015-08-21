
int pixelIndex(int x, int y) { 
  int i = (y-1)*width + x;
  return i;
}

int[] radialMove(int x, int y, float theta, float r) {
  // Give coordinates to move to the end of a line with 
  // initial position (x,y), degree theta, and length r.
  float[] coords = new float[2];
  float dx = r*asin(theta);
  float dy = r*acos(theta);
  if (theta>=3*PI/4) {
    coords[0] = x + dx;
    coords[1] = y - dy;
  }
  else if (theta>=PI/2) {
    coords[0] = x - dx;
    coords[1] = y - dy;
  }
  else if (theta>=PI/4) {
    coords[0] = x - dx;
    coords[1] = y + dy;
  }
  else {
    coords[0] = x + dx;
    coords[1] = y + dy;
  }
  int[] intcoords = new int[2];
  intcoords[0] = int(coords[0]);
  intcoords[1] = int(coords[1]);
  return intcoords;
}

float pickAlpha(float size_ratio, float dist_ratio, float current_alpha) {
  if (current_alpha==0) {
    if ( size_ratio> ( random(0,1)/2 ) ) {
      current_alpha = 1;
    }
  }
  else{
    if (dist_ratio > 0.6) {
      current_alpha = max(0,current_alpha - random(0,0.1));
    }
  }
  return current_alpha;
}

void paint(int size, float r, float g, float b, int startx, int starty, int endx, int endy) {

  int d = int(dist(startx,starty,endx,endy));
  float[][] alpha = new float[size][d];
  println(d);
  for (int i = 0; i < size; i = i+1) {
    float current_alpha = 0;
    float size_ratio = abs(i-float(size)/2)/(float(size)/2);
    for (int j = 0; j < d; j = j+1) {
      float dist_ratio = j/d;
      current_alpha = pickAlpha(size_ratio,dist_ratio,current_alpha);
      alpha[i][j] = current_alpha;
    }
  }
  
  float theta = sin(abs(endx-startx)/d);
  int[] p1 = radialMove(startx,starty,theta,size/2);
  int[] p2 = radialMove(endx,endy,HALF_PI-theta,size/2);
  loadPixels();
  for (int i = 0; i < size; i = i+1) {
    for (int j = 0; j < d; j = j+1) {
      int x = int(p1[0] + (float(j)/d) *(abs(p1[0]-p2[0])));
      int y = int(p1[1] + (float(i)/size) *(abs(p1[1]-p2[1])));
      println(j/d);
      println(i/size);
      int n = pixelIndex(x,y);
      pixels[n] = color(r,b,g,alpha[i][j]);
      println(n);
    }
  }
  updatePixels();
}






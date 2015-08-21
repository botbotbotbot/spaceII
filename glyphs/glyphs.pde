//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer player;
float[] spec = new float[95];
float[] bass;
float[] mids;
float[] high;
float power;
int wait=0;
boolean playit;
int t=0;

float magnify = 200; // This is how big we want the rose to be.
float phase = 0; // Phase Coefficient : this is basically how far round the circle we are going to go
float amp = 0; // Amp Coefficient : this is basically how far from the origin we are.
int elements = 128;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 
float threshold = 0.35;// try increasing this if it jumps around too much


void setup() {
  size(600, 800);
  maxim = new Maxim(this);
  player = maxim.loadFile("fluorescent_adolescent.wav");
  player.setLooping(true);
  player.volume(1.0);
  player.setAnalysing(true);
  background(0);
  frameRate(2);
  //colorMode(HSB);
}

void draw() {

  float power = 0;
  float r = 100;
  noStroke();
  if (playit) {
    background(0);
    fill(random(20,50),random(100,150),random(200,220));
    player.play();
    spec = subset(player.getPowerSpectrum(),0,95);
//    if (t==0){
//      spec = subset(player.getPowerSpectrum(),0,95);
//    }
//    // BEAT DETECTION 
//    power = player.getAveragePower();
//    if (power > threshold && wait<0) {
//      spec = subset(player.getPowerSpectrum(),0,95);
//      wait+=10; 
//    }
//    wait--;
    
    translate(width/2,height/2);
    
    rotate(random(0,2*PI));
    beginShape();
    for (int i=0;i<spec.length;i++) {
      float r_distorted = r+spec[i]*300;
      float theta = 2*(i+1)*PI/spec.length;
      float y = r_distorted*sin(theta); 
      float x = sqrt(pow(r_distorted,2)-pow(y,2));
      if (theta>PI/2 && theta<3*PI/2) {
        x = -x; // +- sqrt adjustment
      }
      curveVertex(x,y);
    }
    float r_distorted = r+spec[0]*300;
    float theta = 2*PI/spec.length;
    float y = r_distorted*sin(theta); 
    float x = sqrt(pow(r_distorted,2)-pow(y,2));
    curveVertex(x,y);
   
    endShape();
  }
  t++;
}

//    bass = subset(spec,0,30);
//    mids = subset(spec,30,30);
//    high = subset(spec,60,30);

void mousePressed() {

  playit = !playit;

  if (playit) {
    t = 0;
    player.play();
  } 
  else {

    player.stop();
  }
}


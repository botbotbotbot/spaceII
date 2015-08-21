//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer player;
float[] spec;
float[] bass;
float[] mids;
float[] high;
float startx;
float starty;
boolean playit;


float magnify = 200; // This is how big we want the rose to be.
float phase = 0; // Phase Coefficient : this is basically how far round the circle we are going to go
float amp = 0; // Amp Coefficient : this is basically how far from the origin we are.
int elements = 128;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 
float threshold = 0.35;// try increasing this if it jumps around too much
int wait=0;


void setup() {
  //The size is iPad Portrait.
  //If you want landscape, you should swap the values.
  // comment out if you are on Android!
  size(600, 800);
  maxim = new Maxim(this);
  player = maxim.loadFile("mybeat.wav");
  player.setLooping(true);
  player.volume(1.0);
  player.setAnalysing(true);
  background(0);
  //colorMode(HSB);
}

void draw() {
  float power = 0;
  float radius = 100;
  stroke(255);
  if (playit) {
    player.play();
    spec = subset(player.getPowerSpectrum(),0,95);
    bass = subset(spec,0,30);
    mids = subset(spec,30,30);
    high = subset(spec,60,30);
    translate(width/2,height/2);
    
    float[] bezierPts;
    for (int i=0;i<spec.length;i++) {
      // Some trig to calculate original curve endpoints.
      // The idea is to draw a circle out of "arcs" made
      // of Bezier curves, these endpoints are eventually 
      // transformed by the sound spectrum.
      float theta = 2*PI/spec.length;
      float d = 2*asin(theta/2); // length of arc 
      float y = d*sin((180-theta)/2); 
      float x = sqrt(1-y*y);
      line(radius,0,radius*x,radius*y);
    }
    bezier(bezierPts);
  }

//    power = player.getAveragePower();
//    //detect a beat
//    if (power > threshold && wait<0) {
//      //println("boom");
//      //a beat was detected. Now we can do something about it
//      //amp+=power; // for example alter the animation
//      phase+=power*10; 
//      wait+=10; //let's wait a bit before we look for another beat
//    }
//    wait--;// counting down...
//  }
//  amp += 0.05;//get the mouse Y coordinate and use it to set the current amp coefficient
//  float spacing = TWO_PI/elements; // this is how far apart each 'node' will be - study it. 
//  translate(width*0.5, height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
//  fill(0, 50);
//  rect(0, 0, width, height);
//  noFill();
//  strokeWeight(2);
//  for (int i = 0; i < elements;i++) {
//    stroke(i*2, 255, 255, 50);
//    pushMatrix();
//    rotate(spacing*i*phase);
//    translate(sin(spacing*amp*i)*magnify, 0);
//    rotate(-(spacing*i*phase));
//    //line(0, i*(power*10)-(width/4),0,i*(power*10)-(height/4));
//    rotate(i);
//    //noStroke();
//    //fill(i*2,255,255,10);
//    //ellipse(0,0,i*(power*10),i*(power*10));
//    line(0, i*(power*10)-200, 0, 0);
//    popMatrix();
//    stroke(255, 0, 0);
//  }
}

void mousePressed() {

  playit = !playit;

  if (playit) {

    player.play();
  } 
  else {

    player.stop();
  }
}


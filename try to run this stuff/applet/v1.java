import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class v1 extends PApplet {

float gapSize = 1;
float steps = 0;
float centerRadius = 50;
float pathWidth = 6;
int expansionSpeed = 3;
ArrayList<Ring> ringList = new ArrayList<Ring>();
float r=127;
float b=128;
float g=128;
float colorsteps = 0;


class Ring{
  float gap;
  float r;
  int onScreen;
  Ring (float tempGap) {
    gap = tempGap;
    r = centerRadius;
    onScreen = 1;
  }
 
  public void grow() {
    r = r + 5;
    arc(width/2,height/2,r,r,0,gap);
    arc(width/2,height/2,r,r,gap+gapSize,TAU);
  }
 
  public void checkScreen() {
    if (r>width) {
      onScreen = 0;
    }
    onScreen = 1;
  }
}
 
public void setup() {
   size(600, 600);
    background(200,200,200);
    stroke(0);
    strokeWeight(1);
    noFill();
}

public void draw() {
    steps = steps + 1;
    if (steps % pathWidth == 1) {
      ringList.add( new Ring( random(0,TAU-gapSize) ) );
      cleanRingList(ringList);
    }
    if (steps % expansionSpeed == 1) {
      background(r,b,g);
      ellipse(width/2,height/2,centerRadius,centerRadius);
      for (Ring xRing : ringList) {
        xRing.grow();
      }
    }
    if (steps % 2 == 1) {
      colorsteps++;
      r = 100*sin(colorsteps/180)+111;
      b = 100*cos(colorsteps/100)+127;
      g = 100*sin(colorsteps/130)+150;
    }
}

public void cleanRingList(ArrayList<Ring> ringList) {
      for (int i = ringList.size()-1; i>=0; i--) {
        ringList.get(i).checkScreen();
        if (ringList.get(i).onScreen == 0) {
          ringList.remove(i);
        }
      }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "v1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

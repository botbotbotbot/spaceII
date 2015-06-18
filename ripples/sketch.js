/*
  Empty example
 */


function preload() {

}
var r;
var g;
var b;

var rippleX1 = -200;
var rippleX2 = -600;

function setup() {

	var cnv = createCanvas(windowWidth, windowHeight);

	r = 50; g = 76; b = 121;

	background(r,g,b);
}

function draw() {
	background(r,g,b,4);


	noStroke();


	if(rippleX2 < width){
		rippleX2++;
		r2 = getR() - 50;
		g2 = getG() + 25;
		b2 = getB() + 30;
	}
	else{
		rippleX2 = -300;
	}

	if(rippleX1 < width){
		rippleX1++;
		r1 = getR();
		g1 = getG();
		b1 = getB();
	}
	else{
		rippleX1 = 0;
	}

	fill(r1, g1, b1, 2);
	thisRect = rect(0, 0, rippleX1, height);

	fill(r2, g2, b2, 6);
	thisRect = rect(0, 0, rippleX2, height);

	var currentTime = millis();

	if(mouseIsPressed){
		makeRipples(1, currentTime)
	}
}

function getR(){
	if(r < 56){
		r++;
		return r;
	}
	else{
		r = 20;
		return r;
	}
}
function getG(){
	if(g < 107){
		g++;
		return g;
	}
	else{
		g = 39;
		return g;
	}
}

function getB(){
	if(b < 195){
		b++;
		return b;
	}
	else{
		b = 71;
		return b;
	}
}


function makeRipples(x, thisTime){

	stroke(255, 255, 255, 80);
	noFill();
	strokeWeight(1);
	/*while(thisTime + 4000 > millis()){
		if(millis()%250 == 0){
			ellipse(mouseX, mouseY, x * 3, x * 3);
			stroke(255, 255, 255, 80 - x);
			x += 20;
		}
	}*/
	for(i=0; i < 10; i++){
		ellipse(mouseX, mouseY, x * 3, x * 3);
		stroke(255, 255, 255, 80 - x);
		x += 20;
	}
}
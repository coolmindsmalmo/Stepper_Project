import processing.serial.*;
import ddf.minim.*;

PImage cmLogo;

Minim minim;

boolean leftButton;
boolean rightButton;

float testBikeVal = 0;
int lastBikeVal = 0;
int bikeValue = 0;

game asteroidEscape;

serialConnection serialConnection;

boolean play = true;

void setup() {
  fullScreen();
  frameRate(60);

  rectMode(CENTER);

  cmLogo = loadImage("CM_Logo.png");
  cmLogo.resize(cmLogo.width/2, cmLogo.height/2);

  minim = new Minim(this);

  serialConnection = new serialConnection();
  
  asteroidEscape = new asteroidEscape();
  //asteroidEscape.music.pause();
}


void draw() {
  //testInput();
  serialConnection.update();
  if (play) {
    asteroidEscape.play();
  } else {
    gameSelectScreen();
  }
}

void gameSelectScreen() {
  background(55);

  imageMode(CORNER);
  image(cmLogo, 30, 30);

  imageMode(CENTER);
  image(asteroidEscape.menuImage, width/2, 500);

  rectMode(CENTER);
  stroke(0);
  strokeWeight(10);
  noFill();
  rect(width/2, 500, 960, 540);
  fill(100, 100, 125);
  rect(width/2, 910, 960, 100);
  rect(width/2, 180, 960, 100);

  fill(0);
  textFont(asteroidEscape.mainFont);
  textSize(56);
  textAlign(CENTER, CENTER);
  text("Trampa upp mätaren för att starta", width/2, 905);
  text("Asteroid Escape", width/2, 175);

  if (lastBikeVal != bikeValue) {
    bikeValue = int(map(bikeValue, 0, 150, 0, 948));
    lastBikeVal = bikeValue;
  }
  bikeValue = constrain(bikeValue, 0, 948);
  strokeWeight(0);
  fill(0, 255, 0);
  rectMode(CORNER);
  rect(486, 866, bikeValue, 88);

  if (lastBikeVal >= 948) {
    play = true;
    asteroidEscape = new asteroidEscape();
  }
}

void testInput() {
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        testBikeVal += 0.8;
        bikeValue = int(testBikeVal);
      }
    }
  } else {
    testBikeVal -= 0.8;    
    bikeValue = int(testBikeVal);
    bikeValue = constrain(bikeValue, 0, 1000);
  } 
}

PApplet getPApplet() {
  return this;
}
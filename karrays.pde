//The MIT License (MIT) - See Licence.txt for details
//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

PImage [] img; //declares an array
int [] imgPosX; // - 
int [] imgPosY; // -
AudioPlayer [] player; // -
boolean on = false; //creates a boolean variable
boolean on2 = false; // - 
boolean on3 = false; // - 
boolean on4 = false; // - 
Maxim maxim; //Maxim variable
PFont f; //declares a font

void setup() {
  size(600, 400); //declares the size of window
  img = new PImage[11]; //declares that there are 11 images
  imgPosX = new int[11];
  imgPosY = new int[11];
  for (int i = 0; i < img.length; i++) //will only count up to 10 images
    img [i] = loadImage("img" + i + ".png"); //images will load accordingly to string
  maxim = new Maxim(this);
  player = new AudioPlayer[3]; //declares that there are 3 files (only used one at this moment however)
  player[0] = maxim.loadFile("player0.wav"); //First .wav file
  // player[1] = maxim.loadFile("player1.wav"); //Second .wav file
  // player[2] = maxim.loadFile("player2.wav"); //Third .wav file
  frameRate(15); //set frameRate low to get a retro feel...kinda
  f = createFont ("Arial", 16, true);
}

void draw() {
  background(#e3c936); //sets background colour to #E3C936

    //TEXT//
  fill(#e49210); 
  textFont(f, 10);
  text("ORANGE = PLAY/STOP", 10, 18);
  fill(#41bdc4);
  textFont(f, 10);
  text("BLUE = PAUSE", 10, 28);
  fill(#c62648);
  textFont(f, 10);
  text("RED = RED STUFF!!!", 10, 38);
  fill(#1056e4);
  textFont(f, 10);
  text("BLUE = BLUE STUFF!!!!", 10, 48);
  //TEXT ENDS//

  //RANDOM LINES//
  if (on && !on4) {
    stroke(#e49210); //sets stroke colour
    strokeWeight(2); //sets size of line
    line(random(130, 470), random(50, 280), random(130, 470), random(50, 280)); //will print line in a random position 
    stroke(#22b512);
    line(random(130, 470), random(50, 280), random(130, 400), random(50, 280));
    stroke(#373b3d);
    strokeWeight(1);
    line(random(130, 470), random(50, 280), random(130, 470), random(50, 280));
  }

  if (on2 && on && !on4) { //setting it to be on2 && !on4 && on means that on2 will only function if "on" is on
    stroke(#c62648);
    strokeWeight(1);
    line(random(1, 600), random(1, 400), random(1, 600), random(1, 400));
    stroke(#c62648);
    line(random(1, 600), random(1, 400), random(1, 400), random(1, 400));
  }

  if (on3 && on && !on4) {
    stroke(#1056e4);
    strokeWeight(1);
    line(random(1, 600), random(1, 400), random(1, 600), random(1, 400));
    stroke(#1056e4);
    line(random(1, 600), random(1, 400), random(1, 400), random(1, 400));
  }
  //IMAGES//
  image(img[0], 0, 0);
  image(img[1], 0, 0);
  image(img[4], 0, 0);
  if (on) {
    image(img[3], 0, 0);
    image(img[6], 0, 0);
  } else {
    image(img[2], 0, 0);
  }
  if (on2) {
    image(img[5], 0, 0);
  } else {
    image(img[8], 0, 0);
  }
  if (on3) {
    image(img[7], 0, 0);
  } else {
    image(img[8], 0, 0);
  }
  if (on4) {
    image(img[10], 0, 0);
  } else {

    image(img[9], 0, 0);
  }
  //IMAGES ENDS//
  if (on && !on4) {
    stroke(#e3c936);
    strokeWeight(2);
    line(random(270, 345), random(160, 180), random(270, 345), random(160, 180));
  }
  //RANDOM LINE ENDS//
}

void mousePressed() {
  if (mouseX < 314 && mouseX > 293 //if mouse is pressed in any of these co-ordinates, the following happens:
  && mouseY < 238 && mouseY > 215) {
    on = !on;
  }
  if (mouseX < 289 && mouseX > 268 
    && mouseY < 238 && mouseY > 215) {
    on2 = !on2;
  }
  if (mouseX < 345 && mouseX > 318 
    && mouseY < 240 && mouseY > 215) {
    on3 = !on3;
  }
  if (mouseX < 314 && mouseX > 293 
    && mouseY < 260 && mouseY > 235) {
    on4 = !on4;
  }
  if (on) { //plays/restarts audio
    player[0].play();
  } else {
    player[0].stop(); //pauses audio
    player[0].cue(1); //restarts audio
  }
  if (on4) { //pauses the audio
    player[0].stop();
  }
}

//END OF CODE//


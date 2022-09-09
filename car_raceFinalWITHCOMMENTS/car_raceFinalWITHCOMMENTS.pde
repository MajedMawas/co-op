


//GLOBAL VARIABLES
/*
-----I USED THE LIBRARY TOOL:
-----Sound 2.3.1 The Processing Foundation

*/
import processing.sound.*;

//win,lose,play,main
String gameState;

//PA = play again .... play again button after losing
int rectPAX = 300;
int rectPAY = 480;
int rectPAWidth = 110;
int rectPAHeight = 55;

//next level 1 -> 2
int rectNext2X = 300;
int rectNext2Y = 400;
int rectNext2Width = 110;
int rectNext2Height = 110;

//close entire game
int rectBX = 160;
int rectBY = 445;
int rectBWidth = 275;
int rectBHeight = 100;

//escape from in game 
int rectBackX = 500;
int rectBackY = 570;
int rectBackWidth = 110;
int rectBackHeight = 55;

//enter the game 
int rect1X = 160;
int rect1Y = 220;
int rect1Width = 275;
int rect1Height = 100;

//car hitbox
int rectCarX = 244;
int rectCarY = 17;
int rectCarW = 40;
int rectCarH = 60;

//time
int time;
int startTime = 0;
int currentTime;
int gameStartTime = 0;

//button shade when hovering over
int rectColorStart =255;
int rectColorExit =255;
int rectColorBack =255;
int rectColorBack2 =255;
int rectColorPA =255;
int rectColorPA2 =255;
int rectColorNext2 =255;

//obstical
float circleX1Lvl1= 0;
float circleX2Lvl1= 400;
float circleX1Lvl2= 0;
float circleX2Lvl2= 400;
float xSpeed1 = 10;
float xSpeed2 = 10;

boolean circleVis;


//music
import processing.sound.*;
SoundFile file;


void setup() {
  size(600, 600);
  gameState = "main";

//music
  file = new SoundFile(this, "gameSong.wav.wav");
  file.play();
  file.amp(.1);
  //this fixed my frames glitch
  frameRate(60);
}

void drawBackButton(int rectBackX, int rectBackY, int rectBackWidth, int rectBackHeight) {
}

void drawCar(int rectCarX, int rectCarY, int rectCarW, int rectCarH) {
  rect(rectCarX, rectCarY, rectCarW, rectCarH);
}
//1st obsticle for level 1
void drawObsticle1Lvl1() {
  // print("Drawing obs");
  ellipse(circleX1Lvl1, 230, 50, 50);



  // bounce off side
  if (circleX1Lvl1 > 600) {
    println("Switching Speed");
    xSpeed1 = -10;
  }
  if (circleX1Lvl1 < 0) {
    println("Switching Speed");
    xSpeed1 = +10;
  }
}
//2nd obsticle for level 1
void drawObsticle2Lvl1() {
  // print("Drawing obs");
  ellipse(circleX2Lvl1, 430, 50, 50);

  // bounce off side
  if (circleX2Lvl1 > 600) {
    println("Switching Speed");
    xSpeed2 = -10;
  }
  if (circleX2Lvl1 < 0) {
    println("Switching Speed");
    xSpeed2 = +10;
  }
}
//1st obsticle for level 2
void drawObsticle1Lvl2() {
  // print("Drawing obs");
  ellipse(circleX1Lvl2, 230, 50, 50);



  // bounce off side
  if (circleX1Lvl2 > 600) {
    println("Switching Speed");
    xSpeed1 = -15;
  }
  if (circleX1Lvl2 < 0) {
    println("Switching Speed");
    xSpeed1 = +15;
  }
}
//2nd obsticle for level 2
void drawObsticle2Lvl2() {
  // print("Drawing obs");
  ellipse(circleX2Lvl2, 430, 50, 50);

  // bounce off side
  if (circleX2Lvl2 > 600) {
    println("Switching Speed");
    xSpeed2 = -15;
  }
  if (circleX2Lvl2 < 0) {
    println("Switching Speed");
    xSpeed2 = +15;
  }
}

void drawResets() {
  drawObsticle1Lvl1();
  drawObsticle1Lvl2();
  circleX1Lvl1 = circleX1Lvl1 + xSpeed1;
  circleX2Lvl1 = circleX2Lvl1 + xSpeed2;
   circleX1Lvl2 = circleX1Lvl2 + xSpeed1;
  circleX2Lvl2 = circleX2Lvl2 + xSpeed2;
  rectCarX = (244);
  rectCarY = (17);
  gameStartTime = millis(); 
  circleX1Lvl1 = 0;
  circleX2Lvl1 = 600;
   circleX1Lvl2 = 0;
  circleX2Lvl2 = 600;
  xSpeed1 = 10;
  xSpeed2 = 10;
}


void draw() {
  println(gameState);
  //println("("+mouseX+", "+mouseY+")");



  currentTime = millis() - gameStartTime;



  /*      if (rectCarY <= 580){
   gameState = "win"; 
   } */


  //run the play action
  if (gameState == "level2") {
    println("entering");
    background(#00FF00);
    fill(255);
    strokeWeight(2);
    fill(rectColorBack);
    rect(500, 570, 110, 55);
    fill(#808080);
    rect(0, 200, 1000, 60);
    fill(#808080);
    rect(0, 400, 1000, 60);
    textSize(20);
    fill(0);
    text("Back", 555, 593);
    drawCar(rectCarX, rectCarY, rectCarW, rectCarH);
    drawObsticle1Lvl2();
    drawObsticle2Lvl2();
    circleX1Lvl2 = circleX1Lvl2 + xSpeed1;
    circleX2Lvl2 = circleX2Lvl2 + xSpeed2;
//resets/win
    if (mouseX > rectBackX && mouseX < rectBackX + rectBackWidth && mouseY > rectBackY && mouseY < rectBackY + rectBackHeight) {
      rectColorBack=200;
    } else {
      rectColorBack = 255;
    }

    if (rectCarY >= 580) {
      gameState = "win";
    }
    if (rectCarY <= 0) {
      drawResets();
      //  println("resetting");
    }
    if (rectCarX <= 0) {
      drawResets();
    }
    if (rectCarX >= 599) {
      drawResets();
    }
    startTime = millis();   
    //Adjust for the later start time by subtracting the gameStartTime
    currentTime = millis() - gameStartTime;

    textSize(29);
    text(currentTime/1000, 50, 50);
        if (dist(rectCarX, rectCarY, circleX1Lvl2, 200) <56) {
      //circleFill = color(255, 0, 0);
      gameState = "lose";
    }
    if (dist(rectCarX, rectCarY, circleX2Lvl2, 430) < 56) {
      //circleFill = color(255, 0, 0);
      gameState = "lose";
    }
     if (currentTime >= 5000) {
      gameState = "lose";
    }
  }



  if (gameState == "main") {
    background(341);
    fill(rectColorStart);
    strokeWeight(4);
    rect(rect1X, rect1Y, rect1Width, rect1Height);
    fill(rectColorExit);
    rect(rectBX, rectBY, rectBWidth, rectBHeight);
    textSize(60);
    fill(0);
    //start/exit buttons
    text("Start!", 300, 290);
    text("Exit", 295, 515);
    fill(255);
    textAlign(CENTER);
    //title
    textSize(55);
    text("Car race! \n finish in under 5 sec!\n \n\nmove with w, a, s & d", 300, 70);
    if (mouseX > rect1X && mouseX < rect1X + rect1Width && mouseY > rect1Y && mouseY < rect1Y + rect1Height) {
      rectColorStart=200;
    } else {
      rectColorStart = 255;
    }
    if (mouseX > rectBX && mouseX < rectBX + rectBWidth && mouseY > rectBY && mouseY < rectBY + rectBHeight) {
      rectColorExit=200;
    } else {
      rectColorExit = 255;
    }
  }

  //play gamestate -- in game buttons
  if (gameState == "play") {
    background(#79CFF0);
    fill(255);
    strokeWeight(2);
    drawBackButton (rectBackX, rectBackY, rectBackWidth, rectBackHeight);
    fill(0);
    //back button and score counter
    text("Back", 555, 593);
    textSize(19);

   


 

    // //reset if hit obsticle
    //if ( rectCarX <=  circleX){
    //   gameState = "lose";
    // }
  }

  //you lost
  if (gameState == "lose") {
    background(152);
    fill(rectColorPA);
    textAlign(CENTER);
    strokeWeight(2);
    rect(300, 480, 110, 55);
    fill(rectColorPA);
    //loss message
    fill(0);
    text("Game Over! \n You Lost! :(", 300, 300);
    //play again button
    text("Play Again!", 355, 515);
    textSize(19);

    if (mouseX > rectPAX && mouseX < rectPAX + rectPAWidth && mouseY > rectPAY && mouseY < rectPAY + rectPAHeight) {
      rectColorPA=200;
    } else {
      rectColorPA = 255;
    }
  }

  //time
  //if (gameState == "lose") {
  //  currentTime = 0000;
  //} 

  //if (gameState == "win") {
  //  currentTime = 0000;
  //} 

  //if (gameState == "play") {
  //  currentTime = 0000;
  //} 


  //run the play action
  if (gameState == "level1") {
    background(#00FF00);
    fill(255);
    strokeWeight(2);
    fill(rectColorBack);
    rect(500, 570, 110, 55);
    fill(#808080);
    rect(0, 200, 1000, 60);
    fill(#808080);
    rect(0, 400, 1000, 60);
    textSize(20);
    fill(0);
    text("Back", 555, 593);
    drawCar(rectCarX, rectCarY, rectCarW, rectCarH);
    drawObsticle1Lvl1();
    drawObsticle2Lvl1();
    circleX1Lvl1 = circleX1Lvl1 + xSpeed1;
    circleX2Lvl1 = circleX2Lvl1 + xSpeed2;

    if (mouseX > rectBackX && mouseX < rectBackX + rectBackWidth && mouseY > rectBackY && mouseY < rectBackY + rectBackHeight) {
      rectColorBack=200;
    } else {
      rectColorBack = 255;
    }

    if (rectCarY >= 580) {
      gameState = "win";
    }
    if (rectCarY <= 0) {
      drawResets();
      //  println("resetting");
    }
    if (rectCarX <= 0) {
      drawResets();
    }
    if (rectCarX >= 599) {
      drawResets();
    }
    startTime = millis();   
    //Adjust for the later start time by subtracting the gameStartTime
    currentTime = millis() - gameStartTime;

    textSize(29);
    text(currentTime/1000, 50, 50);
        if (dist(rectCarX, rectCarY, circleX1Lvl1, 200) <56) {
      //circleFill = color(255, 0, 0);
      gameState = "lose";
    }
    if (dist(rectCarX, rectCarY, circleX2Lvl1, 430) < 56) {
      //circleFill = color(255, 0, 0);
      gameState = "lose";
    }
     if (currentTime >= 5000) {
      gameState = "lose";
    }
  }

  /*if (gameState == "game screen" ) {
   if (currentTime >= 5){
   gameState = "lose";
   }
   }*/

  // up-down-right-left movements
  if (keyPressed == true) {
    if (key == 's' || key == 'S') {
      rectCarY = rectCarY+7;
    }
    if (key == 'a' || key == 'A') {
      rectCarX = rectCarX-7;
    }
    if (key == 'd' || key == 'D') {
      rectCarX = rectCarX+7;
    }
    if (key == 'w' || key == 'W') {
      rectCarY = rectCarY-7;
    }
  }


  //you win
  if (gameState == "win") {

    background(55);
    fill(rectColorPA);
    textAlign(CENTER);
    //   strokeWeight(2);
    fill(rectColorNext2);
    rect(300, 400, 110, 55);
    rect(300, 480, 110, 55);
    fill(rectColorPA);
    fill(0);
    text("You Win!", 300, 300);

    text("Play Again!", 355, 515);
    text("Next level!", 355, 430);
    textSize(19);
rectCarY = 0;

    if (mouseX > rectPAX && mouseX < rectPAX + rectPAWidth && mouseY > rectPAY && mouseY < rectPAY + rectPAHeight) {
      rectColorPA=200;
    } else {
      rectColorPA = 255;
    }
  }
}




//buttons and functions program
void mousePressed() {
  if (mouseButton == LEFT) {
    if (gameState == "main") {

      if (mouseX > rect1X && mouseX < rect1X + rect1Width && mouseY > rect1Y && mouseY < rect1Y + rect1Height) {



        gameStartTime = millis();
        gameState = "level1";
      }
    }
    //Exit Button (exits program)
    if (gameState == "main") {
      if (mouseX > rectBX && mouseX < rectBX + rectBWidth && mouseY > rectBY && mouseY < rectBY + rectBHeight) {
        gameState = "exit";
        exit();
      }
    }
    //Back buttton 
    if (mouseX > rectBackX && mouseX < rectBackX + rectBackWidth && mouseY > rectBackY && mouseY < rectBackY + rectBackHeight) {
      gameState = "main";
    }
    //exit button
    if (mouseX > rectBX && mouseX < rectBX + rectBWidth && mouseY > rectBY && mouseY < rectBY + rectBHeight) {
      gameState = "main";

      //reset car
      rectCarX = (244);
      rectCarY = (17);
    }
  }
  // respawn car
  if (gameState == "level1") {
    drawCar(rectCarX, rectCarY, rectCarW, rectCarH);
    drawObsticle1Lvl1( );
  }
  if (gameState == "level2") {
    drawCar(rectCarX, rectCarY, rectCarW, rectCarH);
    drawObsticle1Lvl2( );
  }
  //play again button 
  else if (gameState == "lose") {
    if (mouseX > rectPAX && mouseX < rectPAX + rectPAWidth && mouseY > rectPAY && mouseY < rectPAY + rectPAHeight) {
      gameStartTime = millis();

      gameState = "main";
    }
  } else if (gameState == "win"); 
  {
    println("mousepressedinsidewin");
    if (mouseX > rectNext2X && mouseX < rectNext2X + rectNext2Width && mouseY > rectNext2Y && mouseY < rectNext2Y + rectNext2Height) {
      println("buttonpressedinsidewin");
      gameStartTime = millis();
xSpeed1 = 20;
      gameState = "level2";
    }
  }
}

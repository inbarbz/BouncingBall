import processing.sound.*;

SoundFile gameOver, ballHit;
boolean gameEnded; 
float diam=30;
float yBall= height/2;
float xBall= width/2;

float Q= radians(60);
float speedX=3;
float speedY=3;

void setup() {
   gameOver = new SoundFile(this, "sadTrombone.mp3");
    ballHit = new SoundFile(this, "ballHit.mp3");
  size (400, 400);
  println("setup");
}

void draw() {
  if (gameEnded){
    background(255,0,0);
  }
  else{
    
    background(159, 64, 240);
  }
  moveBall();
  displayBall();
  racket();
}

void displayBall(){
  fill(255);
  ellipse(xBall, yBall, diam, diam);
}

void moveBall() {
  if (yBall>=height-diam/2 && yBall<=height-diam/2+speedY && xBall>=mouseX  &&xBall<=mouseX+diam*2) {
    speedY= -speedY;
    println("change direction at bottom. speed y= "+speedY);
    ballHit.play();
  }
  if (yBall<=diam/2) {
    speedY= -speedY;
  }
  if(xBall>=width-diam || xBall<=diam){
    speedX= -speedX;
  }
  if(yBall>height && !gameEnded){
    gameOver.play();
    gameEnded= true;
    
  }
  yBall+=speedY*sin(Q);
  xBall+=speedX*cos(Q);
}

void racket() {
  fill(0);
  rect(mouseX, height-diam/2, diam*2, diam/2);
}

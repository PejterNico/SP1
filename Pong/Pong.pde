// Instance variables for the Ball
int ballX;
int ballY;
int ballW;
int ballH;
int ballSpeedX;
int ballSpeedY;

// Instance variables for the left paddle
int paddleXL;
int paddleYL;
color colorL = color(0, 0, 255);
int scoreL = 0;

// Instance variables for the right paddle
int paddleXR;
int paddleYR;
color colorR = color(255, 0, 0);
int scoreR = 0;

// Instance variables for the both paddlse
int paddleW;
int paddleH;
int paddleSpeed;
boolean upL;
boolean upR;
boolean downL;
boolean downR;

// Inctansieted variables for how many points to score to win
int win = 2;

// Inctansieted String array with the players neme 
String[] players = {"Red player", "Blue player"};
  
void setup(){
// Size of the playing field
  size(800,600);
  
  
// Here i have instancierede the ball variables
  ballX=width/2;
  ballY=height/2;
  ballW=25;
  ballH=25;
  ballSpeedX = 5;
  ballSpeedY = 5;

// instancierede the text size and allignemt for the points and playernames
  textSize(50);
  textAlign(CENTER, CENTER);
  
// Here i have instancierede the paddle variables
  rectMode(CENTER);
  paddleXL = 20;
  paddleYL = height/2;
  
  paddleXR = width - 20;
  paddleYR = height/2;
  
  paddleW = 20;
  paddleH = 100;
  paddleSpeed = 5; 
}
// The drawmethod which loops the game over and over
void draw (){
// declared colot
  background(150);

// calling the method drawBall
  drawBall();
// calling the method bounceOffBall
  bounceOffBall();
// calling the method moveBall
  moveBall();
// calling the method drawPaddle
  drawPaddles();
// calling the method movePaddle
  movePaddle();
// calling restricPaddle
  restricPaddle();
// calling ballBounceOffPaddles
  ballBounceOffPaddles();
// calling Scores which displays the scores
  scores();
// calling gameOver method, at the end of the game
  gameOver();
}

// new Method draw ball
void drawBall(){
// fill color of the game ball and then it draws the ball. 
    fill(255);
    ellipse(ballX, ballY, ballW,ballH);
  }

// new Method bounce ball and counts up the score
void bounceOffBall(){

//ball hits the right side   
    if (ballX > width - ballW/2){
      setup();
      ballSpeedX =-ballSpeedX;
      scoreL = scoreL + 1;
      println(players[1] + " Scored!: " + scoreL);
    } 
//ball hits the left side   
    else if (ballX < 0 + ballW/2){
      ballSpeedX =-ballSpeedX;
      setup();
      scoreR = scoreR + 1;
      println(players[0] + " Scored!: " + scoreR);
    }
// if the ball hits the bottom  
    if (ballY > height - ballH/2){
      ballSpeedY =- ballSpeedY;
    } 
// if the ball hits the top  
    else if (ballY < 0 + ballH/2){
      ballSpeedY =-ballSpeedY;
    }
  }
  
// new method move ball
void moveBall(){
    ballX = ballX + ballSpeedX;
    ballY = ballY + ballSpeedY;
  }

// new method drawPaddle
void drawPaddles(){

//draw paddle left  
  fill(colorL);
  rect(paddleXL,paddleYL,paddleW,paddleH);

// draw paddle right
  fill(colorR);
  rect(paddleXR,paddleYR,paddleW,paddleH);
   
}
// method that get the paddles to move
void movePaddle(){
// move left paddle
  if (upL == true){
    paddleYL = paddleYL - paddleSpeed;
  } else if (downL == true){
    paddleYL = paddleYL + paddleSpeed;
  }
// move right paddle
  if (upR == true){
    paddleYR = paddleYR - paddleSpeed;
  } else if (downR == true){
    paddleYR = paddleYR + paddleSpeed;
  } 
}

// new method keypressed, which is a part of the movepaddele method
void keyPressed(){
// control left paddle get it to move
  if (key == 'w' || key == 'W'){
    upL = true;
  }
  else if (key == 's' || key == 'S'){
    downL = true;
  }
  
// control right paddle
  if (keyCode == UP) {
    upR = true;
  }
  else if (keyCode == DOWN) {
    downR = true;
  }
}

void keyReleased(){
// control left paddle stop moving
 if (key == 'w' || key == 'W'){
    upL = false;
  }
  else if (key == 's' || key == 'S'){
    downL = false;
  }
  
// control Right paddle stop moving
 if (keyCode == UP){
    upR = false;
  }
  else if (keyCode == DOWN){
    downR = false;
  }
}
// method that restict the paddles sp that they dont range outside the playing field
void restricPaddle(){
// restrict left paddle 
  if (paddleYL - paddleH/2 < 0){
    paddleYL = paddleYL + paddleSpeed;
  } else if (paddleYL + paddleH/2 > height) {
    paddleYL = paddleYL - paddleSpeed;
  }
// restrict right paddle 
  if (paddleYR - paddleH/2 < 0){
    paddleYR = paddleYR + paddleSpeed;
  } else if (paddleYR + paddleH/2 > height) {
    paddleYR = paddleYR - paddleSpeed;
  }
  
}

// method that makes the ball bounce off the paddeles
void ballBounceOffPaddles(){
// bounce of left
  if (ballX - ballW/2 < paddleXL + paddleW/2 && ballY - ballH/2 < paddleYL + paddleH/2 && ballY - ballH/2 > paddleYL - paddleH/2){
    if (ballSpeedX < 0 ){
      ballSpeedX =- ballSpeedX;
    }
// Bounce off Right
  } if (ballX + ballW/2 > paddleXR - paddleW/2 && ballY - ballH/2 < paddleYR + paddleH/2 && ballY - ballH/2 > paddleYR - paddleH/2){
      if (ballSpeedX > 0){
      ballSpeedX =- ballSpeedX;
      }
  }
}
// method that displays the score bord
void scores(){
//Player blue on the left
  fill(0, 0, 255);
  text(scoreL, 100, 100);
  text(players[1], 120,20);
  
//Player red on the right
  fill(255, 0, 0);
  text(scoreR, 700, 100);
  text(players[0], 680,20);
  
}
// method that defines when the game is over and displays it in the Gameover menu who won
void gameOver(){
  if (scoreL == win){
    gameOverPage("Blue WINS!", colorL);
  }
  else if (scoreR == win){
    gameOverPage("Red WINS!", colorR);
  }
}
// method that displays the gameover menu when one of the player won and then restarts the game 
void gameOverPage(String winner, color c){
  // when the game is over it sets ball speed to 0
  ballSpeedX = 0;
  ballSpeedY = 0;
  // displays texts
  text("GAME OVER", width/2, height/3 - 40);
  fill(c);
  text(winner, width/2, height/3);
  text("Click to restart and play again", width/2, height/3 + 40);
  // restarts the game if pressed, restest scores get the ball to move
  if (mousePressed){
    scoreR = 0;
    scoreL = 0; 
    ballSpeedX = 5;
    ballSpeedY = 5;
  }
}

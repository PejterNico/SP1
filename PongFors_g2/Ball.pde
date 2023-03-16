class Ball {
// Instance variables for the Ball
int ballX;
int ballY;
int ballW;
int ballH;
int ballSpeedX;
int ballSpeedY;

void drawBall(){
 ballX=width/2;
  ballY=height/2;
  ballW=25;
  ballH=25;
  ballSpeedX = 5;
  ballSpeedY = 5;
    fill(255);
    ellipse(ballX, ballY, ballW,ballH);
  }

}

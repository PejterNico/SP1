class Rpaddle{
// Instance variables for the right paddle
int paddleXR;
int paddleYR;
color colorR = color(255, 0, 0);
int scoreR = 0;

// Instance variables for the both paddlse
int paddleW;
int paddleH;
int paddleSpeed;
boolean upR;
boolean downR;



void drawRPaddle(){
  rectMode(CENTER);
  paddleXR = width - 20;
  paddleYR = height/2;
  
  paddleW = 20;
  paddleH = 100;
  paddleSpeed = 5; 
// paddle right
  fill(colorR);
  rect(paddleXR,paddleYR,paddleW,paddleH);  
  }
  
  void moveRPaddle(){
// move right paddle
    if (upR == true){
    paddleYR = paddleYR - paddleSpeed;
    } else if (downR == true){
    paddleYR = paddleYR + paddleSpeed;
    } 
  }
  
  void keyPressed(){
// control right paddle
  if (keyCode == UP) {
    upR = true;
  }
  else if (keyCode == DOWN) {
    downR = true;
  }
}
public int getScoreR(){
      return scoreR;
    }
}

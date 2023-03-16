class Lpaddle{
// Instance variables for the left paddle
int paddleXL;
int paddleYL;
color colorL = color(0, 0, 255);
int scoreL = 0;

// Instance variables for the both paddlse
int paddleW;
int paddleH;
int paddleSpeed;
boolean upL;
boolean downL;


  
    void drawLPaddle(){
    rectMode(CENTER);
    paddleXL = 20;
    paddleYL = height/2;
    paddleW = 20;
    paddleH = 100;
    paddleSpeed = 5;
  // paddle right
    fill(colorL);
    rect(paddleXL,paddleYL,paddleW,paddleH);
     
    }
  
      void moveLPaddle(){
    // move left paddle
      if (upL == true){
        paddleYL = paddleYL - paddleSpeed;
      } else if (downL == true){
        paddleYL = paddleYL + paddleSpeed;
      }
    }

    // new method keypressed
    void keyPressed(){
    // control left paddle get it to move
      if (key == 'w' || key == 'W'){
        upL = true;
      }
      else if (key == 's' || key == 'S'){
        downL = true;
      }
    }
    
    public int getScoreL(){
      return scoreL;
    }
}

void setup(){
// Size of the playing field
  size(800,600);



}


void draw(){
  
  Ball ball = new Ball();
  Lpaddle lp = new Lpaddle();
  Rpaddle rp = new Rpaddle();
  
  ball.drawBall();
  lp.drawLPaddle();
  rp.drawRPaddle();
  
  lp.moveLPaddle();
  rp.moveRPaddle();
  
  lp.keyPressed();
  rp.keyPressed();
  
 
  

}

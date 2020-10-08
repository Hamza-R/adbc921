class PlayerBall
{
  float xPos,yPos;
  float diameter;
  float xSpeed,ySpeed;
  color colour;
  float radius;

  PlayerBall()
  {
    xPos=width/2;
    yPos=height/2;
    diameter = 30;
    colour = color (15,68,252);
    radius = diameter/2;
  }
  
  void draw()
  {
    fill(colour);
    ellipse(xPos,yPos,diameter,diameter);
  }
  
 void keyPressed() {

  if ((key == 'w' )&& (yPos-radius>=0)) {
    yPos =yPos - 5;
  } else if ((key == 's') && (yPos + radius<=height)) {
    yPos =yPos +5;
  } else if ((key == 'a' )&& (xPos-radius >=0)) {
    xPos =xPos-5;
  } else if ((key == 'd') && (xPos+radius <= width)) {
    xPos =xPos+5;
  }
 }
 }

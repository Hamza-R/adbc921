class EnemyBalls
{
  float x,y;
  float balldiameter;
  color ballcolour;
  float dx,dy;
  
  EnemyBalls()
  {
    
    balldiameter = random(5,20);
    x = random(balldiameter, width - balldiameter);
    y = random(balldiameter, height - balldiameter);
    ballcolour = color(255);
      dx = random (-2,2);
      dy = random (-2,2);

  }
  
  void draw()
  {
    noStroke();
    fill(ballcolour);
    ellipse(x,y,balldiameter,balldiameter);
  }
  
  //void changeColour(){
  //ballcolour =color(0,0,255);
  //}
  
  void move()
  {
    x = x+dx;
    y = y+dy;
    if (x <= balldiameter/2) dx = abs(dx);
    if (y <= balldiameter/2) dy = abs(dy);
    if (x >= width-balldiameter/2) dx = -abs(dx);
    if (y >= height-balldiameter/2) dy = -abs(dy);
  }
  
  boolean collisionenemycheck(EnemyBalls anotherEnemy){
    if (dist (x, y, anotherEnemy.x, anotherEnemy.y) <= (balldiameter + anotherEnemy.balldiameter)/2)
    {
      return true;
    }
    return false;      
  }
  
  void enemybounce(EnemyBalls anotherEnemy)
  {
    // Calculate bounce angle of the two balls.
    float collisionAngle = atan2(anotherEnemy.y-y, anotherEnemy.x-x);
    float collisionX = cos(collisionAngle);
    float collisionY = sin(collisionAngle);
    float collisionXTangent = cos(collisionAngle+HALF_PI);
    float collisionYTangent = sin(collisionAngle+HALF_PI);
    float collisionPx = x + balldiameter/2*collisionX;
    float collisionPy = y + balldiameter/2*collisionY;
   
    float v1 = sqrt(dx*dx + dy*dy);
    float v2 = sqrt(anotherEnemy.dx*anotherEnemy.dx+anotherEnemy.dy*anotherEnemy.dy);
   
    float d1 = atan2(dy, dx);
    float d2 = atan2(anotherEnemy.dy, anotherEnemy.dx);
   
    float v1x = v1*cos(d1-collisionAngle);
    float v1y = v1*sin(d1-collisionAngle);
   
    float v2x = v2*cos(d2-collisionAngle);
    float v2y = v2*sin(d2-collisionAngle);
   
    dx = collisionX*v2x + collisionXTangent*v1y;
    dy = collisionY*v2x + collisionYTangent*v1y;
   
    x = collisionPx - 0.5*balldiameter*collisionX;
    y = collisionPy - 0.5*balldiameter*collisionY;
   
    anotherEnemy.dx = collisionX*v1x + collisionXTangent*v2y;
    anotherEnemy.dy = collisionY*v1x + collisionYTangent*v2y;
   
    anotherEnemy.x = collisionPx + 0.5*anotherEnemy.balldiameter*collisionX;
    anotherEnemy.y = collisionPy + 0.5*anotherEnemy.balldiameter*collisionY;
  }
    
  
  
  
  
}

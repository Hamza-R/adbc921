PlayerBall player;
EnemyBalls[] enemy;
int minutes,seconds;
int time_elapsed;
int  gamestatus;

void setup()
{
  size(1000, 1000);
  minutes = 0;
  seconds = 0;
  time_elapsed = frameCount/60;
  gamestatus = 0;

  
  player = new PlayerBall();
  enemy = new EnemyBalls[75];
  for (int i = 0; i<enemy.length; i++)
  {
    enemy[i] = new EnemyBalls();
  }
}



void draw()
{
  background(0);
  if (gamestatus == 0){
     textSize(100);
     text("Hunger",350,500);
     text("Press P To Play",200,600);
  }
  if (gamestatus == 2){
    background(1,1,1);
    textSize(50);
    text("Game Over",350,500);
    text("Press R to play again",250,600);
    text("Press M to return to main menu",125,700);
  }
  else if (gamestatus == 1){
    background(255, 100, 227);
    
    time_elapsed = frameCount/60;
    time_elapsed = time_elapsed + 1;
    
    seconds = time_elapsed/1;
    minutes = time_elapsed/60;
    
    textSize(50);
    text(minutes+ ":" + seconds,20,40);
    
    player.draw();
    player.keyPressed();
  
    for (EnemyBalls enemy : enemy)
    {
      enemy.draw();
    }
    // Check to see if any balls have collided
    for (int i=0; i<enemy.length; i++)
    {
      // Compare each ball with any untested others
      for (int j=i+1; j<enemy.length; j++)
      {
        if (enemy[i].collisionenemycheck(enemy[j]))
        {
          enemy[i].enemybounce(enemy[j]);
        }
      }
    }
  
  
  
    for (EnemyBalls enemy : enemy)
    {
      enemy.move();
    }
  }
  collisioncheck();
}

void keyPressed(){
  if ((key=='p')&&(gamestatus == 0)){
    gamestatus = 1;
  }
  else if ((key =='r')&&(gamestatus ==2)){
    gamestatus = 1;
  }
  else if ((key=='m')&&(gamestatus ==2)){
    gamestatus = 0;
  }
}
  
void collisioncheck()
{

  for(int i = 0; i<enemy.length; i++){

    if((abs(enemy[i].x-player.xPos)<20)&&((abs(enemy[i].y-player.yPos)<20)))
    {
      println("collision"+i);
      //EnemyBalls.remove(enemy);
      //enemy[i]=enemy[i].changeColour;
      
    }
  }
}



  

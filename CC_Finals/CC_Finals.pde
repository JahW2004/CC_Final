int x = 200;
int y = 200;
int score = 0;
float circleX = 400;
float circleY = 200;
float circleX2 = 600;
float circleY2 = 400;
float circleX3 = 500;
float circleY3 = 300;
float xspeed = 3;
boolean game_playing = true;
PImage lambo;
PImage SV;


void setup() {
  background (255);
  size (400, 400);
  imageMode(CENTER);
  lambo = loadImage("lambo.png");
  SV = loadImage("SV.png");
  lambo.resize(100, 100);
  SV.resize(200, 200);
}

void draw() {
  if (game_playing)
  {
    playgame();
  } else
  {
    gameover();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode ==UP) {
      y = y + 50;
    } else if (keyCode == DOWN) {
      y = y - 50;
    } else if (keyCode == LEFT) {
      x = x - 50;
    } else if (keyCode == RIGHT) {
      x = x + 50;
    }
  }
  if (keyPressed)
  {
    if (key == 'r')
    {
      x = 200;
      y = 200;
      circleX = 400;
      circleY = 200;
      circleX2 = 600;
      circleY2 = 400;
      circleX3 = 500;
      circleY3 = 200;
      game_playing = true;
      score = 0;
      
    }
  }
}

void playgame()
{
  background (255);

  //ellipse(circleX3, circleY3, 30, 30);
  circleX3 = circleX3 - xspeed;
  image(SV, circleX3, circleY3, 30, 30);
  if (circleX3 < 0) {
    circleX3 = 400;
    score = score + 1;
    circleY3 = random(0, 400);
  }
  //ellipse(circleX2, circleY2, 30, 30);
  circleX2 = circleX2 - xspeed;
  image(SV, circleX2, circleY2, 30, 30);
  if (circleX2 < 0) {
    circleX2 = 400;
    circleY2 = random(0, 400);
  }
  //ellipse(circleX, circleY, 30, 30);
  circleX = circleX - xspeed;
  image(SV, circleX, circleY, 30, 30);
  if (circleX < 0) {
    circleX = 400;
    circleY = random(0, 400);
  }

  fill (0);
  stroke(255);
  rectMode(CENTER);
  image(lambo, x, y);
  if ( x > width) {
    x = 0;
  }
  if ( x < 0) {
    x = 400;
  }
  if (y > height) {
    y = 0;
  }
  if (y < 0) {
    y = 400;
  }

  float D = dist(circleX, circleY, x, y);
  if (D < 25 + 5)
  {
    background(0);
    game_playing = false;
  }
  float D2 = dist(circleX2, circleY2, x, y);
  if (D2 < 25 + 5)
  {
    background(0);
    game_playing = false;
  }
  float D3 = dist(circleX3, circleY3, x, y);
  if (D3 < 25 + 5)
  {
    background(0);
    game_playing = false;
  }
  textAlign(CENTER);
  textSize(20);
  text("score" + score, width/2, 20);
}
void gameover()
{
  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(20);
  text("Game Over" + score, width/2, 20);
}

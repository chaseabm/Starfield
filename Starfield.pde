NormalParticle [] stars;
void setup()
{
  size(600, 600);
  frameRate(60);
  background(0);
  stars = new NormalParticle[100];
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new NormalParticle();
  }
}
void draw()
{
  fill(0, 0, 0, 75);
  rect(0, 0, 600, 600);
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].show();
    stars[i].move();
    stars[i].approach();
  }
  fill(0);
  ellipse(300, 300, 20, 20);
}
/*class NormalParticle
 {
 //star
 } */
class NormalParticle
{
  double myX, myY, mySpeed, myDir, size;
  
  NormalParticle()
  {
    myDir = (Math.random() * (2*Math.PI));
    mySpeed = (Math.random() * 5) + 5;
    myX = 300;
    myY = 300;
    size = 1;
  }
  void move()
  {
    myX += Math.cos(myDir)*mySpeed;
    myY += Math.sin(myDir)*mySpeed;
    if (myX > 600 || myX < 0)
    {
      myX = 300;
      myY = 300;
      size = 1;
    }
    if (myY > 600 || myY < 0)
    {
      myY = (Math.random() * 25) + 288;
      myX = (Math.random() * 25) + 288;
      size = 1;
    }
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse((float)myX, (float)myY, (float)size, (float)size);
  }
  void approach()
  {
    size += .1;
  }
}

/*
class OddballParticle //uses an interface
 {
 //spaceships
 }
 class JumboParticle //uses inheritance
 {
 //asteroids
 }
 */

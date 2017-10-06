Galaxy [] theGalaxy;
void setup()
{
  size(600, 600);
  frameRate(60);
  background(0);
  theGalaxy = new Galaxy[200];
  for (int i = 0; i < theGalaxy.length; i++)
  {
    theGalaxy[i] = new NormalParticle();
  }
  theGalaxy[0] = new OddballParticle();
  theGalaxy[1]  = new JumboParticle();
}
void draw()
{
  fill(0);
  ellipse(300, 300, 20, 20);
  fill(0, 0, 0, 75);
  rect(0, 0, 600, 600);
  for (int i = 0; i < theGalaxy.length; i++)
  {
    theGalaxy[i].show();
    theGalaxy[i].move();
  }
}

class NormalParticle implements Galaxy
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
  public void move()
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
    size += .1;
  }
  public void show()
  {
    noStroke();
    fill(255);
    ellipse((float)myX, (float)myY, (float)size, (float)size);
  }
}

interface Galaxy
{
  public void move();
  public void show();
}


public class OddballParticle implements Galaxy
{
  double myX = 300;
  double myY = 200;
  int increment = 3;
  public void show()
  {
    //spaceship
    fill(150);
    noStroke();
    ellipse((float)myX, (float)myY, 40, 20);
    fill(150,205,255);
    ellipse((float)myX, (float)myY -9, 25, 20);
    fill(255,0,0);
    ellipse((float)myX - 15, (float)myY, 3, 3);
    ellipse((float)myX + 15, (float)myY, 3, 3);
    ellipse((float)myX - 6, (float)myY + 5, 3, 3);
    ellipse((float)myX + 6, (float)myY + 5, 3, 3);
  }
  public void move()
  {
    myX+=increment;
    if (myX > 400)
      increment = -increment;
    if (myX < 200)
      increment = -increment;
  }
}

public class JumboParticle extends NormalParticle
{
  public void show()
  {
    //red giant
    strokeWeight(2);
    stroke(255, 100, 0);
    fill(75, 0, 0);
    ellipse((float)myX, (float)myY, (float)size, (float)size);
  }
  public void move()
  {
    myX += Math.cos(myDir)*mySpeed;
    myY += Math.sin(myDir)*mySpeed;
    if (myX > 600 || myX < 0)
    {
      myX = 300;
      myY = 300;
      size = 15;
      myDir = (Math.random() * (2*Math.PI));
    }
    if (myY > 600 || myY < 0)
    {
      myY = (Math.random() * 25) + 288;
      myX = (Math.random() * 25) + 288;
      size = 15;
      myDir = (Math.random() * (2*Math.PI));
    }
    size += .5;
  }
}

class Bus
{
  private float x, y;
  private float speed;


  public Bus(float busX, float busY, float busSpeed)
  {
    x = busX;
    y = busY;
    speed = busSpeed;
  }

  public void displayBus()
  {
    noStroke();
    fill(#e6c130);
    rect(x, y, 220, 80);
    //wheels
    fill(50);
    circle(x+20, y+85, 30);
    circle(x+80, y+85, 30);
    circle(x+130, y+85, 30);
    circle(x+200, y+85, 30);
    //windows
    fill(#52bcd1);
    rect(x+20, y+20, 55, 35);
    rect(x+85, y+20, 55, 35);
    rect(x+150, y+20, 55, 35);
  }

  void moveBusLeft()
  {
    x = x - speed;
  }

  void moveBusRight()
  {
    x = x + speed;
  }

  void setToLeft()
  {
    x = 0 - 100;
  }

  void setToRight()
  {
    x = width + 100;
  }

  float getX()
  {
    return x;
  }

  float getY()
  {
    return y;
  }
}

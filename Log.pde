class Log
{
  private float x, y;
  private float speed;


  public Log(float logX, float logY, float logSpeed)
  {
    x = logX;
    y = logY;
    speed = logSpeed;
  }

  public void displayLog()
  {
    fill(#473d30);
    rect(x, y, 100, 40);
  }

  void moveLogLeft()
  {
    x = x - speed;
  }

  void moveLogRight()
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

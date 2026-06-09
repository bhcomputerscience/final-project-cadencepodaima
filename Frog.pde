class Frog
{

  float x, y;
  color fillColour;

  public Frog(float frogX, float frogY, color frogColour)
  {
    x = frogX;
    y = frogY;
    fillColour = frogColour;
  }

  public void displayFrog()
  {
    fill(fillColour);
    rect(x, y, 15, 15);
    square(x - 3, y - 2.5, 6.5);
    square(x - 3, y + 11, 6.5);
    square(x + 11.5, y - 2.5, 6.5);
    square(x + 11, y + 11, 6.5);
    fill(255);
    square(x, y + 1.5, 6);
    square(x + 9, y + 1.5, 6);
    fill(0);
    square(x + 1.5, y + 1.5, 4);
    square(x + 9.5, y + 1.5, 4);
  }

  void jumpForward()
  {
    y = y - 35;
  }

  void moveBackward()
  {
    y = y + 8;
  }

  void moveRight()
  {
    x = x + 8;
  }

  void moveLeft()
  {
    x = x -8;
  }

  void sendToStart()
  {
    x = 210;
    y = 780;
  }

  void setXToLogX(float logX)
  {
    x = logX;
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

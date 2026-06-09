class Turtle
{
  private float x, y;

  public Turtle(float turtleX, float turtleY)
  {
    x = turtleX;
    y = turtleY;
  }

  public void displayTurtle()
  {
    noStroke();
    fill(#68ab63);
    circle(x, y-15, 15);
    //legs
    circle(x-8, y+14, 8);
    circle(x+10, y+14, 8);
    circle(x+14, y-9, 8);
    circle(x-16, y-5, 8);
    fill(#2b3d2a);
    //body
    circle(x, y, 30);
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

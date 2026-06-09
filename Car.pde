class Car
{
  private float x, y;
  private color fillCarColour;
  private float speed;


  public Car(float carX, float carY, int carSpeed, color CarColour)
  {
    x = carX;
    y = carY;
    fillCarColour = CarColour;
    speed = carSpeed;
  }

  public void displayCar()
  {
    noStroke();
    fill(fillCarColour);
    rect(x, y, 120, 50);
    rect(x+20, y-25, 80, 40);
    //windows
    fill(#52bcd1);
    rect(x+25, y-18, 33, 23);
    rect(x+62, y-18, 33, 23);
    //wheels
    fill(50);
    circle(x+25, y+50, 30);
    circle(x+95, y+50, 30);
  }

  void moveCar()
  {
    x = x + speed;
  }

  float getX()
  {
    return x;
  }

  float getY()
  {
    return y;
  }

  void resetX()
  {
    x = 0;
  }
}

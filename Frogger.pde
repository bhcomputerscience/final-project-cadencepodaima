/**
 * This program creates a game where you have to avoid cars and buses
 *Then jump from log to log to cross the river. If you touch the cars you will be sent back to the start
 * @author Cadence Podaima
 * @Sunday June 7th
 */
//Declaring the instances of the frog
Frog f1;
//Declaring the instances of the logs
Log l1;
Log l2;
Log l3;
//Declaring the instances of the Cars
Car c1;
Car c2;
//Declaring the instances of the Bus's
Bus b1;
Bus b2;
//Declaring the instances of the Turtle
Turtle t1;
Turtle t2;
Turtle t3;

//Variables used for the frog
float frogX = 225;
float frogY = 790;
boolean touchingLogOrTurtle; //This boolean keeps track of weather the frog is touching the log
//or turtle so that the frog won't be sent back to the start while on the logs or turtle

//Variables used for the Logs
//Log 1
float logX = 0 ;
float logY= 340;
//Log 2
float logX2 = width;
float logY2 = 390;
//Log 3
float logX3 = 0;
float logY3 = 440;

//Variables used for the Cars
//Car 1
float carX = 0;
float carY = 580;
//Car 2
float carX2 = 0;
float carY2 = 700;

//Variables used for the Buses
//Bus 1
float busX = 0;
float busY = 50;
//Bus 2
float busX2 = width;
float busY2 = 150;


void setup()
{
  size(450, 830);
  //instantiate the instances of Frog
  f1 = new Frog(frogX, frogY, #56bf6f);

  //instantiate the instances of Log
  l1 = new Log(logX, logY, 0.5);
  l2 = new Log(logX2, logY2, 1);
  l3 = new Log(logX3, logY3, 2);
  
  //instantiate the instances of Bus
  b1 = new Bus(busX, busY, 4);
  b2 = new Bus(busX2, busY2, 4);
  
  //instantiate the instances of Car
  c1 = new Car(carX, carY, 3, #eb4034);
  c2 = new Car(carX2, carY2, 4, #a53cb5);
  
  //instantiate the instances of Turtle
  t1 = new Turtle(70, 315);
  t2 = new Turtle(220, 315);
  t3 = new Turtle(370, 315);
}

void draw()
{
  background(#3c733c);

  //Roads
  drawRoad(50, 200, #fcd303);//Road used by Bus's
  drawRoad(550, 220, 255); //Road used by cars

  //River
  noStroke();
  fill(#285ca1);
  rect(0, 290, width, height/4);
  
  //Draw logs on the river
  l1.displayLog(); 
  l1.moveLogRight();
  l2.displayLog();
  l2.moveLogLeft();
  l3.displayLog();
  l3.moveLogRight();

//Check weather the log is going off screen, if it is, send it back to the other side
  float x = l1.getX();
  if (x > width + 100)
  {
    l1.setToLeft();
  }

  float x2 = l2.getX();
  if (x2 < 0 - 100)
  {
    l2.setToRight();
  }

  float x3 = l3.getX();
  if (x3 > width + 100)
  {
    l3.setToLeft();
  }

  //Draw turtles
  t1.displayTurtle();
  t2.displayTurtle();
  t3.displayTurtle();

  //Draw the Frog
  f1.displayFrog();

  //Bushes
  drawBush(50, 20);
  drawBush(225, 20);
  drawBush(355, 20);

  drawBush(50, 265);
  drawBush(225, 265);
  drawBush(355, 265);

  drawBush(70, 525);
  drawBush(230, 510);
  drawBush(365, 520);

  drawBush(325, 800);
  drawBush(90, 800);

//Draw the cars
  c1.displayCar();
  c1.moveCar();
  //If the car is offscreen, send it back to the opposite side
  float cX = c1.getX();
  if (cX > width + 100)
  {
    c1.resetX();
  }

  c2.displayCar();
  c2.moveCar();
  float cX2 = c2.getX();
  if (cX2 > width + 100)
  {
    c2.resetX();
  }

//If the bus is offscreen, send it back to the opposite side
  b1.displayBus();
  b1.moveBusRight();
  float bX = b1.getX();
  if (bX > width + 100)
  {
    b1.setToLeft();
  }

  b2.displayBus();
  b2.moveBusLeft();
  float bX2 = b2.getX();
  if (bX2 < 0 - 100)
  {
    b2.setToRight();
  }

  frogCarCollision(c1);
  frogCarCollision(c2);

  frogBusCollision(b1);
  frogBusCollision(b2);

  touchingLogOrTurtle = false;

  frogLogCollision(l1);
  frogLogCollision(l2);
  frogLogCollision(l3);

  frogTurtleCollision(t1);
  frogTurtleCollision(t2);
  frogTurtleCollision(t3);

  float checkFrogY = f1.getY();
  if ((touchingLogOrTurtle == false)&&((checkFrogY < 290 + height/4)&&(checkFrogY > 290)))
  {
    f1.sendToStart();
  }
}

void keyPressed()
{

  //Move the frog using the arrow keys
  if (keyCode == UP )
  {
    f1.jumpForward();
  } else if ((keyCode == DOWN))
  {
    f1.moveBackward();
  } else if (keyCode == RIGHT)
  {
    f1.moveRight();
  } else if (keyCode == LEFT)
  {
    f1.moveLeft();
  }
}

void drawRoad(float y, float roadSize, color line)
{
  fill(#5b5a5c);
  noStroke();
  rect(0, y, width, roadSize);
  strokeWeight(5);
  stroke(line);
  line(0, y+roadSize/2, width, y+roadSize/2);
  stroke(0);
  strokeWeight(1);
}

void drawBush(float x, float y)
{
  noStroke();
  fill(#1f471d);
  circle(x, y, 20);
  circle(x+15, y, 17);
  circle(x-12, y+3, 18);
  circle(x+9, y+11, 17);
  circle(x-4, y+13, 17);
}

void drawScreen(float x, float y, String message)
{
  fill(255);
  rect(x, y, width, 100);
  fill(0);
  text(message, x, y+20);
}

void frogCarCollision(Car c)
{
  float currentFrogX = f1.getX();
  float currentFrogY = f1.getY();

  float currentCarX = c.getX();
  float currentCarY = c.getY();

  if (((currentFrogX + 15 > currentCarX) && (currentFrogX < currentCarX + 120))&&((currentFrogY + 15 > currentCarY - 25) && (currentFrogY < currentCarY + 50)))
  {
    f1.sendToStart();
  }
}

void frogBusCollision(Bus b)
{
  float currentFrogX = f1.getX();
  float currentFrogY = f1.getY();

  float currentBusX = b.getX();
  float currentBusY = b.getY();

  if (((currentFrogX + 15 > currentBusX) && (currentFrogX < currentBusX + 220))&&((currentFrogY + 15 > currentBusY) && (currentFrogY < currentBusY + 85)))
  {
    f1.sendToStart();
  }
}

void frogLogCollision(Log l)
{
  float currentFrogX = f1.getX();
  float currentFrogY = f1.getY();

  float currentLogX = l.getX();
  float currentLogY = l.getY();

  if (((currentFrogX + 15 > currentLogX)&&(currentFrogX < currentLogX + 100))&& ((currentFrogY + 15 > currentLogY)&&(currentFrogY < currentLogY + 40)))
  {
    touchingLogOrTurtle = true;
    f1.setXToLogX(currentLogX + 50);
  }
}

void frogTurtleCollision(Turtle t)
{
  float currentFrogX = f1.getX();
  float currentFrogY = f1.getY();

  float currentTurtleX = t.getX();
  float currentTurtleY = t.getY();
  if (((currentFrogX + 15 > currentTurtleX - 15 )&&(currentFrogX < currentTurtleX + 30))&&((currentFrogY + 15 > currentTurtleY - 15)&&(currentFrogY < currentTurtleY + 30)))
  {

    touchingLogOrTurtle = true;
  }
}

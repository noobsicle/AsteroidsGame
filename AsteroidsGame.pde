//your variable declarations here
SpaceShip bob;
Star [] joes = new Star[(int)(Math.random()*25) + 25];
Asteroids roids [] = new Asteroids[15];
public void setup() 
{
  //your code here
  size(400, 400);
  background(0); 
  for (int starN = 0; starN < joes.length; starN++) {
    joes[starN] = new Star();
  }
  for (int ast = 0; ast < roids.length; ast++) {
    roids[ast] = new Asteroids();
    roids[ast].setX((int)(Math.random() * 350));
    roids[ast].setY((int)(Math.random() * 350));
  } 
  bob = new SpaceShip();
  bob.getX();
  bob.getY();
}
public void draw() {
  //your code here
  background(0);
  for (int starN = 0; starN < joes.length; starN++) {
    joes[starN].starShow();
  }
  for (int ast = 0; ast < roids.length; ast++) {
    roids[ast].rotate();
    roids[ast].show();
    roids[ast].move();
  }
  bob.show();
  bob.move();
}
public void keyPressed() {
  boolean accel, deccel;
  accel = false;
  deccel = false;
  if (key == 'w') {
    accel = true;
  }
  if (accel == true) {
    bob.accelerate(0.2);
  }
  if (key == 's') {
    deccel = true;
  }
  if (deccel == true) {
    bob.accelerate(-0.2);
  }
  if (key == 'r') {
    bob.setX((int)(Math.random()*350));
    bob.getX();
    bob.setY((int)(Math.random()*350));
    bob.getY();
    bob.accelerate(0);
    bob.setDirectionX(0);
    bob.getDirectionX();
    bob.setDirectionY(0);
    bob.getDirectionY();
    bob.setPointDirection(Math.random()*360);
    bob.getPointDirection();
  }  
 }
class Asteroids extends Floater {
  private int asteroidsRot; 
  Asteroids() {
    corners = 9;
    myColor = 150;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 8;
    xCorners[1] = 8;
    xCorners[2] = 0;
    xCorners[3] = -4;
    xCorners[4] = -11;
    xCorners[5] = -11;
    xCorners[6] = -6;
    xCorners[7] = 8;
    xCorners[8] = 10;
    yCorners[0] = 2;
    yCorners[1] = 10;
    yCorners[2] = 12;
    yCorners[3] = 7;
    yCorners[4] = 4;
    yCorners[5] = -5;
    yCorners[6] = -10;
    yCorners[7] = -7;
    yCorners[8] = -3 ;
    asteroidsRot = (int)(Math.random()*10)-5;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return(int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(double degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void rotate (){
    if(asteroidsRot == 0){
        asteroidsRot = (int)(Math.random()*10)-5;
    }
     myPointDirection+=asteroidsRot;
  }
}
class Star {
  float randPosX, randPosY;
  Star() {
    //    fill(0);
    //   ellipse((float)(Math.random() * 370), (float)(Math.random() * 370), (float)(Math.random() * 20), (float)(Math.random() * 20));
    randPosX = (float)(Math.random() * 370);
    randPosY = (float)(Math.random() * 370);
  }
  public void starShow() {
    noStroke();
    fill(255, 236, 81);
    ellipse(randPosX, randPosY, 5, 5);
  }
}

class SpaceShip extends Floater  
{   
  //your code here
  SpaceShip() {
    corners = 3;
    myColor = 255;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return(int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(double degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }

  public void move() {
    super.move();
    if (keyPressed && key == 'a') {
      bob.rotate(-7);
    }
    if (keyPressed && key == 'd') {
      bob.rotate(7);
    }
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(double degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if (myCenterX > width +20)
    {     
      myCenterX = 0;
    } else if (myCenterX < - 20)
    {     
      myCenterX = width;
    }    
    if (myCenterY > height+20)
    {    
      myCenterY = 0;
    } else if (myCenterY < -20)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 


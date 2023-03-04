//-------------------------------------------------VARIJABLE-------------------------------------------------//
//autic
int carCoordinateX, carCoordinateY;
float carSpeed = 0.2;
boolean firstPosition = true;

//prepreke
int numOfObstacles = 1;
int numOfObstaclesOnScreen = 5;
float[] obstacleCoordinateX = new float[numOfObstaclesOnScreen];
float[] obstacleCoordinateY = new float[numOfObstaclesOnScreen];
float obstacleSpeed = 0.2;


//---------------------------------------------------SLIKE---------------------------------------------------//
PImage carImg;
PImage[] obstacleImages = new PImage[numOfObstacles];

//-------------------------------------------------SETUP-------------------------------------------------//
void setup()
{

  size(550,750);
  
  //ucitavanje slika
  carImg = loadImage("car.png"); 
  carImg.resize(75, 75);
  carCoordinateX = width/2-40;
  carCoordinateY = height-100;
  for(int i=0; i<numOfObstacles; i++){ obstacleImages[i] = loadImage("obstacle" + i + ".png"); }
  
  //trebam li tu postaviti neke pocetne koordinate?
}

void draw()
{
  //pozadina
  background(0,255,0);

  //autic unutar ekrana --TO DO jesu li ove dimenzije dobre u odnosu na autic
  carCoordinateX = constrain(carCoordinateX, 50, width-50);
  carCoordinateY = constrain(carCoordinateY, 75, height-75);
  image(carImg, carCoordinateX, carCoordinateY);
  //crtanje autica --TO DO
  /*if(firstPosition == true){
    image(carImg, width/2, height-100); //TO DO ili -75? - ovisi o sizeu autica
    firstPosition=false;
  }
  else{
    image(carImg, width/2-40, height-100);
  }*/

}


//kretanje autica gore, dolje, lijevo i desno na pritisak tipki
void keyPressed()
{
  if ( keyCode == UP) { carCoordinateY -= 10; } 
  if (keyCode == DOWN) { carCoordinateY += 10; }
  if (keyCode == LEFT) { carCoordinateX -= 5; } 
  if (keyPressed && keyCode == RIGHT) { carCoordinateX += 5; }
}
 

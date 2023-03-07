import processing.sound.*;

//-------------------------------------------------VARIJABLE-------------------------------------------------//
//autic
int carCoordinateX, carCoordinateY;
float carSpeed = 0.2;
boolean firstPosition = true;

//prepreke
int numOfObstacles = 1;
int numOfObstaclesOnScreen = 10;
float[] obstacleCoordinateX = new float[numOfObstaclesOnScreen];
float[] obstacleCoordinateY = new float[numOfObstaclesOnScreen];
//float[] obstacleSize = new float[numOfObstaclesOnScreen];
float obstacleSpeed = 1;


//ostale
int score;


//---------------------------------------------------SLIKE---------------------------------------------------//
PImage carImg;
PImage[] obstacleImages = new PImage[numOfObstacles];

//-------------------------------------------------SETUP-------------------------------------------------//
void setup()
{

  size(550,750);
  
  //ucitavanje SLIKA
  carImg = loadImage("car.png"); 
  carImg.resize(75, 75);
  carCoordinateX = width/2-40;
  carCoordinateY = height-100;
  for(int i=0; i<numOfObstacles; i++)
  { 
    obstacleImages[i] = loadImage("obstacle" + i + ".png"); 
    obstacleImages[i].resize(50, 50);
  }
  
  //INICIJALIZACIJA KOORDINATA PREPREKA
  //trebam li tu postaviti neke pocetne koordinate?
  for(int i=0; i<numOfObstaclesOnScreen; i++)
  { 
    //inicijalizacija slucajnih koordinata na pocetku
      obstacleCoordinateX[i] = random(50, width-50);
      obstacleCoordinateY[i] = random(-500, -100);//random(-500, -100); //po ekranu
      // treba li mi polje obstacle size obstacleSize[i] = int(random(30, 60));
  }
}

void draw()
{
  //pozadina
  background(0,255,0);

  //pomak autica prema gore je automatski
  carCoordinateY -= carSpeed;

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
  
  
  //PREPREKE - koordinate i kretanje te provjera je li se autic sudario
  drawAndCheckObstacles();
  
  // Display the score
  fill(0);
  textSize(20);
  text("Score: " + score, 20, 30);
  
  // Increment the score
  score++;

}


//kretanje autica gore, dolje, lijevo i desno na pritisak tipki
void keyPressed()
{
  if ( keyCode == UP) { carCoordinateY -= 10; } 
  if (keyCode == DOWN) { carCoordinateY += 10; }
  if (keyCode == LEFT) { carCoordinateX -= 35; } 
  if (keyPressed && keyCode == RIGHT) { carCoordinateX += 35; }
}

void gameOver()
{
  noLoop();
  textSize(50);
  text("GAME OVER!", width/2-100, height/2);
} 

void drawAndCheckObstacles()
{
  //prepreke
  for(int i=0; i<numOfObstaclesOnScreen; i++)
  { 
    //inicijalizacija slucajnih koordinata na pocetku
    obstacleCoordinateY[i] += obstacleSpeed;
    if (obstacleCoordinateY[i] > height + 50) { //ovo uzrokuje praznocu na screenu, ne treba ih sve odjednom inicijalizirati 
      obstacleCoordinateX[i] = random(0, width); // ostaviti uvijek mjesta za prolaz autica, staviti ogranicenja na generiranje prepreka, ne smije biti prazne pozadine odjednom jer se sve izgeneriraju
      obstacleCoordinateY[i] = random(-550, -100);//random(-500, -100); //po ekranu
      // treba li mi polje obstacle size obstacleSize[i] = int(random(30, 60));
    }
  }
  
  //crtanje prepreka
  for(int i=0; i<numOfObstaclesOnScreen; i++)
  {
    image(obstacleImages[int(random(0, numOfObstacles)) ], obstacleCoordinateX[i], obstacleCoordinateY[i], 45, 45);
    
    //JE LI GAME OVER?
    if (dist(carCoordinateX, carCoordinateY,  obstacleCoordinateX[i], obstacleCoordinateY[i]) < 45/2 + 25) { //45 je obstacleSize
      gameOver();
    }
  }
}


//TO DO
//HOME - play, settings, exit
//dodati ostale screenove: HOME, NEW GAME, SETTINGS - (sound,..) , EXIT -> klase
//tablica igara
//igrac moze upisati svoje ime prije pocetka igre
//dodati vise prepreka
//pogledati to do u kodu
//igrac moze birati model autica
//levele mozemo mjeriti na osnovu scorea

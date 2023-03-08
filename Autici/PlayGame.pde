class PlayGame
{

  //prepreke
  int numOfObstacles = 1;
  int numOfObstaclesOnScreen = 10;
  float[] obstacleCoordinateX = new float[numOfObstaclesOnScreen];
  float[] obstacleCoordinateY = new float[numOfObstaclesOnScreen];
  //float[] obstacleSize = new float[numOfObstaclesOnScreen];
  float obstacleSpeed = 1;
  
  
  //ostale
  int score;
  //SoundFile gameMusic;
  
  //---------------------------------------------------SLIKE---------------------------------------------------//
  PImage carImg,backgroundImage;
  PImage[] obstacleImages = new PImage[numOfObstacles];
  
  
  //-------------------------------------------------VARIJABLE-------------------------------------------------//
  //autic
  int carCoordinateX, carCoordinateY;
  float carSpeed = 0.2;
  boolean first = true; //za glazbu
  
  PlayGame()
  {
    //ucitavanje SLIKA
    //pozadina
    backgroundImage = loadImage("cesta2.jpg"); 
    backgroundImage.resize(width, height);
    
    //autic
    carImg = loadImage("car.png"); 
    carImg.resize(75, 75);
    carCoordinateX = width/2-40;
    carCoordinateY = height-100;
    
    //prepreke
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

  void drawPlayGame()
  {
    if(first){//gameMusic.play();
  first=false;}
    
    //pozadina
    background(backgroundImage);
  
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
    
    //GUMB za povratak na home i exit - krug u kojem se nalazi strelica
    //BACK
    pushMatrix();
    stroke(0);
    fill(overButton(40, height-40, 60) ? 120 :255);
    strokeWeight(1);
    circle(40, height-40, 60); //krug
    popMatrix();
    drawArrow(55,height-40,30,180); //strelica
    
    //EXIT
    pushMatrix();
    stroke(0);
    fill(overButton(width - 40, height-40, 60) ? 120 :255);
    strokeWeight(1);
    circle(width - 40, height-40, 60); //krug  
    popMatrix();
    
  
  }
  
  //-------------------------------------------------drawAndCheckObstacles-------------------------------------------------//
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
    
   //-------------------------------------------------crtanje back gumba i exit gumba-------------------------------------------------//
  
  //https://forum.processing.org/one/topic/drawing-an-arrow.html
  void drawArrow(int cx, int cy, int len, float angle){
    pushMatrix();
    strokeWeight(10);
    stroke(0);
    translate(cx, cy);
    rotate(radians(angle));
    line(0,0,len, 0);
    line(len, 0, len - 8, -8);
    line(len, 0, len - 8, 8);
    popMatrix();
  }
  


  //-------------------------------------------------keyPressed-------------------------------------------------//
  //kretanje autica gore, dolje, lijevo i desno na pritisak tipki
  void keyPressed()
  {
    if ( keyCode == UP) { carCoordinateY -= 10; } 
    if (keyCode == DOWN) { carCoordinateY += 10; }
    if (keyCode == LEFT) { carCoordinateX -= 35; } 
    if (keyPressed && keyCode == RIGHT) { carCoordinateX += 35; }
        
  }
  
  void mousePressed()
  {
    //circle(40, height-40, 60);
    if(overButton(40, height-40, 60) == true) //gumb za back
    { 
      //MUSIC gameMusic.stop();
      isHome = true;
      isPlayGame = false;
      playGame = new PlayGame();
    }
    else if(overButton(width - 40, height-40, 60) == true) { exit(); }
  
  }

}

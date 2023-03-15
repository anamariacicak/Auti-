class PlayGame
{

  //prepreke
  int numOfObstacles = 1;
  int numOfObstaclesOnScreen = 8;
  float[] obstacleCoordinateX = new float[numOfObstaclesOnScreen];
  float[] obstacleCoordinateY = new float[numOfObstaclesOnScreen];
  //float[] obstacleSize = new float[numOfObstaclesOnScreen];
  float obstacleSpeed;
  
  PImage carImg, roadImage;
  PImage[] obstacleImages = new PImage[numOfObstacles];
  
  //autic
  int carCoordinateX, carCoordinateY;
  float carSpeed;
  boolean flagMusic; //za glazbu
  long startTime ;
  
  PlayGame()
  {
    //pocetak igre
    playerName = "player";
    score=0;
    
    //glazba
    flagMusic = true;
    
    //pozadina
    roadImage = loadImage("cesta2.jpg"); 
    roadImage.resize(width, height);
    
    //autic
    carSpeed = 0.2; 
    carImg = loadImage("car" + idOdabirAutica +".png"); 
    carImg.resize(75, 75);
    carCoordinateX = width/2 - 40; //pocetna koordinata autica (carCoordinateX, carCoordinateY)
    carCoordinateY = height - 100;
    
    //prepreke
    obstacleSpeed = 1; 
    
    for(int i=0; i<numOfObstacles; i++) //ucitavanje svih slika prepreka
    { 
      obstacleImages[i] = loadImage("obstacle" + i + ".png"); 
      obstacleImages[i].resize(45, 45);
    }
    
    //INICIJALIZACIJA KOORDINATA PREPREKA
    for(int i=0; i<numOfObstaclesOnScreen; i++)
    { 
      //inicijalizacija slucajnih koordinata na pocetku
        obstacleCoordinateX[i] = random(135, width - 135);
        obstacleCoordinateY[i] = random(-500, -100);//kao bi se prepreke pojavljivale na ekranu ispred autica, ako povecamo ovaj broj prepreke bi se mogle pojaviti prenisko
    }
    
    
  
  }


  //-------------------------------------------------drawPlayGame-------------------------------------------------//
  void drawPlayGame()
  {
    
    //millis();
    if(flagMusic == true && musicOn == true){
      flagMusic = false;
      playGameMusic.loop();
    }
    
    //pozadina
    background(roadImage);
  
    //pomak autica prema gore je automatski
    carCoordinateY -= carSpeed;
  
    //autic unutar ekrana 
    carCoordinateX = constrain(carCoordinateX, 50, width - 140); //sirina ceste sa strane je 150?
    carCoordinateY = constrain(carCoordinateY, 75, height - 75);
    image(carImg, carCoordinateX, carCoordinateY);
    
      
    //PREPREKE - koordinate i kretanje te provjera je li se autic sudario
    //prepreke
    drawAndCheckObstacles();
    
    // bodovi
    fill(0);
    textSize(20);
    text("Score: " + round(score), 70, 30);
    
    
    score++;
   
    //GUMB za povratak na home i exit 
    drawBackButton();
    drawExitButton();
  
  }
  
  
  //-------------------------------------------------drawAndCheckObstacles-------------------------------------------------//
  void drawAndCheckObstacles()
  {
    //prepreke
    for(int i=0; i<numOfObstaclesOnScreen; i++)
    { 
      //inicijalizacija slucajnih koordinata na pocetku
      obstacleCoordinateY[i] += obstacleSpeed;
      if (obstacleCoordinateY[i] > height + 50){ 
        obstacleCoordinateX[i] = random(135, width - 135); // ostaviti uvijek mjesta za prolaz autica, staviti ogranicenja na generiranje prepreka, ne smije biti prazne pozadine odjednom jer se sve izgeneriraju
        obstacleCoordinateY[i] = random(-500, -100);
      }
    }
    
    //crtanje prepreka - odaberi dva random broja i njih nacrtaj
    for(int i=0; i<numOfObstaclesOnScreen; i++) //
    {
      image(obstacleImages[int(random(0, numOfObstacles)) ], obstacleCoordinateX[i], obstacleCoordinateY[i], 45, 45); //ovo uzrokuje praznocu na screenu, ne treba ih sve odjednom inicijalizirati 
      //JE LI GAME OVER?
      if(dist(carCoordinateX + 75/2, carCoordinateY +75/2, obstacleCoordinateX[i]+45/2, obstacleCoordinateY[i]+45/2)<sqrt(sq(45)+sq(45))/2 + 15){  //dodir dviju kruznica - modificiran s obzirom koliko blizinu autica dopustamo
        
        background(255);
        isPlayGame = false;
        playGameMusic.stop();
        isGameOver = true;
        gameOver = new GameOver();
        
      }
    }
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
    if(overCircleButton(40, height - 40, 60) == true) //gumb za back
    { 
      playGameMusic.stop();
      isPlayGame = false;
      playGame = new PlayGame();
      isHome = true;
      home = new Home();
    }
    else if(overCircleButton(width - 40, 40, 60) == true) { exit(); }
  }


}

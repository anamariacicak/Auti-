class PlayGame
{

  //prepreke
  int numOfObstacles = 1;
  int numOfObstaclesOnScreen = 8;
  float[] obstacleCoordinateX = new float[numOfObstaclesOnScreen];
  float[] obstacleCoordinateY = new float[numOfObstaclesOnScreen];
  //float[] obstacleSize = new float[numOfObstaclesOnScreen];
  float obstacleSpeed;
  
  
  //---------------------------------------------------SLIKE---------------------------------------------------//
  PImage carImg, backgroundImage;
  PImage[] obstacleImages = new PImage[numOfObstacles];
  
  
  //-------------------------------------------------VARIJABLE-------------------------------------------------//
  //autic
  int carCoordinateX, carCoordinateY;
  float carSpeed;
  boolean playMusic; //za glazbu
  
  PlayGame()
  {
    //pocetak igre
    score=0;
    
    //glazba
    playMusic = true;
    
    //pozadina
    backgroundImage = loadImage("cesta2.jpg"); 
    backgroundImage.resize(width, height);
    
    //autic
    carSpeed = 0.2; //TO DO brzina se mijenja u odnosu na vrijeme
    carImg = loadImage("car" + idOdabirAutica +".png"); 
    carImg.resize(75, 75);
    carCoordinateX = width/2 - 40; //pocetna koordinata autica (carCoordinateX, carCoordinateY)
    carCoordinateY = height - 100;
    
    //prepreke
    obstacleSpeed = 1; //TO DO brzina se mijenja u odnosu na vrijeme
    
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
        // treba li mi polje obstacle size obstacleSize[i] = int(random(30, 60));
    }
    
    
  
  }


  //-------------------------------------------------drawPlayGame-------------------------------------------------//
  void drawPlayGame()
  {
    
    
    if(playMusic){//gameMusic.play();
      playMusic=false;
    }
    
    //pozadina
    background(backgroundImage);
  
    //pomak autica prema gore je automatski
    carCoordinateY -= carSpeed;
  
    //autic unutar ekrana --TO DO jesu li ove dimenzije dobre u odnosu na autic
    carCoordinateX = constrain(carCoordinateX, 50, width - 140); //sirina ceste sa strane je 150?
    carCoordinateY = constrain(carCoordinateY, 75, height -75);
    image(carImg, carCoordinateX, carCoordinateY);
    
      
    //PREPREKE - koordinate i kretanje te provjera je li se autic sudario
    //prepreke
    obstacleSpeed += 0.00000000000000000000000001; //TO DO brzina se mijenja u odnosu na vrijeme
    drawAndCheckObstacles();
    
    // Display the score
    fill(0);
    textSize(20);
    text("Score: " + score, 70, 30);
    
    // TO DO mijenja se u odnosu na vrijeme
    score++;
    
    //GUMB za povratak na home i exit 
    drawBackAndExitButtons();
  
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
        //TO DO obstacleSize[i] = int(random(30, 60));
      }
    }
    
    //crtanje prepreka - odaberi dva random broja i njih nacrtaj
    for(int i=0; i<numOfObstaclesOnScreen; i++) //
    {
      image(obstacleImages[int(random(0, numOfObstacles)) ], obstacleCoordinateX[i], obstacleCoordinateY[i], 45, 45); //ovo uzrokuje praznocu na screenu, ne treba ih sve odjednom inicijalizirati 
      
      //JE LI GAME OVER?
      if (dist(carCoordinateX, carCoordinateY,  obstacleCoordinateX[i], obstacleCoordinateY[i]) < 45/2 + 25) { //45 je obstacleSize
        isGameOver = true;
        isPlayGame = false;
        
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
    if(overCircleButton(40, height-40, 60) == true) //gumb za back
    { 
      //MUSIC gameMusic.stop();
      isHome = true;
      isPlayGame = false;
      playGame = new PlayGame();
    }
    else if(overCircleButton(width - 40, height-40, 60) == true) { exit(); }
  }


}

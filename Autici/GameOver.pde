class GameOver
{

  int x, y;
  String[] labelsForButtons = new String[3];
  boolean writeLeaderBoard;

  GameOver()
  {
    writeLeaderBoard = true; //zbog fje draw
    
    y = width/3;
    x = (width - y + 150) /3;
    
    
    labelsForButtons[0] = "Play Again";
    labelsForButtons[1] = "Home";
    labelsForButtons[2] = "Exit";
    
  }


  void drawGameOver() //screen koji se prikazuje kada je igra gotova
  {
    
    gameOver(); //sto sve treba odraditi u pozadini - > nova igra, zapis u leaderboard, prekid glazbe
    
   
    //dva gumba - > play again, home, i exit   //TO DO da unese ime za leaderboard i modifikacija leadboarda, play again, dolje standarno dva kruga
    drawButtons(labelsForButtons, x, y);  
  
  }
  
  
  void gameOver()
  {
    
    //noLoop();
    background(255);
    textSize(50);
    textAlign(CENTER, TOP);
    fill(0);
    text("GAME OVER!", width/2, height - 650);
    
    //TO DO dodati polje za ime i potvrdu spremanja hs
    //zapis leaderboard
    if(writeLeaderBoard==true){
      leaderBoardTxt(); 
      writeLeaderBoard=false;
    }//spremanje zapisa
  
    //prilikom gameovera treba inicijalizirati novu igru    
    playGame = new PlayGame();

    
    //gameOver.drawGameOver();
    //gameMusic.stop(); //MUSIC
    

  }
  
  
  //gumb je pritisnut na ekranu GameOver
  void mousePressed()
  {
    boolean mouseXCoordinate =  mouseX >= x && mouseX <= x + buttonWidth;
    if(mouseXCoordinate && mouseY >= y + 0*spaceBetweenButtons && mouseY <= y + buttonHeight + 0*spaceBetweenButtons) { 
      isPlayGame = true; isGameOver=false; gameOver = new GameOver(); //zbog zapisa u leadboard.txt i inicijalizacije ponovne var leadboard u true
    } //play again
    else if(mouseXCoordinate && mouseY >= y + 1*spaceBetweenButtons && mouseY <= y + buttonHeight + 1*spaceBetweenButtons) { isHome = true; isGameOver=false; gameOver = new GameOver(); } //home
    else if(mouseXCoordinate && mouseY >= y + 2*spaceBetweenButtons && mouseY <= y + buttonHeight + 3*spaceBetweenButtons) { exit(); } //exit
  
  }

}

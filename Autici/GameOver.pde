class GameOver
{
  
  int x, y;
  String[] labelsForButtons = new String[2]; //2 buttona 
  
  boolean flagMusic;
  
  GameOver()
  {
    
    y = width/3;
    x = (width - y + 150) /3;
    
    flagMusic = true;
    
    labelsForButtons[0] = "Nova igra";
    labelsForButtons[1] = "Izbornik";
     
  }


  void drawGameOver() //screen koji se prikazuje kada je igra gotova
  {
    
    if(flagMusic == true && musicOn == true){
      flagMusic = false;
      backgroundMusic.loop();
    }
    
    //sto sve treba odraditi u pozadini - > nova igra, zapis u leaderboard, prekid glazbe,...
    //score=round(score);
    background(255);
    backgroundImage.resize(550,750);
    background(backgroundImage);
    textSize(50);
    textAlign(CENTER, TOP);
    fill(#0000FF);
    text("GAME OVER!", width/2, height - 650);
    
    //textbox
    drawButton(playerName, x,  y,  buttonWidth, false);
    
    //dva gumba - > play again, home, i exit   
    drawButtons(labelsForButtons, x, y+spaceBetweenButtons); 
    drawExitButton();

  }
  
  
  void keyPressed()
  {
    if (key >= 'A' && key <= 'Z' || key >= 'a' && key <= 'z' || key == ' ' || key == BACKSPACE) { 
      if (textWidth(playerName) < buttonWidth - 70 && key != BACKSPACE) { // stane li tekst u textbox
        playerName += key; // dodaj u ime
      }
      else if (key == BACKSPACE && playerName.length() > 0) { // ako je pritisnut backspace i nije prazno
        playerName = playerName.substring(0, playerName.length()-1);
      }
    }
  
  
  }
  
  //gumb je pritisnut na ekranu GameOver
  void mousePressed()
  {
    
    boolean mouseXCoordinate =  mouseX >= x && mouseX <= x + buttonWidth;
    if(mouseXCoordinate && mouseY >= y + 1*spaceBetweenButtons && mouseY <= y + buttonHeight + 1*spaceBetweenButtons) //Nova igra
    { 
      //zapis leaderboar
      leaderBoardTxt();
      
      backgroundMusic.stop();
      isPlayGame = true; //prilikom gameovera treba inicijalizirati novu igru    
      playGame = new PlayGame();
      isGameOver = false; 
    } 
    
    else if(mouseXCoordinate && mouseY >= y + 2*spaceBetweenButtons && mouseY <= y + buttonHeight + 2*spaceBetweenButtons) //Izbornik
    { 
      //zapis leaderboard
      leaderBoardTxt(); 
       
      isHome = true;   
      isGameOver=false;    
    } 
    
    else if(overCircleButton(width - 40, 40, 60) == true) { //exit //TO DO nije potreban writeOnLeaderBoard- jedino kasnije ako cemo omoguciti ok
      //zapis leaderboard
      leaderBoardTxt(); 
      exit(); 
    } 
  
  }

}

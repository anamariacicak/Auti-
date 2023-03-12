class Home
{

  int x, y;
  String[] labelsForButtons = new String[4];
  
  boolean flagMusic;

  Home()
  {
    
    y = width/3;
    x = (width - y + 150) /3;
    
    flagMusic = true;
    
    labelsForButtons[0] = "Nova igra";
    labelsForButtons[1] = "Postavke";
    labelsForButtons[2] = "Poredak";
    labelsForButtons[3] = "Izlaz";
    

  }
  
  void drawHome()
  {

    backgroundImage.resize(550,750);
    background(backgroundImage);
    
    if(flagMusic == true && musicOn == true){
      flagMusic = false;
      backgroundMusic.loop();
    }
    
    fill(#0000FF);
    textSize(50);
    textAlign(CENTER);
    text("Autici", width/2-10, 150);
    
    drawButtons(labelsForButtons, x, y);
     
  }
  
  
  //gumb je pritisnut na ekranu Home
  void mousePressed()
  {
    boolean mouseXCoordinate =  mouseX >= x && mouseX <= x + buttonWidth;
    if(mouseXCoordinate && mouseY >= y + 0*spaceBetweenButtons && mouseY <= y + buttonHeight + 0*spaceBetweenButtons) { //Nova igra
      backgroundMusic.stop(); 
      isHome=false; 
      isPlayGame = true; 
      playGame = new PlayGame();
      
    } 
    else if(mouseXCoordinate && mouseY >= y + 1*spaceBetweenButtons && mouseY <= y + buttonHeight + 1*spaceBetweenButtons) { isSettings = true; isHome=false; } //settings
    else if(mouseXCoordinate && mouseY >= y + 2*spaceBetweenButtons && mouseY <= y + buttonHeight + 2*spaceBetweenButtons) { isLeaderBoard = true; isHome=false;} //leaderboard
    else if(mouseXCoordinate && mouseY >= y + 3*spaceBetweenButtons && mouseY <= y + buttonHeight + 3*spaceBetweenButtons) { exit(); } //exit
  
  }
  
}

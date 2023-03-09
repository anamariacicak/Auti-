class Home
{

  int x, y;
  //int buttonWidth, buttonHeight, spaceBetweenButtons;
  String[] labelsForButtons = new String[4];

  Home()
  {
    
    y = width/3;
    x = (width - y + 150) /3;
    
    /*buttonHeight=50;
    buttonWidth = y;
    spaceBetweenButtons = 80;*/
    
    labelsForButtons[0] = "Play";
    labelsForButtons[1] = "Settings";
    labelsForButtons[2] = "Leaderboard";
    labelsForButtons[3] = "Exit";
    
    
    
    
  }
  
  void drawHome()
  {

    backgroundImage.resize(550,750);
    background(backgroundImage);
    
    fill(#0000FF);
    textSize(50);
    textAlign(CENTER);
    text("Cars", width/2-10, 150);
    
    drawButtons(labelsForButtons, x, y);
    
   
    //gameMusic.stop();
  
  }
  
  
  //gumb je pritisnut na ekranu Home
  void mousePressed()
  {
    boolean mouseXCoordinate =  mouseX >= x && mouseX <= x + buttonWidth;
    if(mouseXCoordinate && mouseY >= y + 0*spaceBetweenButtons && mouseY <= y + buttonHeight + 0*spaceBetweenButtons) { isPlayGame = true; isHome=false; } //ako je nula onda je prvi gumb
    else if(mouseXCoordinate && mouseY >= y + 1*spaceBetweenButtons && mouseY <= y + buttonHeight + 1*spaceBetweenButtons) { isSettings = true; isHome=false; } //settings
    else if(mouseXCoordinate && mouseY >= y + 2*spaceBetweenButtons && mouseY <= y + buttonHeight + 2*spaceBetweenButtons) { isLeaderBoard = true; isHome=false;} //leaderboard
    else if(mouseXCoordinate && mouseY >= y + 3*spaceBetweenButtons && mouseY <= y + buttonHeight + 3*spaceBetweenButtons) { exit(); } //exit
  
  }
  
}

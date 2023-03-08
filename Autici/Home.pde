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
  
    pushMatrix();
    background(255);
    drawButtons(labelsForButtons, x, y);
    popMatrix();
   
    //gameMusic.stop();
  
  }
  
  
  //gumb je pritisnut na ekranu Home
  void mousePressed()
  {
    boolean mouseXCoordinate =  mouseX >= x && mouseX <= x + buttonWidth;
    if(mouseXCoordinate && mouseY >= y + 0*spaceBetweenButtons && mouseY <= y + buttonHeight + 0*spaceBetweenButtons) { isPlayGame = true; isHome=false; } //ako je nula onda je prvi gumb
    else if(mouseXCoordinate && mouseY >= y + 1*spaceBetweenButtons && mouseY <= y + buttonHeight + 1*spaceBetweenButtons) { isPlayGame = true; isHome=false; } //settings
    else if(mouseXCoordinate && mouseY >= y + 2*spaceBetweenButtons && mouseY <= y + buttonHeight + 2*spaceBetweenButtons) { isPlayGame = true; isHome=false;} //leaderboard
    else if(mouseXCoordinate && mouseY >= y + 3*spaceBetweenButtons && mouseY <= y + buttonHeight + 3*spaceBetweenButtons) { exit(); } //exit
  
  }
  
}

class Home
{

  int x, y;
  int buttonWidth, buttonHeight, spaceBetweenButtons;
  String[] labelsForButtons = new String[4];

  Home()
  {
    
    x = (width - buttonWidth) /3;
    y = width/3;
    
    buttonHeight=50;
    buttonWidth = y;
    spaceBetweenButtons = 80;
    
    labelsForButtons[0] = "Play";
    labelsForButtons[1] = "Settings";
    labelsForButtons[2] = "Leaderboard";
    labelsForButtons[3] = "Exit";
    //["Play", "Settings", "Leaderboard", "Exit"];
    
    textAlign(CENTER, CENTER);
    textSize(24);
    
    
  }
  
  void drawHome()
  {
  
    pushMatrix();
    background(255);
    drawButton(labelsForButtons, x, y);
    popMatrix();
   
    //gameMusic.stop();
  
  }
  
  void drawButton(String[] labelsForButtons, int x, int y)
  {

    for(int i=0; i<labelsForButtons.length; i++)
    {
      pushMatrix();
      strokeWeight(0);
      boolean mouseOver = mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y + i*spaceBetweenButtons && mouseY <= y + buttonHeight + i*spaceBetweenButtons;
      fill(mouseOver ? #999999 : #CCCCCC);
      rect(x, y + i*spaceBetweenButtons, buttonWidth, buttonHeight);
      fill(0);
      text(labelsForButtons[i], x + buttonWidth / 2, y + buttonHeight / 2  + i*spaceBetweenButtons);
      popMatrix();
    }
  }
  
  void mousePressed()
  {
    boolean mouseXCoordinate =  mouseX >= x && mouseX <= x + buttonWidth;
    if(mouseXCoordinate && mouseY >= y + 0*spaceBetweenButtons && mouseY <= y + buttonHeight + 0*spaceBetweenButtons) { isPlayGame = true; isHome=false; } //ako je nula onda je prvi gumb
    else if(mouseXCoordinate && mouseY >= y + 1*spaceBetweenButtons && mouseY <= y + buttonHeight + 1*spaceBetweenButtons) { isPlayGame = true; isHome=false; } //settings
    else if(mouseXCoordinate && mouseY >= y + 2*spaceBetweenButtons && mouseY <= y + buttonHeight + 2*spaceBetweenButtons) { isPlayGame = true; isHome=false;} //leaderboard
    else if(mouseXCoordinate && mouseY >= y + 3*spaceBetweenButtons && mouseY <= y + buttonHeight + 3*spaceBetweenButtons) { exit(); } //exit
  
  }
  
}

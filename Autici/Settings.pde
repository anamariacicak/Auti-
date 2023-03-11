class Settings
{
  int x, y; 
  
  boolean flagMusic;

  Settings()
  {
   y = height - 650 + 120;
   x = (width - y + 150) /3;
   flagMusic = true;
  }

  void drawSettings()
  {
    
    backgroundImage.resize(550,750);
    background(backgroundImage);
       
    if(flagMusic == true && musicOn == true){
      flagMusic = false;
      //tombackgroundMusic.loop();
    }
    
    //odabir autica
    drawButton("Autic", x + 10, height - 650, width/3, false);
    drawLeftArrow(x, y);
    drawRightArrow(width - y, y);
    drawCarImageBetweenArrows(x + 10, y);
    
    //music on/off
    drawButton("Zvuk", x + 10, y + 1.5 * spaceBetweenButtons, width/3, false);
    if(musicOn == true){
      drawButton("On", x + 75, y + 2.5 * spaceBetweenButtons, width/8, true);
    }
    else if(musicOn == false){
      drawButton("Off", x + 75, y + 2.5 * spaceBetweenButtons, width/8, true);
    }
    
    drawBackButton();
    drawExitButton();
  
  }
  
  
  void drawLeftArrow(float x, float y)
  {
  
    //BACK
    pushMatrix();
    stroke(0);
    fill(overCircleButton(x, y, 40) ? 122 : 255);
    strokeWeight(1);
    circle(x, y, 40); //krug
    popMatrix();
    drawArrow(x + 10, y, 20, 180); //strelica
  
  }
  
  void drawRightArrow(float x, float y)
  {
  
    //BACK
    pushMatrix();
    stroke(0);
    fill(overCircleButton(x + 20, y, 40) ? 120 : 255);
    strokeWeight(1);
    circle(x + 25, y, 40); //krug
    popMatrix();
    drawArrow(x + 15, y, 20, 0); //strelica
  
  }
  
  void drawCarImageBetweenArrows(int x, int y)
  {
    pushMatrix();
    textSize(10);
    textAlign(CENTER, TOP);
    fill(0);
    strokeWeight(10);
   
    PImage carImg = loadImage("car" + idOdabirAutica +".png"); 
    carImg.resize(75,75);
    image(carImg, x + 60, y -20);
    popMatrix();
  
  }
  
  
  void mousePressed()
  {
    if(overCircleButton(40, height - 40, 60) == true) //gumb za back
    { 
      isHome = true;
      //home = new Home();
      isSettings = false;
    }
    else if(overCircleButton(width - 40, 40, 60) == true) { exit(); } 
    
    //odabir autica
    if(overCircleButton(x, y, 40) == true)
    {
      idOdabirAutica--;
      if(idOdabirAutica<0) idOdabirAutica = 0;
      playGame = new PlayGame();
    }
    else if(overCircleButton(width - y + 25, y, 40) == true)
    {
      idOdabirAutica++;
      if(idOdabirAutica > brojAutica-1) idOdabirAutica = brojAutica-1; 
      playGame = new PlayGame();
    }
    
    //glazba
    else if(mouseX >= x + 75 && mouseX <= x + 75 + width/8 && mouseY >= y + 2.5 * spaceBetweenButtons && mouseY <= y + 2.5 * spaceBetweenButtons + buttonHeight){
      if(musicOn == true) {
        musicOn = false;
        //tombackgroundMusic.stop();
      }
      else if(musicOn == false){
        musicOn = true;
        flagMusic = true;
      }
    }

  }


}

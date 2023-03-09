class Settings
{
  int x, y; //svugdje isti? - globalan

  Settings()
  {
   y = width/3;
   x = (width - y + 150) /3;

  }

  void drawSettings()
  {
    background(255);
    
    
    //odabir autica
    drawButtonWithoutCover("Autic", x, height-650, y);
    //topY = topY + spaceBetweenButtons;
    drawLeftArrow(height-650+120);
    drawRightArrow(height-650+120);
    
    drawCarImageBetweenArrows(height-650+120);
    
    drawBackAndExitButtons();
  
  }
  
  
  void drawLeftArrow(int y)
  {
  
    //BACK
    pushMatrix();
    stroke(0);
    fill(overButton(x-15, height-650+120, 40) ? 120 :255);
    strokeWeight(1);
    circle(x-15, y, 40); //krug
    popMatrix();
    drawArrow(x-5,y,20,180); //strelica
  
  }
  
  void drawRightArrow(int y)
  {
  
    //BACK
    pushMatrix();
    stroke(0);
    fill(overButton(width-(height-650+120), height-650+120, 40) ? 120 :255);
    strokeWeight(1);
    circle(width-y, y, 40); //krug
    popMatrix();
    drawArrow(width- y -10,y,20,0); //strelica
  
  }
  
  void drawCarImageBetweenArrows(int y)
  {
    pushMatrix();
    textSize(10);
    textAlign(CENTER, TOP);
    fill(0);
    strokeWeight(10);
   
    PImage carImg = loadImage("car" + idOdabirAutica +".png"); 
    carImg.resize(75,75);
    image(carImg, x -15 + 55, y -20);
    //text("autic!", width/2, height - 650);
    popMatrix();
  
  }
  
  
  

  void mousePressed()
  {
    if(overButton(40, height-40, 60) == true) //gumb za back
    { 
      //MUSIC BACKGORUNDMusic.stop();
      isHome = true;
      isSettings = false;
    }
    else if(overButton(width - 40, height-40, 60) == true) { exit(); } 
    
    if(overButton(x-15, height-650+120, 40) == true)
    {
      idOdabirAutica--;
      if(idOdabirAutica<0) idOdabirAutica = 0;
      //if(idOdabirAutica > brojAutica-1) idOdabirAutica = brojAutica-1;
      playGame = new PlayGame();
    }
    else if(overButton(width-(height-650+120), height-650+120, 40) == true)
    {
      idOdabirAutica++;
      //if(idOdabirAutica<0) idOdabirAutica = 0;
      if(idOdabirAutica > brojAutica-1) idOdabirAutica = brojAutica-1; 
      playGame = new PlayGame();
    }
    //circle(width-15, y, 40)
  }


}

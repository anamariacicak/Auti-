import processing.sound.*;

//SoundFile gameMusic;



int  buttonWidth, buttonHeight, spaceBetweenButtons;

int score; //mora biti globalna kako bi ga mogli ispisati na leaderboard

int idOdabirAutica = 0,  brojAutica = 2; //globalna jer koristimo u Settingsu i u PlayGame pri ucitavanju - hardkodirano je

//---------------------------------------------------KLASE---------------------------------------------------//
Home home;
boolean isHome = true;
PlayGame playGame;
boolean isPlayGame = false;
GameOver gameOver;
boolean isGameOver = false;
Settings settings;
boolean isSettings = false;
LeaderBoard leaderBoard;
boolean isLeaderBoard = false;

//-------------------------------------------------SETUP-------------------------------------------------//
void setup()
{
  size(550,750);
  
  //glazba
  // gameMusic=new SoundFile(this, "game_music.mp3");
  
  //buttonsi
  buttonWidth = width/3;
  buttonHeight = 50; 
  spaceBetweenButtons = 80;

  //home
  home = new Home(); 
  
  //play
  playGame = new PlayGame();
  
  //gameOver
  gameOver = new GameOver();
  
  //settings
  settings = new Settings();
  
  //leadBoard
  leaderBoard = new LeaderBoard();
 
}


//-------------------------------------------------DRAW-------------------------------------------------//
void draw()
{
  
  //pratimo trenutni screen pomocu odgovarajuce boolean varijable 
  if(isHome){ 
    home.drawHome();
  }
  
  else if(isPlayGame){
    playGame.drawPlayGame();
  }
  
  else if(isGameOver){
    gameOver.drawGameOver();
  }
  
  else if(isLeaderBoard){
    leaderBoard.drawLeadBoard();
  }
  
  else if(isSettings){
    settings.drawSettings();
  }

}


//-------------------------------------------------keyPressed-------------------------------------------------//
//kretanje autica gore, dolje, lijevo i desno na pritisak tipki
void keyPressed()
{
  if(isPlayGame){
    playGame.keyPressed();
  }
  
}


//-------------------------------------------------mousePressed-------------------------------------------------//
void mousePressed()
{
 
  if(isHome){
    home.mousePressed();
  }
  
  else if(isPlayGame){
    playGame.mousePressed();  
  }
  
  else if (isGameOver){
    gameOver.mousePressed();
  }
  
  else if (isLeaderBoard){
    leaderBoard.mousePressed();
  }
 
 else if(isSettings){
    settings.mousePressed();
  }
  
}


//-------------------------------------------------drawButtons-------------------------------------------------//
//buttoni za menu
void drawButtons(String[] labelsForButtons, int x, int y)
{
   for(int i=0; i<labelsForButtons.length; i++)
    {
      pushMatrix();
      strokeWeight(0);
      boolean mouseOver = mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y + i*spaceBetweenButtons && mouseY <= y + buttonHeight + i*spaceBetweenButtons;
      fill(mouseOver ? #0000FF : #00BFFF);
      rect(x, y + i*spaceBetweenButtons, buttonWidth, buttonHeight);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(24);
      text(labelsForButtons[i], x + buttonWidth / 2, y + buttonHeight / 2  + i*spaceBetweenButtons);
      popMatrix();
    }   
   
}


void drawButtonWithoutCover(String labelForButton, int x, int y, int buttonWidth)
{
    
    pushMatrix();
    strokeWeight(0);
    fill(#CCCCCC);
    rect(x, y + 0*spaceBetweenButtons, buttonWidth, buttonHeight);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(24);
    text(labelForButton, x + buttonWidth / 2, y + buttonHeight / 2  + 0*spaceBetweenButtons);
    popMatrix();
    
}



//-------------------------------------------------crtanje back gumba i exit gumba-------------------------------------------------//
void drawBackAndExitButtons()
{
  
  //BACK
  pushMatrix();
  stroke(0);
  fill(overCircleButton(40, height-40, 60) ? 120 :255);
  strokeWeight(1);
  circle(40, height-40, 60); //krug
  popMatrix();
  drawArrow(55,height-40,30,180); //strelica unutar kruga
  
  //EXIT
  pushMatrix();
  stroke(0);
  fill(overCircleButton(width - 40, height-40, 60) ? 120 :255);
  strokeWeight(1);
  circle(width - 40, height-40, 60); //krug
  strokeWeight(5);
  stroke(#EE1111);
  line(width - 60, height-60, width-20, height-20); //X unutar kruga
  line(width - 20, height-60, width-60, height-20);
  popMatrix(); 
  
}

//STRELICA
//https://forum.processing.org/one/topic/drawing-an-arrow.html
void drawArrow(int cx, int cy, int len, float angle){
    pushMatrix();
    strokeWeight(10);
    stroke(0);
    translate(cx, cy);
    rotate(radians(angle));
    line(0,0,len, 0);
    line(len, 0, len - 8, -8);
    line(len, 0, len - 8, 8);
    popMatrix();
}



//-------------------------------------------------overCircleButton-------------------------------------------------//
//fja za prepoznavanje nalazi li se mis iznad gumba koji je oblika tipa krug
//sluzi kao pomoc pri prepoznavanju je li pritisnut gumb za povratak (Back (u nasem slucaju povratak na Home) i Exit buttonsi)
//globalna jer ju vise klasa koristi - button Home i Exit se nalaze na vise razlicitih screenova
boolean overCircleButton(float x, float y, float diam) 
{
  if (sqrt(sq(x - mouseX) + sq(y - mouseY)) < diam/2 ) { 
    return true; 
  } 
  else { return false; }
}



//datoteka ucitavanje
void leaderBoardTxt()
{
  String[] lines;
  String data = score + " " + day()+"/"+month()+"/"+year()+"-"+hour()+":"+minute()+":"+second(); // The string you want to store
  lines = loadStrings("leaderboard.txt");   
  PrintWriter writer = createWriter("leaderboard.txt"); // Create a new text file
  for(int i = 0; i < lines.length  ; i++){
      String[] spl = split(lines[i],"\n"); //splitanje novog reda"
      writer.println(String.valueOf(spl[0]));;
  }
  writer.println(data);
  writer.flush(); // Flush the output to the file
  writer.close(); // Close the file*/    

}



//TO DO
//dizajn
//dorade
//igrac moze upisati svoje ime prije zapisi scorea
//popraviti format leaderboarda
//pogledati to do u kodu
//levele mozemo mjeriti na osnovu scorea
//testirati glazbu
//bugovi PlayGame - obstacleSpeed(carSpeed) i score - pogledati TO DO u playGame
//dodati vise prepreka

import processing.sound.*;

//SoundFile gameMusic;

String[] lines;

int buttonWidth, buttonHeight, spaceBetweenButtons;

int score;

int idOdabirAutica=0,  brojAutica = 2;

int topY=height-650;

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
void setup() //INICIJALZICAIJA
{
  size(550,750);
  
  //glazba
  // gameMusic=new SoundFile(this, "game_music.mp3");
  
  //buttonsi
  buttonHeight=50;
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
  
  //odabir odgovarajuceg screena
  
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
  
  if(isPlayGame){
    playGame.mousePressed();  
  }
  
  if (isGameOver){
    gameOver.mousePressed();
  }
  
  if (isLeaderBoard){
    leaderBoard.mousePressed();
  }
 
 if(isSettings){
    settings.mousePressed();
  }
  
}


//-------------------------------------------------crtanje back gumba i exit gumba-------------------------------------------------//
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

void drawBackAndExitButtons()
{
  
  //BACK
    pushMatrix();
    stroke(0);
    fill(overButton(40, height-40, 60) ? 120 :255);
    strokeWeight(1);
    circle(40, height-40, 60); //krug
    popMatrix();
    drawArrow(55,height-40,30,180); //strelica
    
    //EXIT
    pushMatrix();
    stroke(0);
    fill(overButton(width - 40, height-40, 60) ? 120 :255);
    strokeWeight(1);
    circle(width - 40, height-40, 60); //krug  
    popMatrix(); 
  
}


//fja za prepoznavanje je li stisnut gumb za povratak na Home - globalna je jer ju vise klasa koristi
boolean overButton(float x, float y, float diam) {
  float distX = x - mouseX;
  float distY = y - mouseY;
  if (sqrt(sq(distX) + sq(distY)) < diam/2 ) { return true; } 
  else { return false; }
}

//globalna jer koristi ju vise klasa
void drawButtons(String[] labelsForButtons, int x, int y)
  {
    buttonWidth = y;
    for(int i=0; i<labelsForButtons.length; i++)
    {
      pushMatrix();
      strokeWeight(0);
      boolean mouseOver = mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y + i*spaceBetweenButtons && mouseY <= y + buttonHeight + i*spaceBetweenButtons;
      fill(mouseOver ? #999999 : #CCCCCC);
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

//datoteka ucitavanje
void leaderBoardTxt()
{
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
//bugovi PlayGame
//dorade
//igrac moze upisati svoje ime prije zapisi scorea
//popraviti format leaderboarda
//dodati vise prepreka
//pogledati to do u kodu
//levele mozemo mjeriti na osnovu scorea

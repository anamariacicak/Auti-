import processing.sound.*;
import java.io.BufferedWriter;
import java.io.FileWriter;

//SoundFile gameMusic;

String[] lines;

int buttonWidth, buttonHeight, spaceBetweenButtons;

int score;

//---------------------------------------------------KLASE---------------------------------------------------//
Home home;
boolean isHome = true;
PlayGame playGame;
boolean isPlayGame = false;
GameOver gameOver;
boolean isGameOver = false;
//Settings settings;
boolean isSettings = false;
LeaderBoard leaderBoard;
boolean isLeadBoard = false;

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
  //settings = new Settings();
  
  //leadBoard
  leaderBoard = new LeaderBoard();
 
}


//-------------------------------------------------DRAW-------------------------------------------------//
void draw()
{
  
  //odabir odgovarajuceg scrrena
  
  if(isHome){
    home.drawHome();  
  }
  if(isPlayGame){
    playGame.drawPlayGame();
  }
  if(isGameOver){
    gameOver.drawGameOver();
  }
  if(isLeadBoard){
    leaderBoard.drawLeadBoard();
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
//dodati gumb za povratak na svaki screen
//HOME - play, settings, exit
//dodati ostale screenove: HOME, NEW GAME, SETTINGS - (sound,..) , EXIT -> klase
//tablica igara
//igrac moze upisati svoje ime prije pocetka igre
//dodati vise prepreka
//pogledati to do u kodu
//igrac moze birati model autica
//levele mozemo mjeriti na osnovu scorea

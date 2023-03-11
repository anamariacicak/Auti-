import processing.sound.*;
import java.util.Arrays;
import java.io.*;
import java.lang.*;
import java.util.*;

SoundFile backgroundMusic, playGameMusic;

PImage backgroundImage;

int  buttonWidth, buttonHeight, spaceBetweenButtons;

int score; 

int idOdabirAutica = 0,  brojAutica = 2; //hardkodirano 

boolean musicOn = true;

String playerName="player";

PFont font;

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
  
  //font
  font = createFont("LG A100.ttf", 128);
  textFont(font);
  
  //glazba
  //play, loop, pause
  backgroundMusic = new SoundFile(this, "background_music.mp3");
  playGameMusic = new SoundFile(this, "playGame_music.mp3");
  
  //background
  backgroundImage = loadImage("cesta2.jpg");
  
  //buttonsi
  buttonWidth = width/3;
  buttonHeight = 50; 
  spaceBetweenButtons = 80;

  //home
  home = new Home(); 
  
  //play
  //playGame = new PlayGame();
  
  //gameOver
  //gameOver = new GameOver();
  
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
  else if(isGameOver){
    gameOver.keyPressed();
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


void drawButton(String labelForButton, float x, float y, int buttonWidth, boolean cover)
{
    
    pushMatrix();
    strokeWeight(0);
    if(cover == true) {
      boolean mouseOver = mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y  && mouseY <= y + buttonHeight;
      fill(mouseOver ? #0000FF : #00BFFF);
    }
    else fill(#00BFFF);
    rect(x, y + 0*spaceBetweenButtons, buttonWidth, buttonHeight);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(24);
    text(labelForButton, x + buttonWidth / 2, y + buttonHeight / 2  + 0*spaceBetweenButtons);
    popMatrix();
    
}



//-------------------------------------------------crtanje back gumba i exit gumba-------------------------------------------------//
void drawBackButton()
{
  
  //BACK
  pushMatrix();
  stroke(0);
  fill(overCircleButton(40, height-40, 60) ? 120 :255);
  strokeWeight(1);
  circle(40, height-40, 60); //krug
  popMatrix();
  drawArrow(55,height-40,30,180); //strelica unutar kruga
}

void drawExitButton()
{
  //EXIT
  pushMatrix();
  stroke(0);
  //fill(overCircleButton(width - 40, 40, 60) ? 120 :255);
  strokeWeight(0);
  //circle(width - 40, 40, 60); //krug height-40
  strokeWeight(5);
  stroke(#EE1111);
  line(width - 60, 20, width-20, 60); //X unutar kruga //height-60 height-20 y koordinate
  line(width - 20, 20, width-60, 60);
  popMatrix();   
}

//STRELICA
//https://forum.processing.org/one/topic/drawing-an-arrow.html
void drawArrow(float cx, float cy, float len, float angle){
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
boolean overCircleButton(float x, float y, float diam) 
{
  if (sqrt(sq(x - mouseX) + sq(y - mouseY)) < diam/2 ) { 
    return true; 
  } 
  else { return false; }
}



//-------------------------------------------------leaderBoardTxt-------------------------------------------------//
//ucitavanje datoteke leaderboard.txt potrebne za ispis ljestvice poretka
void leaderBoardTxt()
{
  String[] lines;
  String data = score + " "  + playerName + " " + day()+"/"+month()+"/"+year()+"-"+hour()+":"+minute()+":"+second(); // The string you want to store
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
//testirati glazbu
//pogledati to do u kodu
//bugovi PlayGame - obstacleSpeed(carSpeed) i score - pogledati TO DO u playGame
//dodati vise prepreka
//prepreke promijenjive velicine
//razlicita pozadina od pozadine u igrici
//igrac moze upisati svoje ime prije zapisi scorea - potvrda toga
//levele mozemo mjeriti na osnovu scorea
//dodati jos prepreka, razlicita velicina prepreka

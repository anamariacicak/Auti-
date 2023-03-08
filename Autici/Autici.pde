import processing.sound.*;

//SoundFile gameMusic;

//---------------------------------------------------KLASE---------------------------------------------------//
Home home;
boolean isHome = true;
PlayGame playGame;
boolean isPlayGame = false;

//-------------------------------------------------SETUP-------------------------------------------------//
void setup()
{

  size(550,750);
  
  //glazba
  // gameMusic=new SoundFile(this, "game_music.mp3");

  
  //home
  home = new Home();
  
  //play
  playGame = new PlayGame();
  
}


//-------------------------------------------------DRAW-------------------------------------------------//
void draw()
{
  if(isHome){
    home.drawHome();
   
  }
  else if(isPlayGame){
    playGame.drawPlayGame();
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
  
}

//fja za prepoznavanje je li stisnut gumb za povratak na Home
boolean overButton(float x, float y, float diam) {
  float distX = x - mouseX;
  float distY = y - mouseY;
  if (sqrt(sq(distX) + sq(distY)) < diam/2 ) { return true; } 
  else { return false; }
}



void gameOver()
{
  noLoop();
  
  //prilikom gameovera treba inicijalizirati novu igru
  playGame = new PlayGame();
  //gameMusic.stop(); //MUSIC
  textSize(50);
  text("GAME OVER!", width/2-100, height/2);
  
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

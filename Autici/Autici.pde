import processing.sound.*;

SoundFile gameMusic;

//---------------------------------------------------KLASE---------------------------------------------------//
Home home;
boolean isHome = true;
PlayGame play;
boolean isPlayGame = false;

//-------------------------------------------------SETUP-------------------------------------------------//
void setup()
{

  size(550,750);
  
  //glazba
  gameMusic=new SoundFile(this, "game_music.mp3");
  //gameMusic.play();
  //gameMusic.loop();
  
  //home
  home = new Home();
  
  //play
  play = new PlayGame();
  
  if(isPlayGame){
    gameMusic.play();
    gameMusic.loop();
  }
}


//-------------------------------------------------DRAW-------------------------------------------------//
void draw()
{
  if(isHome){
    home.drawHome();
   
  }
  else if(isPlayGame){
    play.drawPlayGame();
  }

}


//-------------------------------------------------keyPressed-------------------------------------------------//
//kretanje autica gore, dolje, lijevo i desno na pritisak tipki
void keyPressed()
{
  if(isPlayGame){
    play.keyPressed();
  }
  
}


//-------------------------------------------------mousePressed-------------------------------------------------//
void mousePressed()
{
 
  if(isHome){
    home.mousePressed();
  }
  
}

void gameOver()
{
  noLoop();
  //gameMusic.stop();
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

import processing.sound.*;
import java.io.BufferedWriter;
import java.io.FileWriter;

//SoundFile gameMusic;

String[] lines;

//---------------------------------------------------KLASE---------------------------------------------------//
Home home;
boolean isHome = true;
PlayGame playGame;
boolean isPlayGame = false;
GameOver gameOver;
boolean isGameOver = false;

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
  
  
  //ucitavanje txt
  String data = "Hello, world1!"; // The string you want to store
  lines = loadStrings("output.txt");
  PrintWriter writer = createWriter("output.txt"); // Create a new text file
  for(int i = 0; i < lines.length  ; i++){
      String[] spl = split(lines[i],"\n"); //splitanje novog reda"
      writer.println(String.valueOf(spl[0]));;
  }
  writer.println(data);
  writer.println("data2345");// Write the string into the file
  writer.flush(); // Flush the output to the file*/
  writer.close(); // Close the file
  


  
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
  //TO DO dodati polje za ime i potvrdu spremanja hs
  playGame = new PlayGame();
  //gameMusic.stop(); //MUSIC
  textSize(50);
  text("GAME OVER!", width/2-100, height/2);
  //TO DO dodati mogucnost odabira nove igre ili exita
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

class LeaderBoard
{
<<<<<<< Updated upstream
 
  void drawLeadBoard()
  {
    background(255);
 
=======
  
  void drawLeadBoard()
  {
    background(255);
  
>>>>>>> Stashed changes
    // Draw the leaderboard
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("LEADERBOARD", width/2, 50);
<<<<<<< Updated upstream
   
=======
    
>>>>>>> Stashed changes
    textSize(16);
    textAlign(CENTER);
    String[] lines;
    lines = loadStrings("leaderboard.txt");
    for (int i = 0; i < lines.length && i < 15; i++) {
      String[] parts = lines[i].split(" ");
      String name = "player";
      int scoree = Integer.parseInt(parts[0].trim());
      String date = String.valueOf(parts[1]);
      text((i+1) + ". "  + name + " - " + scoree + " " + date, width/2, 100 + i*45);
    }
<<<<<<< Updated upstream
 
    drawBackAndExitButtons();
 
=======
  
    drawBackAndExitButtons();
  
>>>>>>> Stashed changes

  }

  void mousePressed()
  {
    if(overCircleButton(40, height-40, 60) == true) //gumb za back
<<<<<<< Updated upstream
    {
=======
    { 
>>>>>>> Stashed changes
      //MUSIC BACKGORUNDMusic.stop();
      isHome = true;
      isLeaderBoard = false;
    }
    else if(overCircleButton(width - 40, height-40, 60) == true) { exit(); }  
  }

}

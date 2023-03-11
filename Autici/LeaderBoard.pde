class LeaderBoard
{
  
  boolean flagMusic;
  
  void drawLeadBoard()
  {
    
    backgroundImage.resize(550,750);
    background(backgroundImage);
    
    flagMusic = true;
    
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("POREDAK", width/2, 50);

    String[] lines;
    lines = loadStrings("leaderboard.txt");
    
    //sortiranje
    Comparator<String> cmp = new Comparator<String>() {
    public int compare(String s1, String s2) {
      int score1 = Integer.parseInt(s1.split(" ")[0].trim());
      int score2 = Integer.parseInt(s2.split(" ")[0].trim());
      return score2 - score1;
    
    }
    };
    Arrays.sort(lines,  cmp);
    
    textSize(16);
    textAlign(CENTER);
    
    for (int i = 0; i < lines.length && i <= 15; i++) {
      String[] parts = lines[i].split(" ");
      int scoree = Integer.parseInt(parts[0].trim());
      String name = String.valueOf(parts[1]);
      String date = String.valueOf(parts[2]);
      if(i==lines.length) name = playerName;
      text((i+1) + ". "  + name + " - " + scoree + " " + date, width/2, 100 + i*45);
    }

 
    drawBackButton();
    drawExitButton();

  }

  void mousePressed()
  {
    if(overCircleButton(40, height-40, 60) == true) //gumb za back
    {
      //MUSIC BACKGORUNDMusic.stop();
      isHome = true;
      isLeaderBoard = false;
    }
    else if(overCircleButton(width - 40, 40, 60) == true) { exit(); }  
  }

}

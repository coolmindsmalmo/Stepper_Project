class highscoreScreen extends gameObject {  
  private long timer;
  private long waitTime = 5000;
  private int xTarget = width/2;
  private game gameHandler;

  private PImage lastFrame;
  
  private boolean playAgain;

  int highscores[];
  String names[];

  int newHSindex = 11;

  public highscoreScreen(game gameHandler) {
    this.gameHandler = gameHandler;
    x = 2120;
    timer = millis();
    lastFrame = get();

    handleHighscores();
  }

  public @Override void update() {
    imageMode(CORNER);
    image(lastFrame, 0, 0);

    rectMode(CENTER);
    strokeWeight(10);
    stroke(0);
    fill(45, 45, 65, 155);
    //noFill();
    rect(x, 100, 800, 100);
    rect(x, 475, 800, 650);
    rect(x, 850, 800, 100);

    drawContinueBar();

    fill(255);
    textSize(140);
    textAlign(CENTER, CENTER);
    textFont(gameHandler.mainFont);

    text("Highscores", x, 100);

    textAlign(CORNER, CENTER);
    for (int i = 0; i < highscores.length; i++) {
      fill(255);
      if (i == newHSindex) {
        fill(0, 255, 0);
      }
      text(names[i] + " - ", x - 300, 200 + (i*60));
      text(highscores[i], x + 200, 200 + (i*60));
    }

    x = lerp(x, xTarget, 0.08);
    if (x < -300) {
      if (playAgain) {
        asteroidEscape = new asteroidEscape(); 
      } else {
        gameHandler.endGame();
      }
    }
  }

  private void drawContinueBar() {
    int timePassed = int(millis() - timer);

    if (lastBikeVal != bikeValue) {
      bikeValue = int(map(bikeValue, 0, 150, 0, 394));
      lastBikeVal = bikeValue;

      bikeValue = constrain(bikeValue, 0, 394);
      strokeWeight(0);
      fill(0, 255, 0);
      rectMode(CORNER);
      rect(x, 806, bikeValue, 88);
      timer = millis();
    } 
    
    if (bikeValue < 1) {      
      timePassed = int(map(timePassed, 0, waitTime, 0, 394));
      timePassed = constrain(timePassed, 0, 394);
      strokeWeight(0);
      fill(255, 0, 0);
      rectMode(CORNER);
      rect(x, 806, -timePassed, 88);
    }


    if (bikeValue >= 394) {
      xTarget = -800;
      playAgain = true;
    } else if (timePassed >= 394) {
      xTarget = -800;
    }
  }

  private void handleHighscores() {
    String rawHS[] = loadStrings(dataPath(gameHandler.gameName + "/Highscores.txt"));
    highscores = int(rawHS[0].split(","));
    names = rawHS[1].split(",");

    for (int i = 0; i < highscores.length; i++) {
      if (gameHandler.score > highscores[i]) {
        newHighscore(i);
        break;
      }
    }

    String scoresToSave = "";
    String namesToSave = "";
    for (int i = 0; i < highscores.length; i++) {
      scoresToSave += highscores[i];
      if (i < highscores.length-1) {
        scoresToSave += ',';
      }
    }

    for (int i = 0; i < names.length; i++) {
      namesToSave += names[i];
      if (i < highscores.length-1) {
        namesToSave += ',';
      }
    }
    String stringsToSave[] = new String[2];
    stringsToSave[0] = scoresToSave;
    stringsToSave[1] = namesToSave;
    saveStrings(dataPath(gameHandler.gameName + "Highscores.txt"), stringsToSave);
  }

  private void newHighscore(int index) {
    for (int i = 8; i >= index; i--) {
      highscores[i+1] = highscores[i];
    }
    highscores[index] = int(gameHandler.score);
    newHSindex = index;
  }
}
class game {
  //MENU VARIABLES
  protected String gameName;
  protected PImage menuImage;
  public PFont mainFont;
  protected String mainFontName;
  
  //SOUND FILES
  AudioSample soundEffects[] = new AudioSample[0];
  AudioPlayer music;
  
  //GAME STATES
  protected final int STAND_BY = 0;
  protected final int PLAYING_GAME = 1;
  protected final int GAME_OVER = 2;
  protected int state = PLAYING_GAME;
  
  //GAME OBJECTS
  protected gameObject[] gameObjects = new gameObject[2];
  protected collisionChecker collisionChecker = new collisionChecker();
  protected gameUI UI;
  protected gameObject highscoreScreen, gameOverScreen;
  
  float score;
  
  public game(String gameName) {
    this.gameName = gameName;
    menuImage = loadImage(dataPath(gameName + "/Preview Image.png"));
    println(dataPath(gameName + "/Preview Image.png"));
    menuImage.resize(960, 540);
    music = minim.loadFile(dataPath(gameName + "/Music.wav"));
    mainFont = createFont(dataPath(gameName + "/Main Font.ttf"), 72); 
    
    music.loop();        
    
    collisionChecker = new collisionChecker();
    gameObjects[0] = collisionChecker;
  }
  
  public void play() {
    switch(state) {
    case PLAYING_GAME:
      for (int i = 0; i < gameObjects.length-1; i++) {
        if (gameObjects[i] == null) {
          break;
        } else {
          gameObjects[i].update();
        }
      }
      break;
      
      case GAME_OVER:
      gameObjects[gameObjects.length-1].update();
      break;
    }
  }
  
  public void gameOver() {
    gameObjects[gameObjects.length-1] = new gameOver(this);
    state = GAME_OVER;
  }
  
  public void highscores() {
    gameObjects[gameObjects.length-1] = new highscoreScreen(this);
    state = GAME_OVER;
  }
  
  public void endGame() {
    play = false;
  }
  
  protected void addSoundEffect(String sampleName) {
     AudioSample newArray[] = new AudioSample[soundEffects.length+1];
     for (int i = 0; i < soundEffects.length; i++) {
       newArray[i] = soundEffects[i]; 
     }
     newArray[newArray.length-1] = minim.loadSample(dataPath(gameName + '/' + sampleName));
     soundEffects = newArray;
  }
  
  protected void addGameObject(gameObject gameObject) {
     gameObject newArray[] = new gameObject[gameObjects.length+1];
     for (int i = 0; i < gameObjects.length; i++) {
       newArray[i] = gameObjects[i]; 
     }
     newArray[newArray.length-2] = gameObject;
     gameObjects = newArray;
  }
}
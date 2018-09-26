class gameOver extends gameObject {
  private long timer;
  private long waitTime = 3000;
  private float fade = 0;
  private int xTarget = width/2;
  private game gameHandler;
  
  private PImage lastFrame;
  
  public gameOver(game gameHandler) {
    this.gameHandler = gameHandler;
    x = 2120;
    y = height/2;
    timer = millis();
    lastFrame = get();
    gameHandler.soundEffects[0].trigger();
  }
  
  public @Override void update() {
    imageMode(CORNER);
    image(lastFrame, 0, 0);
    noStroke();
    fill(0, 0, 0, fade);
    rect(width/2, height/2, width, height);
    fill(255);
    textSize(300);
    textAlign(CENTER, CENTER);
    textFont(gameHandler.mainFont);
    text("GAME OVER", x, y);
    fade += 3;
    fade = constrain(fade, 0, 160);
    x = lerp(x, xTarget, 0.08);
    if (millis() > timer + waitTime) {
      xTarget = -800;
      if (x < -300) {
         gameHandler.highscores();
      }
    }
  }
}
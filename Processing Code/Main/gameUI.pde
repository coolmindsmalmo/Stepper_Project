class gameUI extends gameObject {
  private int maxHp = 3;
  private int hp = maxHp;
  
  public gameUI(game gameHandler) {
    this.gameHandler = gameHandler;
    drawBaseUI();
    drawHealth();
  }
  
  public @Override void update() {
    drawScore();
  }
  
  public void updateHealth(int hp) {
    this.hp = hp;
    drawHealth();
  }
  
  private void drawBaseUI() {
    rectMode(CENTER);
    stroke(0);
    strokeWeight(10);
    fill(100, 100, 125);
    rect(width/2, 1030, 1920, 100);
    
    textAlign(CORNER, CORNER);
    textSize(72);
    fill(0);
    textFont(gameHandler.mainFont);
    text("LIV:", 100, 1050);
  }
  
  private void drawHealth() {
    for (int i = 0; i < 3; i++) {
      stroke(0);
      strokeWeight(20);
      line(270 + (i*40), 1018, 270 + (i*40), 1042);
    }
    for (int i = 0; i < hp; i++) {
      stroke(255, 0, 0);
      strokeWeight(10);
      line(270 + (i*40), 1018, 270 + (i*40), 1042);
    }
  }

  private void drawScore() {
    rectMode(CENTER);
    noStroke();
    fill(100, 100, 125);
    rect(width/2, 1030, 1000, 80);
    textAlign(CORNER, CORNER);
    textSize(72);
    fill(0);
    textFont(gameHandler.mainFont);
    text("POÄNG: " + int(gameHandler.score), width/2-200, 1050);  
  }  
}
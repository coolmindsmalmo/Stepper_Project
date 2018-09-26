class environment extends gameObject {
  private int scrollSpeed = 2;
  private PImage[] asteroidImages = new PImage[3];
  private gameObject[] asteroids = new gameObject[100];

  private int timer;
  private float spawnInterval = 3000;
  
  public int hp = 3;
  
  public environment(game gameHandler) {
    this.gameHandler = gameHandler;
    loadAssets();
    timer = millis();
  }

  public @Override void loadAssets() {
    sprite = loadImage(dataPath(gameHandler.gameName + "/Space_BG.png"));
    for (int i = 1; i < asteroidImages.length; i++) {
      asteroidImages[i-1] = loadImage(dataPath(gameHandler.gameName + "/Asteroid_" + i + ".png"));
    }
  }

  public @Override void update() {   
    drawBackground();
    drawAsteroids();
    if (millis() > timer + spawnInterval) {
      addAsteroid();
      timer = millis();
      spawnInterval = random(500, 1500);
    }
  }

  private void drawBackground() {
    x += scrollSpeed;


    if (x >= width) {
      x = x - 1920;
    }

    for (int i = 0; i < 2; i++) {
      imageMode(CORNER);
      image(sprite, -(x - (i*1920)), -100);
    }
  }

  private void addAsteroid() {
    for (int i = 0; i < asteroids.length; i++) {
      if (asteroids[i] == null) {
        int selectedImage = int(random(0, 2));
        asteroids[i] = new asteroid(asteroidImages[selectedImage], i, this);
        break;
      }
    }
  }

  private void drawAsteroids() {
    for (int i = 0; i < asteroids.length; i++) {
      if (asteroids[i] != null) {
        asteroids[i].update();
      }
    }
  }

  public @Override void destroy(int index) {
    asteroids[index] = null;
  }
}
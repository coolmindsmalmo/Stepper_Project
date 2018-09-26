class player extends gameObject {
  private int maxHp = 3;
  private int hp = maxHp;
  private PImage[] shipImages = new PImage[3];
  private PImage[] shipExplosion = new PImage[8];

  private frameAnimator animator;
  private fireHandler fireHandler;

  private game gameHandler;

  private damageAnimation dAnimator;
  
  private gameUI UI;

  public player(game gameHandler, gameUI UI) {
    x = 100;
    y = height/2;
    this.gameHandler = gameHandler;
    loadAssets();
    animator = new frameAnimator(3, shipImages, true);
    fireHandler = new fireHandler(this);
    collider = new collider(int(shipImages[0].width*0.7), int(shipImages[0].height*0.7), this, true);
    gameHandler.collisionChecker.addCollider(collider);
    
    this.UI = UI;

    this.dAnimator = new damageAnimation(this, shipImages[0], color(255, 0, 0));
  }

  public @Override void loadAssets() {
    for (int i = 0; i < shipImages.length; i++) {
      shipImages[i] = loadImage(dataPath(gameHandler.gameName + "/PlayerShip_" + i + ".png"));
      //shipImages[i].resize(shipImages[i].width*2, shipImages[i].height*2);
    }
    for (int i = 0; i < shipExplosion.length; i++) {
      shipExplosion[i] = loadImage(dataPath(gameHandler.gameName + "/Explosion_" + i + ".png"));
    }
  }

  public @Override void update() {
    fireHandler.update();
    gameHandler.score += 0.1;
    imageMode(CENTER);
    if (lastBikeVal != bikeValue) {
      bikeValue = int(map(bikeValue, 0, 222, height-160, 60));
      lastBikeVal = bikeValue;
    }
    //y = lerp(y, bikeValue, 0.03);
    y = mouseY;
    if (dAnimator.isAnimating()) {
      dAnimator.update();
    } else if (animator.animate(x, y) == false) {
      gameHandler.gameOver();
    }
  }

  public @Override void onCollision(collider other) {
    if (!dAnimator.isAnimating() && animator.looping) {
      hp --;
      UI.updateHealth(hp);
      if (hp < 1) {
        animator = new frameAnimator(5, shipExplosion, false);
        gameHandler.music.pause();
        gameHandler.soundEffects[2].trigger();
      } else {
        gameHandler.soundEffects[1].trigger(); 
        dAnimator.animate(true);
      }
    }
  }
}
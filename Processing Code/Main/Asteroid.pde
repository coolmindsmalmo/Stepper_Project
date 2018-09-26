class asteroid extends gameObject {
  private float rotationSpeed;
  private PImage asteroidImage;
  private float scale;
  private float speed;
  private damageAnimation dAnimator;

  public asteroid(PImage asteroidImage, int index, gameObject parent) {
    this.index = index;
    this.asteroidImage = asteroidImage;
    this.parent = parent;

    this.dAnimator = new damageAnimation(this, asteroidImage, color(255, 0, 0));

    scale = random(0.5, 1.5);
    speed = random(9, 10);

    x = width + 200;
    y = random(asteroidImage.height/2, height-100-asteroidImage.height/2);
    rotationSpeed = random(-.01, .01);

    collider = new collider(asteroidImage.width, asteroidImage.height, this, false);
    parent.gameHandler.collisionChecker.addCollider(collider);
  }

  public @Override void update() {
    x -= 8;
    rotation -= rotationSpeed;

    if (x < -asteroidImage.width/2) {
      parent.destroy(index);
    }

    imageMode(CENTER);
    if (dAnimator.isAnimating()) {
      dAnimator.update();
    } else {
      image(asteroidImage, x, y);
    }
  }

  public @Override void onCollision(collider other) {
    dAnimator.animate(true);
  }
}
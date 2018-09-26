class damageAnimation {
  private PImage sprite;
  private boolean animate = false;
  private int frameSkip = 8;
  private int frameIndex = 0;
  private int noOfFlashes = 0;
  private color tint;
  
  private gameObject parent;
  public damageAnimation(gameObject parent, PImage sprite, color tint) {
    this.parent = parent;
    this.sprite = sprite;
    this.tint = tint;
  }
  
  public void update() {
    if (animate) {
      if (frameSkip > frameIndex) {
        tint(tint);
        frameIndex++;
      } else {
        frameIndex++;
        if (frameIndex == frameSkip * 2) {
          noOfFlashes++;
          frameIndex = 0;
          if (noOfFlashes > 3) {
            noOfFlashes = 0;
            animate = false;
          }
        }
      }     
      imageMode(CENTER);
      image(sprite, parent.x, parent.y);
      tint(255);
    }    
  }
  
  public boolean isAnimating() {
    return animate; 
  }
  
  public void animate(boolean animate) {
    this.animate = animate; 
  }
}
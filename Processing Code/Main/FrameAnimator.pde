class frameAnimator {
  private int frameWait;
  private int index = 0;
  private int frameIndex = 0;
  private PImage[] framesToAnimate;
    
  private boolean looping = true;

  public frameAnimator(int frameWait, PImage[] framesToAnimate, boolean looping) {
    this.frameWait = frameWait;
    this.framesToAnimate = framesToAnimate;
    this.looping = looping;
  }

  public boolean animate(float x, float y) {
    if (framesToAnimate[frameIndex] != null) {
      image(framesToAnimate[frameIndex], x, y);
    }
    index++;
    if (index > frameWait) {
      frameIndex++;
      index = 0;
      if (frameIndex == framesToAnimate.length) {
        if (!looping) return false;
        frameIndex = 0;
      }
    }
    return true;
  }
}
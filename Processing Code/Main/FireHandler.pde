public class fireHandler extends gameObject {
  private projectile[] projectiles = new projectile[40];
  private int fireRate = 100;
  private long fireTimer;
  
  public fireHandler(gameObject parent) {
    this.parent = parent;
    fireTimer = millis();
  }
  
  public @Override void update() {
    if (mousePressed) {
      if (millis() > fireTimer + fireRate) {
        fire();
        fireTimer = millis();
      }
    }
    
    for (int i = 0; i < projectiles.length; i++) {
      if (projectiles[i] != null) {
        projectiles[i].update();
      }
    }    
  }
  
  private void fire() {
    for (int i = 0; i < projectiles.length; i++) {
      if (projectiles[i] == null) {
        projectiles[i] = new projectile(i, this, 20, color(255));
        break;
      }
    }
  }
  
  public @Override void destroy(int index) {
    projectiles[index] = null;
  }
}
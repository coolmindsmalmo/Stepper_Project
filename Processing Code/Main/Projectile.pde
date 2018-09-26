class projectile extends gameObject {
  private float speed;
  private int damage = 10;
  private color projectileColor;
  
  public projectile(int index, gameObject parent, float speed, color projectileColor) {
    this.index = index;
    this.parent = parent;
    this.x = parent.parent.x;
    this.y = parent.parent.y;
    this.speed = speed;
    this.projectileColor = projectileColor;
    
    collider = new collider(40, 6, this, true);
    //parent.gameHandler.collisionChecker.addCollider(collider);
  }
  
  public projectile(int index, gameObject parent, float x, float y, float speed, PImage sprite) {
    this.index = index;
    this.parent = parent;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.sprite = sprite;
    
    collider = new collider(40, 6, this, true);
    parent.gameHandler.collisionChecker.addCollider(collider);
  }
  
  public @Override void update() {
    x += speed;
    if (sprite == null) {
      strokeWeight(6);
      stroke(projectileColor);
      line(x-20, y, x+20, y);
    }
    
    if (x > width + 10) {
      parent.destroy(index);
    }
  }
  
  public @Override void onCollision(collider other) {
    parent.destroy(index);
  }
}
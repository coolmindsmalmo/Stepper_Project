class collider {
  int w, h, x1, x2, y1, y2;
  gameObject parent;
  boolean friendly;
  
  public collider(int w, int h, gameObject parent, boolean friendly) {
    this.w = w/2;
    this.h = h/2;
    this.parent = parent;      
    this.friendly = friendly;
  }
  
  public void updateBonds() {
    x1 = int(parent.x-w);
    x2 = int(parent.x+w);
    y1 = int(parent.y-w);
    y2 = int(parent.y+w);
  }
}
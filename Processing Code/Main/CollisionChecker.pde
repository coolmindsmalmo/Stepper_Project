class collisionChecker extends gameObject {
  collider friendlyColliders[] = new collider[0];
  collider enemyColliders[] = new collider[0];

  public collisionChecker() {
  }

  public @Override void update() {
    println("RUNNING");
    for (int i = 0; i < friendlyColliders.length; i++) {
      if (friendlyColliders[i] == null) {
        removeCollider(friendlyColliders, i);
      } else {
        for (int i2 = 0; i2 < enemyColliders.length; i2++) {
          if (enemyColliders[i2] == null) {
            removeCollider(enemyColliders, i2);
          } else {
            checkCollisions(friendlyColliders[i], enemyColliders[i2]);
          }
        }
      }
    }
  }

  private  void checkCollisions(collider friendly, collider enemy) {
    friendly.updateBonds();
    enemy.updateBonds();
    if (friendly.x2 > enemy.x1 && friendly.x1 < enemy.x2) {
      if (friendly.y2 > enemy.y1 && friendly.y1 < enemy.y2) {       
        friendly.parent.onCollision(enemy);
        enemy.parent.onCollision(friendly);
      }
    }
  }

  public void addCollider(collider newCollider) {
    println("ADDED COLLIDER");
    collider oldColliderArray[];
    if (newCollider.friendly == true) oldColliderArray = friendlyColliders;
    else oldColliderArray = enemyColliders;

    collider newColliderArray[] = new collider[oldColliderArray.length+1];

    for (int i = 0; i < newColliderArray.length; i++) {
      if (i == oldColliderArray.length) {
        newColliderArray[i] = newCollider;
      } else {
        newColliderArray[i] = oldColliderArray[i];
      }
    }

    if (newCollider.friendly == true) friendlyColliders = newColliderArray;
    else enemyColliders = newColliderArray;
  }

  public void removeCollider(collider[] colliderArray, int index) {

    collider newColliderArray[] = new collider[colliderArray.length+1];

    int diffCorrection = 0;
    for (int i = 0; i < newColliderArray.length; i++) {
      if (i == index) {
        i++; 
        diffCorrection = 1;
      } else {
        newColliderArray[i-diffCorrection] = colliderArray[i];
      }
    }
  }
}
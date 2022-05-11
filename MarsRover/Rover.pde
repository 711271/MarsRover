public class Rover {
  public PVector pos, prePos;
  public PImage img;
  public float SIZE;

  public Rover(PVector spawnPoint) {
    this.pos = spawnPoint;
    this.img = loadImage("rover.png");
    this.SIZE = SCALE * 5;
  }

  public void show() {
    image(img, pos.x, pos.y, SIZE, SIZE);
  }

  public void move(float[][] t, Goal g) {
    prePos = pos.copy();
    PVector vel = pursue(t, g);
    pos.add(vel);
  }
  public PVector safestDirection(float[][] t, Goal g) {
    PVector dir = new PVector(0, 0);
    float nearest = Float.MAX_VALUE;
    float currAlt = t[(int)pos.y][(int)pos.x];
    for (int i = 0; i <= 1; i++) {
      for (int j = 0; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        if (PVector.sub(pos, prePos).mag() < 0.5 ) continue;
        float alt = t[(int)pos.y+i][(int)pos.x+j];
        float change = alt - currAlt;
        if (change < nearest) {
          dir = new PVector(i, j);
          nearest = change;
        }
      }
    }
    return dir;
  }
   public PVector pursue(float[][] t, Goal g) {
    PVector toTarget = PVector.sub(g.pos, pos);
    PVector dir = new PVector(0, 0);
    float nearest = Float.MAX_VALUE;
    float currAlt = t[(int)pos.y][(int)pos.x];
    for (int i = 0; i <= 1; i++) {
      for (int j = 0; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        if (PVector.sub(pos, prePos).mag() < 0.5 ) continue;
        float alt = t[(int)pos.y+i][(int)pos.x+j];
        float change = alt - currAlt;
        if (change < nearest) {
          dir = new PVector(i, j);
          nearest = change;
        }
      }
    }
    return toTarget.limit(3);
}
}

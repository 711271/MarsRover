public class Surface {
  public float[][] terrain;

  public Surface(float w, float h) {
    noStroke();
    terrain = new float[(int)h][(int)w];
    float xOff = 0.0, yOff = 0.0, inc = 0.02;
    for (int i = 0; i < h; i++) {
      for (int j = 0; j < w; j++) {
        terrain[i][j] = noise(xOff, yOff);
        xOff += inc;
      }
      yOff += inc;
      xOff = 0.0;
    }
  }

  public void show() {
    for (int i = 0; i < terrain.length; i++) {
      for (int j = 0; j < terrain[0].length; j++) {
        //System.out.println(terrain[i][j]);
        fill(terrain[i][j]*255, 50, 200);
        square(j*SCALE, i*SCALE, SCALE);
      }
    }
  }

  public float highestPoint() {
    float highest = 0;
    for (int i = 0; i < terrain.length; i++) {
      for (int j =0; j < terrain[0].length; j++) {
        if (terrain[i][j] > 2) {
          highest = terrain[i][j];
        }
      }
    }
    return highest;
  }
    public float lowestPoint() {
    float highest = 0;
    for (int i = 0; i < terrain.length; i++) {
      for (int j =0; j < terrain[0].length; j++) {
        if (terrain[i][j] > 2) {
          highest = terrain[i][j];
        }
      }
    }
    return highest;
  }
    public float avergeAltitude() {
    float highest = 0;
    for (int i = 0; i < terrain.length; i++) {
      for (int j =0; j < terrain[0].length; j++) {
        if (terrain[i][j] > 2) {
          highest = terrain[i][j];
        }
      }
    }
    return highest;
  }
}

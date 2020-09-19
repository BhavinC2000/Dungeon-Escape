class Map {

  PImage background;
  PImage[][] field;
  boolean[][] isWater;
  PImage goal;
  int goalx;
  int goaly;
  
  Map() {
    background = loadImage("water.png");
    goal = loadImage("goal.png");
    field = new PImage[29][18];
    isWater = new boolean[29][18];
    for (int i = 0; i < 29; i++) {
      for (int j = 0; j < 18; j ++) {
        float x = random(0, 100);
        if (x <= 50) {
          field[i][j] = loadImage("grass.png");
          isWater[i][j] = false;
        } else {
          field[i][j] = null;
          isWater[i][j] = true;
        }
      }
    }
    goalx = (int) random(1, 28);
    goaly = (int) random(1, 17);
    isWater[goalx][goaly] = false;
    adjustMap();
  }
  
  
  void display() {
    image(background, 0, 0);
     for (int i = 0; i < 29; i ++) {
       for (int j = 0; j < 18; j ++) {
         if (field[i][j] == null) {
             //
         } else {
           image(field[i][j], i * 30, j * 30);
         }
       }
     }
     image(goal, goalx * 30, goaly * 30);
       
  }
  
  Map newMap() {
    mapComplete = false;
    return new Map();
  }
  
  boolean[][] getIsWater() {
    return isWater;
  }
  
  int getGoalX() {
    return goalx * 30;
  }
  
  int getGoalY () {
    return goaly * 30;
  }
  
  void adjustMap() {
    for (int i = 1; i < 28; i++) {
      for (int j = 1; j < 17; j ++) {
        //if (!isWater[i][j]) {
        //  if (isSurrounded(i, j)) {
        //    addGrass(i, j);
        //  }
        //}
        if (!isWater[i][j]) {
          boolean[] sides = isSurrounded(i, j);
          if (!greaterThanTwo(sides)) {
            addGrass(i, j, sides);
          }
        }
      }
    }
  }
  
  boolean[] isSurrounded (int x, int y) {
    boolean[] sides = new boolean[4];
      if (!isWater[x-1][y]) {
        sides[0] = true;
      }
      if (!isWater[x+1][y]) {
        sides[1] = true;
      }
      if (!isWater[x][y-1]) {
        sides[2] = true;
      }
      if (!isWater[x][y+1]) {
        sides[3] = true;
      }
    return sides;
      
  }
  void addGrass (int x, int y, boolean[] sides) {
    int side = (int) random(4);
    int count = 0;
    while (count < 3) {
      if (sides[side]) {
        side = (side + 1) %4;
        count++;
      } else {
        if (side == 0) {
          field[x-1][y] = loadImage("grass.png");
          isWater[x-1][y] = false;
        } else if (side == 1) {
          field[x+1][y] = loadImage("grass.png");
          isWater[x+1][y] = false;
        } else if (side == 2) {
          field[x][y-1] = loadImage("grass.png");
          isWater[x][y-1] = false;
        } else {
          field[x][y+1] = loadImage("grass.png");
          isWater[x][y+1] = false;
        }
        count++;
      }
    }
  }
  
  boolean greaterThanTwo(boolean[] sides) {
    int count = 0;
    for (int i = 0; i < sides.length; i++) {
      if (sides[i]) {
        count++;
      }
    }
    return count >= 2;
  }
}

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
        if (x < 80) {
          field[i][j] = loadImage("grass.png");
          isWater[i][j] = false;
        } else {
          field[i][j] = null;
          isWater[i][j] = true;
        }
      }
    }
    goalx = (int) random(27);
    goaly = (int) random(17);
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
     if (isWater[goalx][goaly]) {
       isWater[goalx][goaly] = false;
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
  
}

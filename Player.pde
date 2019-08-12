class Player {

  int x;
  int deltax;
  int deltay;
  int y;
  Map map;
  boolean leftblock;
  boolean rightblock;
  boolean upblock;
  boolean downblock;


  Player(int x, int y, Map map) {
    this.x = x;
    this.y = y;
    this.deltax = 0;
    this.deltay = 0;
    this.map = map;
    leftblock = false;
    rightblock = false;
    upblock = false;
    downblock = false;
  }

  void move (int vert, int hor) {
    x += hor;
    y += vert;
  }

  void display () {
    stroke(0);
    fill(127);
    keyTyped();
    rect(x, y, 30, 30);
    win();
  }

  void keyTyped() {
    int x = 0;
    int y = 0;
    checkWater();
    if (keyPressed) {
      if (keyCode == DOWN && !downblock) {
        y += 30;
      } else if (keyCode == UP && !upblock) {
        y -= 30;
      } else if (keyCode == LEFT && !leftblock) {
        x -= 30;
      } else if (keyCode == RIGHT && !rightblock) {
        x += 30;
      }
      player.move(y, x);
    } 
  }

  void checkWater() {
    if (x <= 0) {
      leftblock = true;
    } else if (keyCode == LEFT && map.getIsWater()[x / 30 - 1][y / 30]) {
      leftblock = true;
    } else {
      leftblock = false;
    }
    if (x >= 840) {
      rightblock = true;
    } else if (keyCode == RIGHT && map.getIsWater()[x / 30 + 1][y / 30]) {
      rightblock = true;
    } else {
      rightblock = false;
    }
    if (y <= 0) {
      upblock = true;
    } else if (keyCode == UP && map.getIsWater()[x / 30][y / 30 - 1]) {
      upblock = true;
    } else {
      upblock = false;
    }
    if (y >= 510) {
      downblock = true;
    } else if (keyCode == DOWN && map.getIsWater()[x / 30][y / 30 + 1]) {
      downblock = true;
    } else {
      downblock = false;
    }
  }
  
  void win() {
    if (x == map.getGoalX() && y == map.getGoalY()) {
      mapComplete = true;
    }
  }
}

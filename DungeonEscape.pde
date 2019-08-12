Player player;
TitleScreen title;
Map map;
boolean playing = false;
boolean mapComplete = false;
boolean battling = false;
Timer time;
boolean lose;
GameOver gameOver;
LevelCounter level;

void setup() {
  size(870, 540);
  frameRate(15);
  map = new Map();
  player = new Player((int) random(27) * 30, (int) random(17) * 30, map);
  title = new TitleScreen();
  time = new Timer();
  lose = false;
  gameOver = new GameOver();
  level = new LevelCounter(1);
}

void draw() {
  background(255);
  if (!playing) {
    title.display();
  } else {
    if (mapComplete) {
      map = map.newMap();
      player = new Player((int) random(27) * 30, (int) random(17) * 30, map);
      player.move(0, 0);
      mapComplete = false;
      time = new Timer();
      level.nextLevel();
    } else if (!lose) {
     map.display();
     player.display();
     time.display();
     level.display();
    } else {
      gameOver.display();
      level= new LevelCounter(0);
    }
  }
}

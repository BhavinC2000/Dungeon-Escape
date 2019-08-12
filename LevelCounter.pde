class LevelCounter {
 int level;
 
 LevelCounter(int x) {
   level = x;
 }
 
 void display() {
   textSize(40);
   fill(51);
   text("Level " + level, 750, 40);
 }
 
 void nextLevel() {
   level++;
 }
 
}

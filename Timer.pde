class Timer {
 int time;
 int frameCounter;
 int frames;
 
 Timer() {
   time = 60;
   frameCounter = 0;
   frames = 15;
 }
 
 void display() {
   textSize(50);
   fill(51);
   text(time + "", 30, 40);
   frameCounter += frames;
   if (frameCounter % 30 == 0) {
     time--;
     frameCounter = 0;
   }
   loss();
 }
 
  void loss() {
    if (time == 0) {
      lose = true;
    }
  }
}

    

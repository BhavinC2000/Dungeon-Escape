class TitleScreen {

  PImage image;
  PShape playButton;
  boolean play;

  TitleScreen() {
    image = loadImage("title.png");
    playButton = createShape(RECT, 0, 0, 200, 50);
    play = false;
  }
  
  void display() {
    image(image, -7.5, -7.5);
    textSize(50);
    textAlign(CENTER);
    fill(51);
    text("Dungeon Escape", width / 2, height / 3);
    fill(onPlay());
    shape(playButton, width / 2.6, height / 2);
    textSize(40);
    textAlign(CENTER);
    text("Play", width / 2, height / 1.75);
    mouseClicked();
  }
  
  int onPlay() {
    if (mouseX >= width / 2.6 && mouseX <= width / 2.6 + 200 && mouseY >= height / 2 && mouseY <= height / 2 + 50) {
      return 200;
    } else {
      return 0;
    }
  }
    
  void mouseClicked() {
    if (mouseX >= width / 2.6 && mouseX <= width / 2.6 + 200 && mouseY >= height / 2 && mouseY <= height / 2 + 50 && mousePressed) {
      playing = true;
    }
  }
  
}

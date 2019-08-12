class GameOver {
  PImage image;
  PShape playAgainButton;
  boolean playAgain;

  GameOver() {
    image = loadImage("title.png");
    playAgainButton = createShape(RECT, 0, 0, 225, 50);
    playAgain = false;
  }
  
  void display() {
    image(image, -7.5, -7.5);
    textSize(50);
    textAlign(CENTER);
    fill(51);
    text("GAME OVER", width / 2, height / 3);
    fill(onPlay());
    shape(playAgainButton, width / 2.7, height / 2);
    textSize(40);
    textAlign(CENTER);
    text("Play Again?", width / 2, height / 1.75);
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
      lose = false;
      mapComplete = true;
    }
  }
  
}

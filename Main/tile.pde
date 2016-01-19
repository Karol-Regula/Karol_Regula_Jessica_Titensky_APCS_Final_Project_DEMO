import java.util.Random;
class Tile {
  public color bodyColor;//creates the color variable, think of "color" as you would think of an "int"
  public char letter;
  public int score;
  public boolean placed;
  public int xpos;
  public int ypos;
  public int origx;
  public int origy;
  public String owner;

  public Tile(char whatLetter, int whatScore) {//have to rework xplace, might be redundant
    placed = false;
    bodyColor = color(180, 102, 5);
    letter = whatLetter;
    score = whatScore;
    xpos = 10000;
    ypos = 10000;//offsceen so that the method that reverts a placed tile does not print all unused tiles in top left corner.
    origx= 10000;//top left vertex xpos, randomly scattered for now, still need to be acessed but we still don't have a nice permanenet place for them
    origy= 10000;//top left vertex ypos
    owner="";
  }

  public void print(color whatColor) {
    PFont f = createFont("Arial", 16, true);
    bodyColor = whatColor;
    fill(bodyColor);  
    rect(xpos+xd, ypos+yd, size, size);
    textFont(f, 23);
    fill(0, 0, 0);//this means that all of the shapes that are made will be filled until noFill() is run
    if (letter == 'I' || letter == 'J') {
      text(letter, xpos + (size/2) -size/5+xd + 4, ypos + (size/2) +size/5+yd);
    } else if (letter == 'W') {
      text(letter, xpos + (size/2) -size/5+xd  - 3, ypos + (size/2) +size/5+yd);
    } else {
      text(letter, xpos + (size/2) -size/5+xd, ypos + (size/2) +size/5+yd);//has some manual adjustments made for now //===================================need to manually adjust
    }

    textFont(f, 9);
    if (score == 10) {
      text(score, xpos + (size/2) + 6+xd, ypos + (size/2) + 16+yd);
    } else {
      text(score, xpos + (size/2) + 10+xd, ypos + (size/2) + 16+yd);
    }

    //testing
    //rect(90,90,30,30);//for now just a rectangle, tiles obviously have more variables
  }

  public int getxpos() {
    return xpos;
  }

  public int getypos() {
    return ypos;
  }
}
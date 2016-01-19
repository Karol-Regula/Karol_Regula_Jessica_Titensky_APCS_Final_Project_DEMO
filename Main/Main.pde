String mode;// literally determines what mode game is in

GameScreen g1 = new GameScreen();//made these into global(ish) variables so that they do not have to re-initialized in every method that uses their methods
MainMenu m1 = new MainMenu();
public int size;
public int xd, yd;

void setup() {
  size = 35;
  xd=175;
  yd=70;
  frameRate(120);
  //runs only at the beginning and does the initializing stuff
  //size(17 * size, 17 * size);//does not work, will not accept variables
  size(875, 735);//window size
  background(255, 255, 0);//background color
  //noStroke();//disables border
  //fill(0, 102);//sets color used for filling
  mode = "mainMenu";//sets mode
  MainMenu m1 = new MainMenu();
  m1.setupMenu();//creates all the menus
}

void mouseClicked() {
  if (mode=="gameScreen") {
    g1.mouseClicked();
  }
}

void draw() {
  if (mode == "mainMenu") {// all the menu buttons would exist here
    m1.select();//detects mouse presses and where the mouse it
  }
  if (mode == "gameScreen") {//would print the board and tiles and run the game code
    //g1.detect();
    //g1.mouseClicked();
  }
  if (mousePressed) {//testing purposes
    // System.out.println(mouseX - xd + " " + mouseY); prints mouse position into console
  }
  //mouse pressed moved to MainMenu class
}

//To do list
//make boards and stuff into gloabl variables to avoid making new ones
//clicking and dragging, redraw board and tiles
//work out percentages for tiles
//news gothic standard font
//if time, computer predicts moves of player and adjusts accordinglly
//overhaul coordinate system
//size command that makes window will not accept variables
//read rules
//some letters look off center, might need to add special adjustments for those

//bugs
//Tiles stack on top of each other and then move as one big pile
//Clicking outiside of button on main menu causes the entirety of processing to hang//FIXED
//letter on tile changes with movement //FIXED
//letters on tiles shift slightly when highlighted, should make the print method the only thing that displays tiles.
//legit() seems to try to access the file waay too many times(>100).

//http://www.mieliestronk.com/corncob_caps.txt
//make scores
//player class
//timer/padding
//on main menu--size

//make dict1 load only once, also make AI only do hasNow getting once per dict1 word
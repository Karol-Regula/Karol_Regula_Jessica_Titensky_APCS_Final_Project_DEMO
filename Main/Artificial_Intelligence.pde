public class AI extends GameScreen {
  int level;
  String[] dict1 = loadStrings("words1.txt");
  ArrayList<Tile> hasNow;
  //ArrayList<ArrayList<Integer>> scoreIndexX = new ArrayList<ArrayList<Integer>>(); //this is different every turn
  //ArrayList<ArrayList<Integer>> scoreIndexY = new ArrayList<ArrayList<Integer>>(); //this is different every turn
  ArrayList<Integer> scoreIndexX = new ArrayList<Integer>(); //this is different every turn
  ArrayList<Integer> scoreIndexY = new ArrayList<Integer>(); //this is different every turn
  int currentWordTested = 0;

  public AI() {
    level = 0;
  }

  public ArrayList<Tile> grabTiles() {//produces an ArrayList of tiles that the AI has that particular turn
    ArrayList<Tile> hasNow = new ArrayList<Tile>();
    for (int i = 0; i < g1.tileDescription.size(); i ++) {
      if (g1.tileDescription.get(i).owner == g1.activePlayer().name && g1.tileDescription.get(i).placed != true) {
        hasNow.add(g1.tileDescription.get(i));
      }
    }
    //debugging
    /*
    System.out.println("hasNow:");
     for (int i = 0; i < hasNow.size(); i++) {
     System.out.println(hasNow.get(i).letter);
     }
     */
    return hasNow;
  }

  public ArrayList<ArrayList<Tile>> wordsPossible() {//checks every word in the words file and stores those that can be made with owned tiles in ArrayList
    ArrayList<ArrayList<Tile>> possibleWords = new ArrayList<ArrayList<Tile>>();
    ArrayList<Tile> hasNow = grabTiles();
    ArrayList<Tile> copy = new ArrayList<Tile>();
    String word = "";
    updateHasNow();
    for (int i = 0; i < dict1.length; i++) {
      //System.out.println(i);
      word = dict1[i];
      if (canMake(word)) {
        System.out.println(word);
        for (int x = 0; x < hasNow.size(); x++) {
          copy.add(hasNow.get(x));
        }
        ArrayList<Tile> current = new ArrayList<Tile>();
        while (word.length() > 0) {
          for (int k = 0; k < copy.size(); k++) {
            if (copy.get(k).letter == word.charAt(0)) {
              word = word.substring(1, word.length());
              System.out.println("word: "+word);
              current.add(copy.get(k));
              copy.remove(k);
              k--;
              if (word.length() == 0) {
                k += 1000;
              }
            }
          }
        }
        if (current.size() > 0) {
          System.out.println("here 101");
          for (int m = 0; m < current.size(); m++) {
            System.out.println(current.get(m).letter);
          }
          possibleWords.add(current);
        }
      }
    }
    //debugging
    for (int i = 0; i < possibleWords.size(); i++) {
      for (int j = 0; j < possibleWords.get(i).size(); j++) {
        System.out.print(possibleWords.get(i).get(j).letter);
      }
      System.out.println();
    }
    return possibleWords;
  }

  public boolean canMake(String word) {//checks if the given word can be made using the tiles the AI has
    //hasNow = grabTiles();//re doing this 58k times is extremely inefficient, fix if slow
    ArrayList<Tile> copy = new ArrayList<Tile>();
    for (int x = 0; x < hasNow.size(); x++) {
      copy.add(hasNow.get(x));
    }
    for (int i = 0; i < word.length(); i++) {
      for (int j = 0; j < copy.size(); j++) {
        if (copy.get(j).letter == word.charAt(i)) {
          copy.remove(j);
          j += 1000;
          word = word.substring(1, word.length());
          i--;
        }
      }
    }
    if (word.length() == 0) {
      System.out.println("canMake() == true)");
      return true;
    }
    return false;
  }

  public void tryAllWords() {//tries to insert all of the words into all avaliable posisions on the board
    ArrayList<ArrayList<Tile>> possibleWords = wordsPossible();
    //prepareScoreIndexes();
    for (int i = 0; i < possibleWords.size(); i++) {
      //currentWordTested = i;
      //tryWord(possibleWords.get(i));
    }
    //printScoreIndexes();
  }

  public void prepareScoreIndexes(){
    while (scoreIndexX.size() > 0){
      scoreIndexX.remove(0);
    }
    while (scoreIndexY.size() > 0){
      scoreIndexY.remove(0);
    }
  }
  
  public void printScoreIndexes(){//method only for debuggin'
    for (int x = 0; x < scoreIndexX.size(); x++){
      if (scoreIndexX.get(x) > 0){
        System.out.println("scoreIndexX, position: "+x+"value: "+scoreIndexX.get(x));
      }
    }
    for (int x = 0; x < scoreIndexY.size(); x++){
      if (scoreIndexY.get(x) > 0){
        System.out.println("scoreIndexY, position: "+x+"value: "+scoreIndexY.get(x));
      }
    }
  }

  public void tryWord(ArrayList<Tile> input) {//tries all possible positions for one word
    int score = 0;
    for (int i = 2 * size; i < 17 * size; i+= size) {//first weird for loops I ever wrote//ydimension//horizontal
      for (int j = 5 * size; j < 20 * size; j+= size) {//xdimension
        for (int x = 0; x < input.size(); x++) {
          input.get(x).xpos = j + x * size;
          input.get(x).ypos = i;
          if (legit() && legitt()) {
            for (int k = 0; k<tileDescription.size(); k++) {
              Tile t =tileDescription.get(k);
              if (t.origy!=t.ypos) {
                t.placed=true;
                score+=t.score*multt(t.xpos, t.ypos);
              }
              t.origx=t.xpos;
              t.origy=t.ypos;
            }
            scoreIndexX.add(score);
            score = 0;
          }else{
            scoreIndexX.add(0);
          }
          gray();
        }
      }
    }
    for (int i = 2 * size; i < 17 * size; i+= size) {//first weird for loops I ever wrote//ydimension//vertical
      for (int j = 5 * size; j < 20 * size; j+= size) {//xdimension
        for (int x = 0; x < input.size(); x++) {
          input.get(x).xpos = j;
          input.get(x).ypos = i + x * size;
          if (legit() && legitt()) {
            for (int k = 0; k<tileDescription.size(); k++) {
              Tile t =tileDescription.get(k);
              if (t.origy!=t.ypos) {
                t.placed=true;
                score+=t.score*multt(t.xpos, t.ypos);
              }
              t.origx=t.xpos;
              t.origy=t.ypos;
            }
            scoreIndexY.add(score);
            score = 0;
          }else{
            scoreIndexY.add(0);
          }
          gray();
        }
      }
    }
  }

  public void updateHasNow() {
    hasNow = grabTiles();
  }
}
public class Player {
  int score;
  String name;
  //ArrayList<Tile> hasTiles = new ArrayList<Tile>();//will store player's tiles because we will have to cycle the players and the game has to remember this. 
  boolean isTurn;
  boolean isAI;

  public Player(String x, boolean makeAI) {
    score = 0;
    name = "Player "+x;
    isTurn=false;
    isAI = makeAI;
  }
}
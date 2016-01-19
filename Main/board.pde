class Board extends GameScreen {

  public int[][] mult;

  int w=width/size, h=height/size, s=size;

  void ddraw() {
    mult= new int[15][15];
    int[][][]colors=new int[8][8][3];
    for (int i=0; i<8; i++) {
      for (int j=0; j<8; j++) {
        mult[i][j]=1;
        for (int k=0; k<3; k++) {
          colors[i][j][k]=255;
        }
      }
    }
    colors[0][0][0]=255;
    colors[0][0][1]=128;
    colors[0][0][2]=0;
    colors[0][7]=colors[7][0]=colors[0][0];
    mult[0][7]=mult[7][0]=mult[0][0]=3;
    colors[0][3][0]=0;
    colors[0][3][1]=128;
    colors[0][3][2]=255;
    colors[3][0]=colors[6][2]=colors[7][3]=colors[3][7]=colors[2][6]=colors[6][6]=colors[0][3];
    mult[3][0]=mult[6][2]=mult[7][3]=mult[3][7]=mult[2][6]=mult[6][6]=mult[0][3]=2;
    colors[5][1][0]=0;
    colors[5][1][1]=255;
    colors[5][1][2]=0;
    colors[1][5]=colors[5][5]=colors[5][1];
    mult[1][5]=mult[5][5]=mult[5][1]=3;
    colors[1][1][0]=255;
    colors[1][1][1]=0;
    colors[1][1][2]=0;
    colors[2][2]=colors[3][3]=colors[4][4]=colors[7][7]=colors[1][1];  
    mult[2][2]=mult[3][3]=mult[4][4]=mult[7][7]=mult[1][1]=2;

    background(255, 255, 255);  
    //background(#F0E2B3);
    /*
    for (int i=0; i<w; i++) {
     line(i*s, 0, i*s, height);
     }
     for (int i=0; i<h; i++) {
     line(0, i*s, width, i*s);
     }
     */

    for (int i=0; i<8; i++) {
      for (int j=0; j<8; j++) {
        fill(colors[i][j][0], colors[i][j][1], colors[i][j][2]);
        rect(i*s+xd, j*s+yd, s, s);
      }
    }
    for (int i=8; i<15; i++) {
      for (int j=0; j<8; j++) {
        fill(colors[14-i][j][0], colors[14-i][j][1], colors[14-i][j][2]);
        rect(i*s+xd, j*s+yd, s, s);
        mult[i][j]=mult[14-i][j];
      }
    }  
    for (int i=0; i<8; i++) {
      for (int j=8; j<15; j++) {
        fill(colors[i][14-j][0], colors[i][14-j][1], colors[i][14-j][2]);
        rect(i*s+xd, j*s+yd, s, s);
        mult[i][j]=mult[i][14-j];
      }
    }  
    for (int i=8; i<15; i++) {
      for (int j=8; j<15; j++) {
        fill(colors[14-i][14-j][0], colors[14-i][14-j][1], colors[14-i][14-j][2]);
        rect(i*s+xd, j*s+yd, s, s);
        mult[i][j]=mult[14-i][14-j];
      }
    }


    fill(0, 0, 0);
    rect(16*size+xd, 16*size+yd, size*2.5, size); //finalize tiles changes on board
    fill(126, 126, 126);
    rect(16*size+xd, 15*size+yd-10, size*2.5, size); //put unfinalized tiles back on rack
    fill(0, 0, 0);
    rect(5*size, 1*size + 3*(size/4) +2, 15*size, size/4);
    rect(4*size + 3*(size/4) +2, 1*size + 3*(size/4) +2, size/4, 15*size + size/2);
    rect(4*size + 3*(size/4) +2, 17*size, size*15 + size/2, size/4);
    rect(20*size, size + + 3*(size/4) +2, size/4, size*15 + size/2);
    fill(148, 30, 39);
    rect(width-size*2, 0, size*2, size); //leave
    fill(255, 255, 255);
    PFont f = createFont("Arial", 16, true);
    textFont(f, 23);
    textSize(25);
    text("Exit", width-2*size+12, 28);
    text("Play", 16*size+xd+20, 16*size+yd+28);
    text("Undo", 16*size+xd+16, 15*size+yd-10+28);
  }

  public void scoreBoard() {
    PFont f = createFont("Arial", 16, true);
    noStroke();
    fill(255, 255, 255);
    rect(21 * size, 4 * size, 24 * size, 8 * size);
    fill(#516DD8);
    rect(21 * size + size / 2, 3 * size, 3 * size, size);
    textFont(f, 15);
    fill(0, 0, 0);
    text("Score Board", 21 * size + size / 2 + 8, 3 * size + size /2 + 5);
    //settings for for loop
    fill(0, 0, 0);
    textFont(f, 12);
    for (int i = 0; i < g1.players.size(); i++) {
      fill(#7993F5);
      rect(21 * size + size / 2, 4 * size + i * size, 3 * size, size);
      fill(0, 0, 0);
      text(g1.players.get(i).name+":", 22 * size, 5 * size + i * size - 15);
      text(g1.players.get(i).score, 23 * size + 25, 5 * size + i * size - 15);
    }
    stroke(1);
  }
}
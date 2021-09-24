import 'dart:math';

import 'package:mine_sweeper_2/page/game_page.dart';

void setBoard() {
  for(int i=0;i<rows;i++)
    for(int j=0;j<cols;j++)
    {
      board[i][j].bombsAround=0;
      board[i][j].hasBomb=false;
      board[i][j].isFlagged=false;
      board[i][j].isOpen=false;
    }
  remainingTiles=rows*cols;
  int count=bombs;
  print("setboard called");
  while(count>0) {
    Random random = new Random();
    int randomNum = random.nextInt(81);
    int rowC = ((randomNum/9)-1).toInt();
    int colC = (randomNum%9).toInt();
    if(!board[rowC][colC].hasBomb) {
      board[rowC][colC].hasBomb=true;
     // board[rowC][colC].isOpen=true;
      count--;
    }
  }
  countBombs();
}

void countBombs() {
  for (int i = 0; i < rows; i++) {
    for(int j=0;j<cols;j++) {
       if(0<=(i-1)&&(i-1)<rows&&0<=(j-1)&&(j-1)<cols)
        if(board[i-1][j-1].hasBomb)
          board[i][j].bombsAround++;

      if(0<=(i-1)&&(i-1)<rows&&0<=(j)&&(j)<cols)
        if(board[i-1][j].hasBomb)
          board[i][j].bombsAround++;

      if(0<=(i-1)&&(i-1)<rows&&0<=(j+1)&&(j+1)<cols)
        if(board[i-1][j+1].hasBomb)
          board[i][j].bombsAround++;

       if(0<=(i)&&(i)<rows&&0<=(j+1)&&(j+1)<cols)
        if(board[i][j+1].hasBomb)
          board[i][j].bombsAround++;

      if(0<=(i+1)&&(i+1)<rows&&0<=(j+1)&&(j+1)<cols)
        if(board[i+1][j+1].hasBomb)
          board[i][j].bombsAround++;

      if(0<=(i+1)&&(i+1)<rows&&0<=(j)&&(j)<cols)
        if(board[i+1][j].hasBomb)
          board[i][j].bombsAround++;

      if(0<=(i+1)&&(i+1)<rows&&0<=(j-1)&&(j-1)<cols)
        if(board[i+1][j-1].hasBomb)
          board[i][j].bombsAround++;

      if(0<=(i)&&(i)<rows&&0<=(j-1)&&(j-1)<cols)
        if(board[i][j-1].hasBomb)
          board[i][j].bombsAround++;

    }
  }
}

bool isWon () {
  if(remainingTiles<=bombs) {
  print("you won");
  return true; }

  else print("Not yet");
  return false;
}
class BoardSquare {
  bool hasBomb;
  int bombsAround;
  bool isOpen;
  bool isFlagged;

  BoardSquare({this.hasBomb=false,this.bombsAround=0,this.isOpen=false,this.isFlagged=false});
}
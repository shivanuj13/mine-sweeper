import 'package:flutter/material.dart';
import 'package:mine_sweeper_2/page/game_page.dart';

import 'functions.dart';

class Square extends StatefulWidget {
  //Square({Key? key}) : super(key: key);
  final int? rowNum;
  final int? colNum;
  Square({this.rowNum,this.colNum});
  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
   if (board[widget.rowNum!][widget.colNum!].isOpen) {
     return OpenTile(rowNum: widget.rowNum,colNum: widget.colNum,);
   } else {
     return CoveredTile(rowNum: widget.rowNum,colNum: widget.colNum,);
   }
  }
}

class CoveredTile extends StatefulWidget {
  //CoveredTile({Key? key}) : super(key: key);
  final int? rowNum;
  final int? colNum;
  CoveredTile({this.rowNum,this.colNum});
  @override
  _CoveredTileState createState() => _CoveredTileState();
}

class _CoveredTileState extends State<CoveredTile> {
  @override
  Widget build(BuildContext context) {
    if(board[widget.rowNum!][widget.colNum!].isFlagged) {
      return Stack(
        children: [
           Center(
            child: Container(
            color: Colors.grey[600],margin: EdgeInsets.all(2.0),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
           decoration: BoxDecoration(
            color: Colors.grey[600],
             boxShadow: [BoxShadow(
               color: Colors.black26,
               offset: Offset(-2.0, -2.0)
             )],
             ),
            margin: EdgeInsets.all(5.0),
            child: Center(child: Icon(Icons.flag,color: Colors.red[700],),),
          )
        ],
    );
    } else
    return 
      Stack(
        children: [
           Center(
            child: Container(
            color: Colors.black12,margin: EdgeInsets.all(2.0),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
           decoration: BoxDecoration(
            color: Colors.black12,
             boxShadow: [BoxShadow(
               color: Colors.black26,
               offset: Offset(-2.0, -2.0)
             )],
             ),
            margin: EdgeInsets.all(5.0),
          )
        ],
    );

    
    
  }
}

class OpenTile extends StatefulWidget {
 // OpenTile({Key? key}) : super(key: key);
  final int? rowNum;
  final int? colNum;
  OpenTile({this.rowNum,this.colNum});
  @override
  _OpenTileState createState() => _OpenTileState();
}

class _OpenTileState extends State<OpenTile> {
  @override
  Widget build(BuildContext context) {
    if(board[widget.rowNum!][widget.colNum!].hasBomb && board[widget.rowNum!][widget.colNum!].isOpen)
    return Container(
      color: Colors.black12,
      margin: EdgeInsets.all(2.0),
      child: Center(
        child: Text("\u2739",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
    if(board[widget.rowNum!][widget.colNum!].bombsAround==0)
    return Container(
      color: Colors.black12,
      margin: EdgeInsets.all(2.0),
    );
    
    return Container(
      color: Colors.black12,
      margin: EdgeInsets.all(2.0),
      child: Center(child: Text(board[widget.rowNum!][widget.colNum!].bombsAround.toString(),style: TextStyle(color: myColor(board[widget.rowNum!][widget.colNum!].bombsAround),fontSize: 27,fontWeight: FontWeight.bold))),
    );
  }
}
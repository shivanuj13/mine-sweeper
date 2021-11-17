
import 'package:flutter/material.dart';
import 'package:mine_sweeper_2/model/board_square.dart';
import 'package:mine_sweeper_2/utility/components.dart';
import 'package:mine_sweeper_2/utility/functions.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
   setBoard();
    // super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Text("Mine Sweeper",style: TextStyle(fontSize: 25,),),
            InkWell(
              onTap: (){
                setState(() {
                  setBoard();
                });
              },
              child: Center(
                child: Icon(Icons.restart_alt,size: 40,color: Colors.black87,))),
          ],
        ),
        
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50,left: 10,right: 10),
          child: GridView.count(
            crossAxisCount: 9,
            children: [
              for (int i = 0; i < rows; i++) 
              for (int j = 0; j < cols; j++)
              //if(j>i) 
              InkWell(
                onTap: ()
                {
                  if(board[i][j].hasBomb) {
                  print("you lost");
                  showDialog(
                   context: context,
                   barrierDismissible: false,
                   builder: (context) {
                  return AlertDialog(
                   title: Text("Game Over!"),
                    content: Text("You have pressed the mine!"),
                   actions: <Widget>[
                    ElevatedButton(
                    onPressed: () {
                    setState(() {
                     setBoard();
                    });
                    Navigator.pop(context);
                  },
                   child: Text("Play again"),
                 ),
                ],
               );
              },
             );
                  }

                  if(!board[i][j].isOpen&& !board[i][j].hasBomb)
                  remainingTiles--;
                  setState(() {
                    board[i][j].isOpen=true;
                  });
                   if(isWon())
                   showDialog(
                   context: context,
                   barrierDismissible: false,
                   builder: (context) {
                  return AlertDialog(
                   title: Text("congratulations!"),
                    content: Text("Game Won!"),
                   actions: <Widget>[
                    ElevatedButton(
                    onPressed: () {
                    setState(() {
                     setBoard();
                    });
                    Navigator.pop(context);
                  },
                   child: Text("Play again"),
                 ),
                ],
               );
              },);
                  
                },
                onLongPress: ()
                {
                  print(i.toString()+"-"+j.toString());
                  setState(() {
                    board[i][j].isFlagged= !(board[i][j].isFlagged);
                  });
                  
                },
                child: Square(rowNum: i,colNum: j,))
             // else
             // OpenTile( )
            ],
          ),
        ),
      ),
    );
  }
}

int rows=9;
int cols=9;
int bombs=11;
int remainingTiles=rows*cols;

List<List<BoardSquare>> board= List.generate(rows, (i) {
  return List.generate(cols, (j) {
    return BoardSquare();
  });
});



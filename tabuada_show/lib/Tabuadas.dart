import 'package:flutter/material.dart';

class Tabuadas extends StatefulWidget {
  @override
  _TabuadasState createState() => _TabuadasState();
}

class _TabuadasState extends State<Tabuadas> {

  void _verTabuada(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background2.jpg"),
            fit: BoxFit.fill,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Tabuadas", style: TextStyle(fontSize: 30),),
          centerTitle: true,
        ),

        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(child:
                    CircleAvatar(
                      child: Text("1", style: TextStyle(fontSize: 25, color: Colors.white),),
                      maxRadius: 30,
                      backgroundColor: Colors.orange,
                    ),
                    onTap: _verTabuada,
                  ),

                  CircleAvatar(
                    child: Text("2", style: TextStyle(fontSize: 25, color: Colors.white)),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),

                  CircleAvatar(
                    child: Text("3", style: TextStyle(fontSize: 25, color: Colors.white)),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 20)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Text("TABUADAS"),
                  CircleAvatar(
                    child: Text("4", style: TextStyle(fontSize: 25, color: Colors.white),),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),

                  CircleAvatar(
                    child: Text("5", style: TextStyle(fontSize: 25, color: Colors.white)),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),

                  CircleAvatar(
                    child: Text("6", style: TextStyle(fontSize: 25, color: Colors.white)),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 20)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Text("TABUADAS"),
                  CircleAvatar(
                    child: Text("7", style: TextStyle(fontSize: 25, color: Colors.white),),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),

                  CircleAvatar(
                    child: Text("8", style: TextStyle(fontSize: 25, color: Colors.white)),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),

                  CircleAvatar(
                    child: Text("9", style: TextStyle(fontSize: 25, color: Colors.white)),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 20)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Text("TABUADAS"),
                  CircleAvatar(
                    child: Text("10", style: TextStyle(fontSize: 25, color: Colors.white),),
                    maxRadius: 30,
                    backgroundColor: Colors.orange,
                  ),
                ],
              ),
            ],
          )
          )
        ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _lista = ["Jamilton", "João", "Maria", "Karla"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widgets"),),

      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder: (contex, index){

                final item = _lista[index];

                return Dismissible(
                  background: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        )
                      ],
                    ),
                    color: Colors.red,
                  ),
                  //direction: DismissDirection.vertical,
                  onDismissed: (direction){

                    if(direction == DismissDirection.endToStart){
                      print("Direcao: " + direction.toString());
                    } else if (direction == DismissDirection.startToEnd){
                      print("Direcao: " + direction.toString());
                    }

                    setState(() {
                      _lista.removeAt(index);
                    });
                  },
                  key: Key(item),
                  child: ListTile(
                    title: Text(item),
                  )
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

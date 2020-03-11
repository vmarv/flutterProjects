import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color primaryColor = Color.fromRGBO(255, 82, 48, 1);
  List<String> _meses = ["Meses",
    "Janeiro", "Fevereiro", "Março", "Abril",
    "Maio", "Junho", "Julho", "Agosto",
    "Setembro", "Outubro", "Novembro", "Dezembro"];
  String dropdownValor = "Meses";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: Column(
        children: <Widget>[


          Stack(
            children: <Widget>[
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(color: primaryColor),
                ),
              ),

              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: DropdownButton<String>(
                        value: dropdownValor,
                        icon: Icon(Icons.date_range, color: Colors.black38),
                        iconSize: 20,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.black87,
                            //fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.black38,
                        ),
                        onChanged: (String newValue) {
                          if(newValue != "Meses") {
                            print(newValue);
                            setState(() {
                              dropdownValor = newValue;
                            });
                          }
                        },
                        items: _meses.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                        height: 70,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[500],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0,3),
                                  blurRadius: 15
                              )
                            ]
                        ),
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Receita total:",
                                      style: TextStyle(fontSize: 15,
                                      color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "R\$ 1500,00",
                                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,
                                          color: Colors.white70),
                                    ),
                                  ],
                                )
                              ],
                            )
                        )
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0,3),
                                    blurRadius: 15
                                )
                              ]
                          ),
                          height: 70,
                          width: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Receitas"),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.arrow_drop_up, size: 40, color: Colors.green[700],),
                                  Text(
                                    "R\$ 800,00",
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                                        color: Colors.white70),
                                  ),
                                ],
                              )
                            ],
                          ),

                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0,3),
                                    blurRadius: 15
                                )
                              ]
                          ),
                          height: 70,
                          width: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Despesas"),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.arrow_drop_down, size: 40, color: Colors.red,),
                                  Text(
                                    "R\$ 500,00",
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                                        color: Colors.white70),
                                  ),
                                ],
                              )
                            ],
                          ),

                        ),
                      ),
                    ],
                  )

                ],
              ),

            ],
          ),

        ]
      ),
    );

  }
}




//Efeito do design vermelho arredondado
class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0-200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

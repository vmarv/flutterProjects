import 'package:flutter/material.dart';
import 'package:money_management/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Management',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    Color primaryColor = Color.fromRGBO(255, 82, 48, 1);

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(color: primaryColor),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: (){
                        print("Botão Menu");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: (){
                        print("Botão Notificação");
                      },
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(color: primaryColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('2800,00', style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("Balanço do mês", style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),),
                        ],
                      ),
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue[300],
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DashboardPage()
                            ));
                          },
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Text("TOP UP", style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120, right: 25, left: 25),
                  child: Container(
                    width: double.infinity,
                    height: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0,3),
                          blurRadius: 15
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.purple.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15),
                                      icon: Icon(Icons.send),
                                      color: Colors.purple,
                                      iconSize: 30,
                                      onPressed: (){},
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Enviar", style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.blue.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15),
                                      icon: Icon(Icons.credit_card),
                                      color: Colors.blue,
                                      iconSize: 30,
                                      onPressed: (){},
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Pagar", style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.orange.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15),
                                      icon: Icon(Icons.receipt),
                                      color: Colors.orange,
                                      iconSize: 30,
                                      onPressed: (){},
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Compras", style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.pink.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15),
                                      icon: Icon(Icons.monetization_on),
                                      color: Colors.pink,
                                      iconSize: 30,
                                      onPressed: (){},
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Finanças", style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.purpleAccent.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15),
                                      icon: Icon(Icons.favorite),
                                      color: Colors.purpleAccent,
                                      iconSize: 30,
                                      onPressed: (){},
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Favoritos", style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.deepPurple.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15),
                                      icon: Icon(Icons.attach_money),
                                      color: Colors.deepPurple,
                                      iconSize: 30,
                                      onPressed: (){},
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Retirar", style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Divider(),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              SizedBox(width: 30),
                              Material(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blueAccent.withOpacity(0.1),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  color: Colors.blueAccent,
                                  onPressed: (){},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Text(
                "Upcoming",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, bottom: 25),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    UpcomingCard(title: "Credit Card", value: 280, color: Colors.purple,),
                    UpcomingCard(title: "Credit Card Two", value: 260, color: Colors.blue,),
                    UpcomingCard(title: "Credit Card", value: 215, color: Colors.orange,),
                    UpcomingCard(title: "Credit Card", value: 110, color: Colors.pink,),
                  ],
                ),
              ),
            ),
          ],
        ),
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

class UpcomingCard extends StatelessWidget {

  final String title;
  final double value;
  final Color color;

  UpcomingCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Text("$value", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}




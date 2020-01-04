import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  Color primaryColor = Color.fromRGBO(255, 82, 48, 1);

  @override
  Widget build(BuildContext context) {

    var data = [
      ClickPerMonth("Jan", 30, Colors.purple),
      ClickPerMonth("Fev", 42, Colors.blue),
      ClickPerMonth("Mar", 54, Colors.purple),
      ClickPerMonth("Abr", 20, Colors.blue),
      ClickPerMonth("Mai", 76, Colors.purple),
      ClickPerMonth("Jun", 35, Colors.blue),
    ];

    var series = [
      new charts.Series(
        id: "Clicks",
        data: data,
        domainFn: (ClickPerMonth clickData, _) => clickData.month,
        measureFn: (ClickPerMonth clickData, _) => clickData.clicks,
        colorFn: (ClickPerMonth clickData, _) => clickData.color
      )
    ];

    var chart = new charts.BarChart(series,
      animate: true, animationDuration: Duration(milliseconds: 1500),
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32),
      child: SizedBox(height: 180, child: chart),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 30, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black54,
                      iconSize: 30,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      color: Colors.black54,
                      iconSize: 30,
                      onPressed: (){
                        print("Botão Notificação");
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Text("Dashboard", style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                fontSize: 32
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: double.infinity,
                height: 370,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 0.3),
                      blurRadius: 15
                    )
                  ]
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("2800,00", style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 15),
                              Text("Balanço do mês", style: TextStyle(
                                color: Colors.white,
                                fontSize: 14
                              ),)
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.show_chart),
                            onPressed: (){},
                            color: Colors.white,
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                    chartWidget
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 30),
              child: Text("Atividades Recentes", style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.orange.withOpacity(0.1),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text("MA", style: TextStyle(
                            color: Colors.orange,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Load Actinity", style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                            Text("Request Money", style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      Text(" 360.0", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(),
                  ),
                  Row(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.purple.withOpacity(0.1),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text("JO", style: TextStyle(
                              color: Colors.purple,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Load Actinity", style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("Sent Money", style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      Text("- 240.0", style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClickPerMonth {
  final String month;
  final int clicks;
  final charts.Color color;

  ClickPerMonth(this.month, this.clicks, Color color)
    : this.color = new charts.Color(
    r: color.red, g: color.green, b: color.blue, a: color.alpha);
}


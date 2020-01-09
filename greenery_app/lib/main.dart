import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenery NYC',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

var greenColor = Color(0xff32a05f);
var darkGreenColor = Color(0xff279152);
var productImage = "https://i.pinimg.com/originals/8f/bf/44/8fbf441fa92b29ebd0f324effbd4e616.png";

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16,),
                    Icon(Icons.arrow_back),
                    //SizedBox(height: 2,),
                    Container(
                      width: 300,
                      child: Text(
                        "Fiddle Leaf Fig Topiary",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      '10" Nursery Por',
                      style: TextStyle(color: Colors.black45),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("\$", style: TextStyle(color: greenColor, fontSize: 24, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(width: 4,),
                        Text("85", style: TextStyle(color: greenColor, fontWeight: FontWeight.bold, fontSize: 52),),
                      ],
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailsScreen()
                            ));
                          },
                          backgroundColor: greenColor,
                          child: Icon(Icons.shopping_cart),
                        ),
                        Container(
                          width: 165,
                          child: Image.network(productImage, fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                    SizedBox(height: 58,)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 14,),
                  Text("Planting", style: TextStyle(color: Colors.white),),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        decoration: BoxDecoration(
                          color: darkGreenColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("250", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 42),),
                                SizedBox(width: 8,),
                                Text("ml", style: TextStyle(color: Colors.white54),)
                              ],
                            ),
                            Text("water", style: TextStyle(color: Colors.white54),)
                          ],
                        )
                      ),
                      Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2 - 50,
                          decoration: BoxDecoration(
                            color: darkGreenColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("18", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 42),),
                                  SizedBox(width: 8,),
                                  Text("c", style: TextStyle(color: Colors.white54),)
                                ],
                              ),
                              Text("sunshine", style: TextStyle(color: Colors.white54),)
                            ],
                          )
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("greenery nyc", style: TextStyle(color: Colors.white, letterSpacing: 1.1, fontSize: 22),),
                SizedBox(height: 32,),
                Container(
                  width: 200,
                  child: Text("Product Overview", style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 48),),
                ),
                SizedBox(height: 42,),
                itemRow(Icons.star, "water", "every 7 days"),
                SizedBox(height: 20,),
                itemRow(Icons.ac_unit, "Humidity", "up to 82%"),
                SizedBox(height: 20,),
                itemRow(Icons.straighten, "Size", "38\" - 48\"tdll"),
              ],
            ),
          ),
          SizedBox(height: 32,),
          Padding(
            padding: const EdgeInsets.only(left: 48),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: darkGreenColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                )
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  Icon(Icons.add, color: Colors.white, size: 24,),
                  SizedBox(width: 20,),
                  Text("Delivery Information", style: TextStyle(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500
                  ),),
                  SizedBox(width: 20,),

                ],
              ),
            ),
          ),
          SizedBox(height: 32,),
          Padding(
            padding: const EdgeInsets.only(left: 48),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: darkGreenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  )
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  Icon(Icons.add, color: Colors.white, size: 24,),
                  SizedBox(width: 20,),
                  Text("Return Policy", style: TextStyle(
                      color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500
                  ),),

                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Icon(Icons.arrow_drop_down, color: Colors.white,),
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Color(0xff2c2731),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(32))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_shopping_cart, color: Colors.white,),
                      SizedBox(width: 6,),
                      Text("add to cart", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

itemRow(icon, name, title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: <Widget>[
          Icon(icon, color: Colors.white,),
          SizedBox(width: 6,),
          Text(name, style: TextStyle(color: Colors.white, fontSize: 20),)
        ],
      ),
      Text(title, style: TextStyle(color: Colors.white54))
    ],
  );
}





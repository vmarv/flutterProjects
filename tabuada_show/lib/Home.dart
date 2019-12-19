import 'package:flutter/material.dart';
import 'package:tabuada_show/Tabuadas.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[],
  );

  @override
  Widget build(BuildContext context) {

    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-6083033138957460~8596064413");
    myBanner..load()..show();

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
          //title: Text("Meu App"),
        ),

        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png", scale: 2,),
              SizedBox(
                height: 45,
                width: 130,
                child: RaisedButton(
                  elevation: 5,
                  color: Colors.orange,
                  textColor: Colors.white,
                  child: Text(
                      "Jogar",
                    style: TextStyle(
                     fontSize: 28
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, "/tabuadas");
                  },
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 30),),

              SizedBox(
                height: 45,
                width: 130,
                child: RaisedButton(
                  elevation: 5,
                  color: Colors.orange,
                  textColor: Colors.white,
                  child: Text(
                    "Tabuada",
                    style: TextStyle(
                        fontSize: 28
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, "/tabuadas");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['games', 'pubg'],
  contentUrl: 'https://flutter.io',
  //birthday: DateTime.now(),
  childDirected: false,
  //designedForFamilies: false,
  //gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "ca-app-pub-6083033138957460/8037649182",
  size: AdSize.banner,//.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);
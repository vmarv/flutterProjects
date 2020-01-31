import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _posicaoCamera = CameraPosition(
      target: LatLng(-23.563370, -46.652923),
      zoom: 16);

  Set<Marker> _marcadores = {};
  Set<Polygon> _polygons = {};
  Set<Polyline> _polylines = {};

  _onMapCreated(GoogleMapController googleMapController) {

    _controller.complete(googleMapController);

  }

  _movimentarCamera() async {

    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        _posicaoCamera
      )
    );

  }

  _carregarMarcadores() {

    // marcadores
   /* Set<Marker> marcadoresLocal = {};

    Marker marcadorShopping = Marker(
      markerId: MarkerId("marcador-shop"),
      position: LatLng(-23.563370, -46.652923),
      infoWindow: InfoWindow(title: "Shoping Cidade de SP"),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueMagenta
      ),
      onTap: (){print("shop cliclado");}
      //rotation: 45
    );

    Marker marcadorCartorio = Marker(
        markerId: MarkerId("marcador-cartorio"),
        position: LatLng(-23.562868, -46.655874),
        infoWindow: InfoWindow(title: "Cartorio Cidade de SP"),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue
      ),
      onTap: (){print("cartorio cliclado");}
    );

    marcadoresLocal.add(marcadorShopping);
    marcadoresLocal.add(marcadorCartorio);

    setState(() {
      _marcadores = marcadoresLocal;
    });*/

/*
   // Poligons
    Set<Polygon> listaPolygons = {};
    Polygon polygon1 = Polygon(
      polygonId: PolygonId("polygon1"),
      fillColor: Colors.green,
      strokeColor: Colors.red,
      strokeWidth: 10,
      points: [
        LatLng(-23.561816, -46.652044),
        LatLng(-23.563625, -46.653642),
        LatLng(-23.564786, -46.652226),
        LatLng(-23.563085, -46.650531),
      ],
      consumeTapEvents: true,
      onTap: (){
        print("clicado na area");
      },
    zIndex: 2
    );

    Polygon polygon2 = Polygon(
        polygonId: PolygonId("polygon2"),
        fillColor: Colors.purple,
        strokeColor: Colors.orange,
        strokeWidth: 10,
        points: [
          LatLng(-23.561629, -46.653031),
          LatLng(-23.565789, -46.651872),
          LatLng(-23.562032, -46.650831),

        ],
        consumeTapEvents: true,
        onTap: (){
          print("clicado na area");
        },
      zIndex: 1
    );
    
    listaPolygons.add(polygon1);
    listaPolygons.add(polygon2);

    setState(() {
      _polygons = listaPolygons;
    });*/


    // Polyline
    Set<Polyline> listaPolylines = {};
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: Colors.red,
      width: 20,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      jointType: JointType.round,
      points: [
        LatLng(-23.561795, -46.656232),
        LatLng(-23.566076, -46.650802),
        LatLng(-23.562926, -46.647756),
      ],
      consumeTapEvents: true,
      onTap: (){
        print("cliclado na area");
      }
    );

    listaPolylines.add(polyline);
    setState(() {
      _polylines = listaPolylines;
    });

  }


  _recuperarLocalizazaoAtual() async {

    Position position = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );

    setState(() {
      _posicaoCamera = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 17
      );
      _movimentarCamera();
    });
    
    //print("Localização atual: " + position.toString());

  }

  _adicionarListenerLocalizacao() {

    var geolocator = Geolocator();
    var locationOptions = LocationOptions(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10
    );

    geolocator.getPositionStream(locationOptions).listen((Position position){

      print("Localização atual: " + position.toString());

      Marker marcadorUsuario = Marker(
          markerId: MarkerId("marcador-usuario"),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(title: "Meu local"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta
          ),
          onTap: (){print("Local cliclado");}
        //rotation: 45
      );

      setState(() {
        _marcadores.add(marcadorUsuario);
        _posicaoCamera = CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 16
        );
        _movimentarCamera();
      });

    });

  }

  _recuperarLocalParaEndereco () async {

    List<Placemark> listaEnderecos = await Geolocator().placemarkFromAddress("Av. Paulista, 1372");

    print("Total: " + listaEnderecos.length.toString());

    if(listaEnderecos != null && listaEnderecos.length > 0 ) {

      Placemark endereco = listaEnderecos[0];

      String resultado;

      resultado = "\n administrativeArea " + endereco.administrativeArea;
      resultado += "\n subAdministrativeArea " + endereco.subAdministrativeArea;
      resultado += "\n locality " + endereco.locality;
      resultado += "\n subLocality " + endereco.subLocality;
      resultado += "\n thoroughfare " + endereco.thoroughfare;
      resultado += "\n subThoroughfare " + endereco.subThoroughfare;
      resultado += "\n postalCode " + endereco.postalCode;
      resultado += "\n country " + endereco.country;
      resultado += "\n isoCountryCode " + endereco.isoCountryCode;
      resultado += "\n position " + endereco.position.toString();

      print("Resultado: " + resultado);

    }
  }


  _recuperarEnderecoParaLatLong () async {

    List<Placemark> listaEnderecos = await Geolocator().placemarkFromCoordinates(-23.562712, -46.654726);

    print("Total: " + listaEnderecos.length.toString());

    if(listaEnderecos != null && listaEnderecos.length > 0 ) {

      Placemark endereco = listaEnderecos[0];

      String resultado;

      resultado = "\n administrativeArea " + endereco.administrativeArea;
      resultado += "\n subAdministrativeArea " + endereco.subAdministrativeArea;
      resultado += "\n locality " + endereco.locality;
      resultado += "\n subLocality " + endereco.subLocality;
      resultado += "\n thoroughfare " + endereco.thoroughfare;
      resultado += "\n subThoroughfare " + endereco.subThoroughfare;
      resultado += "\n postalCode " + endereco.postalCode;
      resultado += "\n country " + endereco.country;
      resultado += "\n isoCountryCode " + endereco.isoCountryCode;
      resultado += "\n position " + endereco.position.toString();

      print("Resultado: " + resultado);
      //-23.562712, Long: -46.654726

    }
  }



  @override
  void initState() {
    super.initState( );
    //_carregarMarcadores();
    //_recuperarLocalizazaoAtual();
    //_adicionarListenerLocalizacao();
    //_recuperarLocalParaEndereco();
    _recuperarEnderecoParaLatLong();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas e geolocalização"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: _movimentarCamera,
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _posicaoCamera,
          //-7.143837, -34.837720
          //-7.186436, -34.844635
          /*initialCameraPosition: CameraPosition(
            target: LatLng(-23.563370, -46.652923),
            zoom: 16
          ),*/
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          markers: _marcadores,
          //polygons: _polygons,
          //polylines: _polylines,
        ),
      ),
    );
  }
}

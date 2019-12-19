import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/detalhe_empresa.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a empresa",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas accumsan mi et enim "
                    "vehicula consectetur tristique vel augue. Cras feugiat odio ac arcu efficitur rhoncus. Curabitur "
                    "posuere, mauris sit amet vulputate congue, nisl ipsum pellentesque felis, at lobortis ex lacus nec "
                    "diam. Etiam dictum nibh risus, in mollis lacus mollis sed. Fusce quis porttitor arcu, pharetra congue "
                    "mi. Donec ac nibh mattis, fringilla nibh in, vehicula lorem. Fusce mi nulla, iaculis et hendrerit porttitor,"
                    " dapibus vitae tortor. Phasellus mollis lorem vitae metus semper porttitor. Phasellus vitae hendrerit diam, "
                    "posuere, mauris sit amet vulputate congue, nisl ipsum pellentesque felis, at lobortis ex lacus nec "
                    "diam. Etiam dictum nibh risus, in mollis lacus mollis sed. Fusce quis porttitor arcu, pharetra congue "
                    "mi. Donec ac nibh mattis, fringilla nibh in, vehicula lorem. Fusce mi nulla, iaculis et hendrerit porttitor,"
                    " dapibus vitae tortor. Phasellus mollis lorem vitae metus semper porttitor. Phasellus vitae hendrerit diam, "
                    "posuere, mauris sit amet vulputate congue, nisl ipsum pellentesque felis, at lobortis ex lacus nec "
                    "diam. Etiam dictum nibh risus, in mollis lacus mollis sed. Fusce quis porttitor arcu, pharetra congue "
                    "mi. Donec ac nibh mattis, fringilla nibh in, vehicula lorem. Fusce mi nulla, iaculis et hendrerit porttitor,"
                    " dapibus vitae tortor. Phasellus mollis lorem vitae metus semper porttitor. Phasellus vitae hendrerit diam, "
                    "ac rhoncus erat.", textAlign: TextAlign.justify,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

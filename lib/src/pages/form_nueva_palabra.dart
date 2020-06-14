import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../pages/palabra.dart';

class FormularioNuevaPalabra extends StatefulWidget {
  @override
  _FormularioNuevaPalabraState createState() => _FormularioNuevaPalabraState();
}

class _FormularioNuevaPalabraState extends State<FormularioNuevaPalabra> {

  final _formKey = GlobalKey<FormState>();

  String _nombre;
  String _traduccion;

  void agregarPalabra(Palabra palabra){
    final palabraBox = Hive.box('palabras');
    palabraBox.add(palabra);
  }

  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: _controller1,
                  decoration: InputDecoration(labelText: 'Palabra'),
                  onSaved: (value) =>  _nombre = value
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: _controller2,
                  decoration: InputDecoration(labelText: 'Traducción'),
                  onSaved: (value) => _traduccion = value.toLowerCase(),
                ),
              ),
              SizedBox(width: 10),
            ],

          ),
          SizedBox(height: 10,),
          RaisedButton(
            color: Colors.blue,
            child: Text('Agregar palabra nueva', style: TextStyle(fontSize: 15, color: Colors.white),),
            onPressed: () {
              _formKey.currentState.save();
              if(_nombre != '' && _traduccion != '' ) {
                final nuevaPalabra = Palabra(_nombre, _traduccion);
                agregarPalabra(nuevaPalabra);
                _controller1.clear();
                _controller2.clear();
              }
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import '../pages/propiedades.dart';
import 'palabras_aleatorias.dart';


class PracticaPage extends StatefulWidget {
  @override
  _PracticaPageState createState() => _PracticaPageState();
}

class _PracticaPageState extends State<PracticaPage> {

  final data = Data(
  numIngresado: null,
  numMaximo: null
  );

  final palabrasBox = Hive.box('palabras');

  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practicar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30.0),
            Container(
              width: 250,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Máximo: '+palabrasBox.length.toString(),
                    labelText: 'Cantidad de palabras aleatorias'
                ),
              ) ,
            ),
            SizedBox(height: 30.0),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)
              ),
              color: Colors.blue,
              onPressed: () {
                data.numMaximo = palabrasBox.length;
                data.numIngresado = int.parse(myController.text);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PalabrasAleatorias(
                    data: data
                  )
                )
                );
              },
              child: Text('Empezar', style: TextStyle(fontSize: 20.0, color: Colors.white)),
            ),
          ],
        )
      )
    );
  }
}

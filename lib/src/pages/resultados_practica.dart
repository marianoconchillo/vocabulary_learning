import 'package:flutter/material.dart';
import 'package:learningvocabulary/src/pages/palabra.dart';

import 'propiedades_practica.dart';

class ResultadosPractica extends StatelessWidget {

  Propiedades propiedades;
  ResultadosPractica({this.propiedades});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
      ),
      body: Center(
        child: Container(
          width: 330,
          child: ListView(
            children: _listaPalabras()
          ),
        ),
      ),
    );
  }

  List<Widget> _listaPalabras() {
    List<Widget> lista = List();
    lista.add(SizedBox(height: 10));

    for (var i = 0; i < this.propiedades.miListaPalabras.length; i++) {
      final palabra = this.propiedades.miListaPalabras[i];
      final respuesta = this.propiedades.miListaControladores[i].text.toString();
      if (palabra.traduccion.toLowerCase() == respuesta.toLowerCase()) {
        final tempWidget = Card(
          color: Colors.green,
            child: ListTile(
            title: Text(palabra.nombre.toString().toUpperCase(), style: TextStyle(color: Colors.white),),
            subtitle: Text(palabra.traduccion.toString(),
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
            trailing: Icon(
                Icons.check
            )
        )
        );
        lista.add(tempWidget);
        lista.add(SizedBox(height: 10));
      } else {
        final tempWidget = Card(
          shadowColor: Colors.redAccent,
            child: ListTile(
            title: Text(palabra.nombre.toString().toUpperCase()),
            subtitle: Text('Tu respuesta: '+respuesta.toLowerCase()+ ', correcta: '+palabra.traduccion.toString(),
                style: TextStyle(fontStyle: FontStyle.italic)),
            trailing: Icon(
                Icons.cancel
            )
        )
        );
        lista.add(tempWidget);
        lista.add(SizedBox(height: 10));
      }
    }
    return lista;
  }
}

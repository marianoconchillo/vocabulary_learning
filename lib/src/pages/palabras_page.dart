import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../pages/form_nueva_palabra.dart';
import 'package:hive/hive.dart';
import '../pages/palabra.dart';

class PalabrasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Palabras'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _listaPalabras(),),
            FormularioNuevaPalabra()
          ],
        )
    );
  }

Widget _listaPalabras() {
  return WatchBoxBuilder(
    box: Hive.box('palabras'),
    builder: (context, palabrasBox) {
      return ListView.builder(
        itemCount: palabrasBox.length,
        itemBuilder: (context, index) {
          final palabra = palabrasBox.getAt(0) as Palabra;
          if(palabra == null){
            return ListView();
          } else {
            final palabra2 = palabrasBox.getAt(index) as Palabra;
              return Card( child: ListTile(
                  title: Text(palabra2.nombre.toString().toUpperCase()),
                  subtitle: Text(palabra2.traduccion.toString(),
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      palabrasBox.deleteAt(index);
                    },
                  )
              )
              );
          }
        },
      );
    },
  );
}

}

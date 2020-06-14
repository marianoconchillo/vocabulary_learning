import 'package:flutter/material.dart';

import '../pages/practica_page.dart';
import '../pages/palabras_page.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final hive = Hive.openBox('palabras');

    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabulario')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)
                ),
                color: Colors.blue,
                onPressed: () {

                  final route = MaterialPageRoute(
                      builder: (context) => PracticaPage()
                  );
                  Navigator.push(context, route);
                },
                child: Text('Practicar', style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 200,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)
                ),
                color: Colors.blue,
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) => PalabrasPage()
                  );
                  Navigator.push(context, route);
                },
                child: Text('Palabras', style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }


}

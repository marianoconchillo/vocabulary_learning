import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learningvocabulary/src/pages/palabra.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import './src/pages/home_page.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(PalabraAdapter(),0);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learning Vocabulary',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home: FutureBuilder(
          future: Hive.openBox('palabras'),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return Text(snapshot.error.toString());
              } else {
                return HomePage();
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        )
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}

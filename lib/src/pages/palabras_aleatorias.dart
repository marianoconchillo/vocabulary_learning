import 'package:flutter/material.dart';
import 'propiedades.dart';
import 'palabra.dart';

import 'package:hive/hive.dart';
import 'dart:math';
import 'propiedades_practica.dart';
import 'resultados_practica.dart';

class PalabrasAleatorias extends StatefulWidget {
  @override
  _PalabrasAleatoriasState createState() => _PalabrasAleatoriasState();

  Data data;
  PalabrasAleatorias({this.data});
}

class _PalabrasAleatoriasState extends State<PalabrasAleatorias> {

  Data data;
  List<TextEditingController> listaControladores;
  List<Palabra> listaPalabras = List();

  final propiedades = Propiedades (
    miListaPalabras: null,
    miListaControladores: null
  );

   // Creating initState()
  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Practicando'),
        ),
        body: Center(
          child: Container(
            width: 330,
            child: ListView(
              children: _listaPalabras()
            ),
          ),
        ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          propiedades.miListaControladores = listaControladores;
          propiedades.miListaPalabras = listaPalabras;
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ResultadosPractica (
                propiedades: propiedades,
              )
          )
          );
        },
        child: new Icon(Icons.check),
      ),
    );
  }

  List<Widget> _listaPalabras() {
    // Recupero el box 'palabras'.
    final palabrasBox = Hive.box('palabras');
    // Creo una nueva lista que va a contener los números random para verificar que no se repitan.
    final List listaRandom = new List();
    // Instancia de Random()
    final _random = new Random();
    // Lista de widgets que voy a retornar
    List<Widget> lista = new List<Widget>();
    // Agrego un SizedBox arriba.
    lista.add(SizedBox(height: 10));
    // Verifico que el número ingresado no sea mayor al número máximo.
    if(data.numIngresado > data.numMaximo){
      data.numIngresado = data.numMaximo;
    }
    // Lista de controladores
    listaControladores = _listaControladores(data.numIngresado);

   for (var i = 0; i < data.numIngresado; i++) {
      int randomNumber = _random.nextInt(data.numMaximo);
      while(listaRandom.contains(randomNumber)){
        randomNumber = _random.nextInt(data.numMaximo);
      }
      listaRandom.add(randomNumber);
      final palabra = palabrasBox.getAt(randomNumber) as Palabra;
      final tempWidget = TextFormField(
        controller: listaControladores[i],
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              labelText: palabra.nombre.toLowerCase()
          ),
        );
      lista.add(tempWidget);
      lista.add(SizedBox(height: 10));
      listaPalabras.add(palabra);
    }
    return lista;
  }

  List<TextEditingController> _listaControladores(int numIngresado) {
    List<TextEditingController> lista = new List();
      for(var i=0; i < numIngresado; i++) {
        final controller = TextEditingController();
        lista.add(controller);
      }
      return lista;
  }
}

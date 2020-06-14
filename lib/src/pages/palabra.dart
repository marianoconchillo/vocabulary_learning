import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'palabra.g.dart';

@HiveType()
class Palabra {
  @HiveField(0)
   String nombre;
  @HiveField(1)
   String traduccion;

  Palabra (this.nombre,this.traduccion);
}
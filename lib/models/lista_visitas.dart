import 'package:flutter/material.dart';
import 'package:tcc/models/visita.dart';

class ListaVisitas {
  ListaVisitas({visitas}) {
    visitas = visitas;
  }

  List<Visita> visitas = [];

  void addVisita(Visita visita) {
    visitas.add(visita);
  }

  ListaVisitas.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      debugPrint(value.toString());
      if (key != 'updated' && key != 'created') {
        visitas.add(Visita.fromJson(value));
      }
    });
  }

  List<Map<String, dynamic>> toJson() {
    List<Map<String, dynamic>> data = [];
    for (var visita in visitas) {
      data.add(visita.toJson());
    }
    return data;
  }
}
